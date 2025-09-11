package org.jgdlbe.favorite.repository;

import org.jgdlbe.favorite.entity.DepositFavoriteEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface DepositFavoriteRepository extends JpaRepository<DepositFavoriteEntity, UUID> {
    boolean existsByUserIdAndDepositId(UUID userId, UUID depositId);
    Optional<DepositFavoriteEntity> findByUserIdAndDepositId(UUID userId, UUID depositId);

    @Transactional
    long deleteByUserIdAndDepositId(UUID userId, UUID depositId);

    List<DepositFavoriteEntity> findByUserId(UUID userId);

}
