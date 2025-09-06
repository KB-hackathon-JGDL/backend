package org.jgdlbe.product.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.math.BigDecimal;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class FssOptionRateDTO {
    @JsonProperty("fin_prdt_cd")
    private String finPrdtCd;
    @JsonProperty("intr_rate_type")
    private String intrRateType;
    @JsonProperty("intr_rate_type_nm")
    private String intrRateTypeNm;
    @JsonProperty("save_trm")
    private Short  saveTrm;
    @JsonProperty("intr_rate")
    private BigDecimal intrRate;
    @JsonProperty("intr_rate2")
    private BigDecimal intrRate2;
    @JsonProperty("rsrv_type")
    private String rsrvType;
    @JsonProperty("rsrv_type_nm")
    private String rsrvTypeNm;
}
