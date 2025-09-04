package org.jgdlbe.product.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class FssResultDTO {
    @JsonProperty("err_cd")      private String errCd;
    @JsonProperty("err_msg")     private String errMsg;
    @JsonProperty("prdt_div")    private String prdtDiv;
    @JsonProperty("total_count") private Integer totalCount;
    @JsonProperty("max_page_no") private Integer maxPageNo;
    @JsonProperty("now_page_no") private Integer nowPageNo;

    @JsonProperty("baseList")    private List<FssBaseProductDTO> baseList;
    @JsonProperty("optionList")  private List<FssOptionRateDTO>  optionList;
}
