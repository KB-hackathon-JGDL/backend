package org.jgdlbe.product.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "card_info")
@Getter @Setter
public class CardInfo {

    @Id
    @Column(name = "card_id", columnDefinition = "BINARY(16)")
    @JdbcTypeCode(SqlTypes.BINARY)
    private UUID cardId;

    @Column(name = "card_name", length = 200, nullable = false)
    private String cardName;

    @Column(name = "issuer", length = 120, nullable = false)
    private String issuer;

    @Column(name = "annual_fee", length = 100)
    private String annualFee;

    @Column(name = "monthly_spend", length = 100)
    private String monthlySpend;

    @Column(name = "issuance_fee", length = 100)
    private String issuanceFee;

    @Column(name = "brand", length = 100)
    private String brand;

    @Column(name = "domestic_overseas", length = 100)
    private String domesticOverseas;

    @Column(name = "profile", length = 50)
    private String profile;

    @OneToMany(mappedBy = "card", fetch = FetchType.LAZY)
    @OrderBy("benefitOrder ASC")
    private List<CardBenefit> benefits = new ArrayList<>();
}
