package org.jgdlbe.product.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.UUID;

@Data @AllArgsConstructor @NoArgsConstructor
public class CardSummaryDto {
    private UUID cardId;
    private String cardName;
    private String issuer;
    private String profile;
    private String annualFee;
    private String monthlySpend;
    private String issuanceFee;
    private String brand;
    private String domesticOverseas;
    private List<CardBenefitDto> benefits;
}
