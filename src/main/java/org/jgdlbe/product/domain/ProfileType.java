package org.jgdlbe.product.domain;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum ProfileType {
    STABLE_MANAGER("안정적인 관리자"),
    REALISTIC_PLANNER("현실적인 계획가"),
    FREE_EXPLORER("자유로운 탐험가"),
    SMART_INVESTOR("스마트한 투자자"),
    RELAXED_ADVENTURER("느긋한 모험가"),
    YOLO("현재를 즐기는 욜로족"),
    PRACTICAL("실용적 준비자"),
    SELF_MADE_VISIONARY("비전 있는 자수성가형");

    private final String label;
}
