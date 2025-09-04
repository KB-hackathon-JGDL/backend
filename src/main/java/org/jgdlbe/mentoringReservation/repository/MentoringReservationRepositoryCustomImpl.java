package org.jgdlbe.mentoringReservation.repository;

import static org.jgdlbe.example.entity.QExampleEntity.exampleEntity;
import static org.jgdlbe.mentoringReservation.entity.QMentoringReservationEntity.mentoringReservationEntity;

import com.querydsl.core.types.Order;
import com.querydsl.core.types.OrderSpecifier;
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
    public Page<MentoringReservationEntity> findByFilter(MentoringReservationFilterDTO filter,
        Pageable pageable) {

        List<MentoringReservationEntity> entityList = queryFactory.selectFrom(
            mentoringReservationEntity)
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

        return new PageImpl<>(entityList, pageable, total != null ? total : 0);
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
