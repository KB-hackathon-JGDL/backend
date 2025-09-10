// src/main/java/org/jgdlbe/product/domain/ProfileVectors.java
package org.jgdlbe.product.domain;

import java.util.Map;

public final class ProfileVectors {

    private ProfileVectors() {}

    /**
     * 벡터 순서: [안정성, 계획성, 규칙성, 단기성]
     * 표의 최신 점수를 그대로 반영했습니다.
     *
     * enum 이름은 프로젝트에 맞게 교체하세요.
     * (예시는 영문 상수: STABLE_MANAGER, REALISTIC_PLANNER, FREE_EXPLORER, SMART_INVESTOR,
     *  RELAXED_ADVENTURER, YOLO, PRACTICAL, SELF_MADE_VISIONARY)
     */
    private static final Map<ProfileType, double[]> VECTORS = Map.of(
            ProfileType.STABLE_MANAGER,       new double[]{2.8, 2.8, 2.8, 1.2}, // 1. 안정적인 관리자
            ProfileType.REALISTIC_PLANNER,    new double[]{2.6, 2.7, 2.7, 2.7}, // 2. 현실적인 계획가
            ProfileType.FREE_EXPLORER,        new double[]{1.3, 1.3, 1.3, 2.8}, // 3. 자유로운 탐험가
            ProfileType.SMART_INVESTOR,       new double[]{1.2, 2.6, 2.6, 1.1}, // 4. 스마트한 투자자
            ProfileType.RELAXED_ADVENTURER,   new double[]{2.7, 1.4, 1.4, 1.4}, // 5. 느긋한 모험가
            ProfileType.YOLO,                 new double[]{1.4, 1.2, 1.2, 2.9}, // 6. 현재를 즐기는 욜로족
            ProfileType.PRACTICAL,            new double[]{2.6, 2.7, 1.3, 2.8}, // 7. 실용적 준비자
            ProfileType.SELF_MADE_VISIONARY,  new double[]{1.1, 2.8, 2.7, 1.1}  // 8. 비전 있는 자수성가형
    );

    public static Map<ProfileType, double[]> all() {
        return VECTORS;
    }
}
