package org.jgdlbe.product.repository;

import org.jgdlbe.product.entity.DepositProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface DepositProductRepository extends JpaRepository<DepositProduct, UUID> {
    Optional<DepositProduct> findByFinPrdtCd(String finPrdtCd);

    @Query("""
           SELECT p FROM DepositProduct p
           WHERE p.profile IS NOT NULL
             AND LOWER(TRIM(p.profile)) = LOWER(TRIM(:profile))
           """)
    List<DepositProduct> findByProfileNormalized(@Param("profile") String profile);
}
