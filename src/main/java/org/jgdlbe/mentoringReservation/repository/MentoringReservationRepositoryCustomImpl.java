package org.jgdlbe.mentoringReservation.repository;

import static org.jgdlbe.example.entity.QExampleEntity.exampleEntity;
import static org.jgdlbe.mentoringReservation.entity.QMentoringReservationEntity.mentoringReservationEntity;
import static org.jgdlbe.user.entity.QUserEntity.userEntity;

import com.querydsl.core.types.Expression;
import com.querydsl.core.types.Order;
import com.querydsl.core.types.OrderSpecifier;
import com.querydsl.core.types.Projections;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.jgdlbe.mentoringReservation.dto.MentoringReservationDTO;
import org.jgdlbe.mentoringReservation.dto.MentoringReservationFilterDTO;
import org.jgdlbe.mentoringReservation.entity.MentoringReservationEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

@RequiredArgsConstructor
public class MentoringReservationRepositoryCustomImpl implements
    MentoringReservationRepositoryCustom {

    private final JPAQueryFactory queryFactory;

    @Override
    public Page<MentoringReservationDTO> findByFilter(MentoringReservationFilterDTO filter,
        Pageable pageable) {

        List<MentoringReservationDTO> dtoList = queryFactory
            .select(Projections.constructor(MentoringReservationDTO.class,
                mentoringReservationEntity.mentoringReservationId,
                mentoringReservationEntity.mentorUserId,
                mentoringReservationEntity.menteeUserId,
                mentoringReservationEntity.mentoringTime,
                mentoringReservationEntity.mentoringDate,
                mentoringReservationEntity.consultationCard,
                mentoringReservationEntity.chatStatus,
                getUserName(filter) // 상대방 이름
            ))
            .from(mentoringReservationEntity)
            .leftJoin(userEntity)
            .on(getUserJoinCondition(filter))
            .where(
                mentorUserIdEq(filter.getMentorUserId()),
                menteeUserIdEq(filter.getMenteeUserId())
            )
            .orderBy(getOrderSpecifiers(pageable.getSort()))
            .offset(pageable.getOffset())
            .limit(pageable.getPageSize())
            .fetch();

        Long total = queryFactory.select(mentoringReservationEntity.count())
            .from(mentoringReservationEntity)
            .where(
                mentorUserIdEq(filter.getMentorUserId()),
                menteeUserIdEq(filter.getMenteeUserId())
            )
            .fetchOne();

        return new PageImpl<>(dtoList, pageable, total != null ? total : 0);
    }

    private BooleanExpression getUserJoinCondition(MentoringReservationFilterDTO filter) {
        if (filter.getMentorUserId() != null) {
            // 멘토 기준 조회 -> 멘티 이름 가져오기
            return userEntity.userId.eq(mentoringReservationEntity.menteeUserId);
        } else if (filter.getMenteeUserId() != null) {
            // 멘티 기준 조회 -> 멘토 이름 가져오기
            return userEntity.userId.eq(mentoringReservationEntity.mentorUserId);
        }
        return null;
    }

    // 상대방 이름 가져오기
    private Expression<String> getUserName(MentoringReservationFilterDTO filter) {
        return userEntity.name;
    }

    private BooleanExpression mentorUserIdEq(UUID id){
        return id != null ? mentoringReservationEntity.mentorUserId.eq(id) : null;
    }

    private BooleanExpression menteeUserIdEq(UUID id){
        return id != null ? mentoringReservationEntity.menteeUserId.eq(id) : null;
    }

    private OrderSpecifier<?>[] getOrderSpecifiers(Sort sort) {
        List<OrderSpecifier<?>> result = new ArrayList<>();

        if (sort != null) {
            for (Sort.Order order : sort) {
                Order direction = order.getDirection().isAscending() ? Order.ASC : Order.DESC;
                result.add(new OrderSpecifier(direction,
                    Expressions.path(Object.class, mentoringReservationEntity, order.getProperty())));
            }
        }

        return result.toArray(OrderSpecifier[]::new);
    }
}
