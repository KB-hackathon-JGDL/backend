package org.jgdlbe.product.dto;

import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DepositRateDTO {
    private String intRateType;      // S/M
    private String intrRateTypeNm;
    private Short  saveTrm;          // 개월
    private BigDecimal intrRate;     // 기본금리
    private BigDecimal intrRate2;    // 최고우대금리
}
