package org.jgdlbe.favorite.repository;

import org.jgdlbe.favorite.entity.CardFavoriteEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface CardFavoriteRepository extends JpaRepository<CardFavoriteEntity, UUID> {
    boolean existsByUserIdAndCardId(UUID userId, UUID cardId);
    Optional<CardFavoriteEntity> findByUserIdAndCardId(UUID userId, UUID cardId);
    @Transactional
    long deleteByUserIdAndCardId(UUID userId, UUID cardId);

    List<CardFavoriteEntity> findByUserId(UUID userId);

}
