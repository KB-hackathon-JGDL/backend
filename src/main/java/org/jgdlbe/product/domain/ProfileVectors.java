package org.jgdlbe.product.domain;

import java.util.EnumMap;
import java.util.Map;

public class ProfileVectors {

    private static final Map<ProfileType, double[]> MAP = new EnumMap<>(ProfileType.class);

    static {
        MAP.put(ProfileType.GUARDIAN,      new double[]{0.2, 0.2, 0.8, 0.2});
        MAP.put(ProfileType.PRACTICAL,     new double[]{0.3, 0.2, 0.3, 0.3});
        MAP.put(ProfileType.PLANNER,       new double[]{0.4, 0.6, 0.8, 0.7});
        MAP.put(ProfileType.ADVENTURER,    new double[]{0.5, 0.6, 0.3, 0.7});
        MAP.put(ProfileType.STRATEGIST,    new double[]{0.7, 0.3, 0.8, 0.4});
        MAP.put(ProfileType.TRENDSETTER,   new double[]{0.8, 0.3, 0.3, 0.6});
        MAP.put(ProfileType.TRAVEL_MASTER, new double[]{0.7, 0.8, 0.8, 0.4});
        MAP.put(ProfileType.ENERGIZER,     new double[]{0.9, 0.9, 0.3, 0.8});
    }

    public static Map<ProfileType, double[]> all() {
        return MAP;
    }
}
