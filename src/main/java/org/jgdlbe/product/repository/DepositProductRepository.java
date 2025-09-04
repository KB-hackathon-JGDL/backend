package org.jgdlbe.product.repository;

import org.jgdlbe.product.entity.DepositProduct;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface DepositProductRepository extends JpaRepository<DepositProduct, UUID> {
    Optional<DepositProduct> findByFinPrdtCd(String finPrdtCd);
}
