package org.jgdlbe.product.dto;

import lombok.*;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DepositProductDTO {
    private UUID productId;

    private String finCoNo;
    private String korCoNm;
    private String finPrdtCd;
    private String finPrdtNm;
    private String mtrtInt;
    private String spdCnd;
    private String joinMember;
    private String etcNote;
    private Long   maxLimit;

    private List<DepositRateDTO> rates;
}
