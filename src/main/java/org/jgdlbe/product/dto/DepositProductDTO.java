package org.jgdlbe.product.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
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
    private Long maxLimit;

    private Double minRate;
    private Double maxRate;
}
