// src/main/java/org/jgdlbe/product/repository/CardInfoRepository.java
package org.jgdlbe.product.repository;

import org.jgdlbe.product.entity.CardInfo;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface CardInfoRepository extends JpaRepository<CardInfo, UUID> {

    @EntityGraph(attributePaths = "benefits")
    List<CardInfo> findByProfile(String profile);


    @EntityGraph(attributePaths = "benefits")
    Optional<CardInfo> findWithBenefitsByCardId(UUID cardId);

    @EntityGraph(attributePaths = "benefits")
    List<CardInfo> findByCardIdIn(Collection<UUID> ids);
}
