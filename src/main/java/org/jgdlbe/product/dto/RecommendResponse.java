package org.jgdlbe.product.dto;

import lombok.Builder;
import lombok.Data;
import org.jgdlbe.product.domain.ProfileType;

import java.util.List;

@Data
@Builder
public class RecommendResponse {
    private ProfileType profileType;
    private String profileLabel;
    private List<DepositProductDTO> products;
}
