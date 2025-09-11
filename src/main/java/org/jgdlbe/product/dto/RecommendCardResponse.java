package org.jgdlbe.product.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data @AllArgsConstructor @NoArgsConstructor
public class RecommendCardResponse {
    private String profileLabel;
    private int count;
    private List<CardSummaryDto> items;
}
