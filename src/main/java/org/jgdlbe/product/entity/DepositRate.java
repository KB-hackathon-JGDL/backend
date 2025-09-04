package org.jgdlbe.product.entity;


import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.UuidGenerator;

import java.math.BigDecimal;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "deposit_rate")
public class DepositRate {
    @Id
    @GeneratedValue
    @UuidGenerator
    @Column(name = "uuid", columnDefinition = "BINARY(16)")
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", nullable = false, columnDefinition = "BINARY(16)")
    private DepositProduct product;

    @Column(name = "int_rate_type", length = 1)       private String intRateType;    // 'S'단리 / 'M'복리
    @Column(name = "intr_rate_type_nm")               private String intrRateTypeNm; // 금리유형명
    @Column(name = "save_trm")                        private Short saveTrm;         // 저축기간(개월)
    @Column(name = "intr_rate", precision = 5, scale = 3)  private BigDecimal intrRate;   // 기본금리
    @Column(name = "intr_rate2", precision = 5, scale = 3) private BigDecimal intrRate2;  // 최고우대금리
}
