package org.jgdlbe.product.repository;

import org.jgdlbe.product.entity.DepositProduct;
import org.jgdlbe.product.entity.DepositRate;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface DepositRateRepository extends JpaRepository<DepositRate, UUID> {
    void deleteByProduct(DepositProduct product);
}
