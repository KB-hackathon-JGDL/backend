package org.jgdlbe.product.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;


@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class FssBaseProductDTO {
    @JsonProperty("fin_co_no")   private String finCoNo;
    @JsonProperty("kor_co_nm")   private String korCoNm;
    @JsonProperty("fin_prdt_cd") private String finPrdtCd;
    @JsonProperty("fin_prdt_nm") private String finPrdtNm;
    @JsonProperty("mtrt_int")    private String mtrtInt;
    @JsonProperty("spcl_cnd")    private String spclCnd;
    @JsonProperty("join_member") private String joinMember;
    @JsonProperty("etc_note")    private String etcNote;
    @JsonProperty("max_limit")   private Long   maxLimit;
}
