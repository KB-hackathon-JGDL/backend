package org.jgdlbe.product.domain;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum ProfileType {
    GUARDIAN("든든한 지킴이형"),
    PRACTICAL("알뜰 실속형"),
    PLANNER("똑똑한 설계형"),
    ADVENTURER("자유로운 모험형"),
    STRATEGIST("계획 만점형"),
    TRENDSETTER("트렌드 체험형"),
    TRAVEL_MASTER("여행 마스터형"),
    ENERGIZER("도전 에너자이저형");

    private final String label;
}
