package org.jgdlbe.favorite.repository;

import org.jgdlbe.favorite.entity.SupplyFavoriteEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface SupplyFavoriteRepository extends JpaRepository<SupplyFavoriteEntity, UUID> {
    boolean existsByUserIdAndProgramId(UUID userId, UUID programId);
    Optional<SupplyFavoriteEntity> findByUserIdAndProgramId(UUID userId, UUID programId);

    @Transactional
    long deleteByUserIdAndProgramId(UUID userId, UUID programId);

    List<SupplyFavoriteEntity> findByUserId(UUID userId);
}
