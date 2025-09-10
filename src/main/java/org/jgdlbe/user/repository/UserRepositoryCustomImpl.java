package org.jgdlbe.user.repository;

import static org.jgdlbe.example.entity.QExampleEntity.exampleEntity;
import static org.jgdlbe.mentoringReservation.entity.QMentoringReservationEntity.mentoringReservationEntity;
import static org.jgdlbe.user.entity.QUserEntity.userEntity;

import com.querydsl.core.types.Order;
import com.querydsl.core.types.OrderSpecifier;
import com.querydsl.core.types.Projections;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import java.util.ArrayList;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.jgdlbe.example.dto.ExampleFilterDTO;
import org.jgdlbe.example.entity.ExampleEntity;
import org.jgdlbe.example.repository.ExampleRepositoryCustom;
import org.jgdlbe.user.domain.UserRole;
import org.jgdlbe.user.dto.MentorInfoDTO;
import org.jgdlbe.user.dto.UserDTO;
import org.jgdlbe.user.dto.UserFilterDTO;
import org.jgdlbe.user.entity.UserEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

@RequiredArgsConstructor
public class UserRepositoryCustomImpl implements
    UserRepositoryCustom {

    private final JPAQueryFactory queryFactory;

    @Override
    public Page<UserDTO> findByFilter(UserFilterDTO filterDTO, Pageable pageable) {

        List<UserDTO> entityList = queryFactory.select(
                Projections.constructor(UserDTO.class,
                    userEntity.userId,
                    userEntity.name,
                    userEntity.userRole,
                    userEntity.birthDate,
                    userEntity.phone,
                    userEntity.region,
                    userEntity.info,
                    userEntity.businessField,
                    userEntity.career,
                    userEntity.credentials))
            .from(userEntity)
            .where(
                userRoleEq(filterDTO.getUserRole())
            )
            .orderBy(getOrderSpecifiers(pageable.getSort()))
            .offset(pageable.getOffset())
            .limit(pageable.getPageSize())
            .fetch();

        Long total = queryFactory.select(userEntity.count())
            .from(userEntity)
            .where(
                userRoleEq(filterDTO.getUserRole())
            )
            .fetchOne();

        return new PageImpl<>(entityList, pageable, total != null ? total : 0);
    }

    private BooleanExpression userRoleEq(UserRole userRole) {
        return userRole != null ? userEntity.userRole.eq(userRole) : null;
    }

    private OrderSpecifier<?>[] getOrderSpecifiers(Sort sort) {
        List<OrderSpecifier<?>> result = new ArrayList<>();

        if (sort != null) {
            for (Sort.Order order : sort) {
                Order direction = order.getDirection().isAscending() ? Order.ASC : Order.DESC;
                result.add(new OrderSpecifier(direction,
                    Expressions.path(Object.class, userEntity, order.getProperty())));
            }
        }

        return result.toArray(OrderSpecifier[]::new);
    }

}
