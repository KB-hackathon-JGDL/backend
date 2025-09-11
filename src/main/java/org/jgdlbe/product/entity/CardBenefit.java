package org.jgdlbe.product.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

import java.util.UUID;

@Entity
@Table(name = "card_benefit")
@Getter @Setter
public class CardBenefit {

    @Id
    @Column(name = "benefit_id", columnDefinition = "BINARY(16)")
    @JdbcTypeCode(SqlTypes.BINARY)
    private UUID benefitId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "card_id", nullable = false)
    private CardInfo card;

    @Column(name = "benefit_order", nullable = false)
    private int benefitOrder;

    @Lob
    @Column(name = "benefit_text", nullable = false, columnDefinition = "TEXT")
    private String benefitText;
}
