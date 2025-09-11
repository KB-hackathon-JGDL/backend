package org.jgdlbe.product.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.UuidGenerator;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = "rates")
@Entity
@Table(
        name = "deposit_product",
        uniqueConstraints = @UniqueConstraint(name = "uk_fin_prdt_cd", columnNames = "fin_prdt_cd")
)
public class DepositProduct {

    @Id
    @GeneratedValue
    @UuidGenerator
    @Column(name = "product_id", columnDefinition = "BINARY(16)")
    private UUID id;

    @Column(name = "kor_co_nm", length = 200)
    private String korCoNm;        // 금융회사명

    @Column(name = "fin_prdt_nm", length = 200)
    private String finPrdtNm;      // 금융상품명

    @Column(name = "mtrt_int", columnDefinition = "TEXT")
    private String mtrtInt;        // 만기후이자율(설명형)

    @Column(name = "spd_cnd", columnDefinition = "TEXT")
    private String spdCnd;         // 우대조건 (ERD 컬럼명 spd_cnd에 맞춤)

    @Column(name = "join_member")
    private String joinMember;     // 가입대상

    @Column(name = "etc_note", columnDefinition = "TEXT")
    private String etcNote;        // 기타유의사항

    @Column(name = "max_limit")
    private Long maxLimit;         // 최고한도 (null 가능)

    @Column(name = "fin_prdt_cd", length = 64, nullable = false)
    private String finPrdtCd;      // 금융상품코드 (Unique)

    @Column(name = "fin_co_no", length = 20)
    private String finCoNo;        // 금융회사코드

    @Builder.Default
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<DepositRate> rates = new ArrayList<>();

    @Column(name = "profile", length = 50)
    private String profile;
}
