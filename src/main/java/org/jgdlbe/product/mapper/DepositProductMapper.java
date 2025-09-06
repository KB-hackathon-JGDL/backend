package org.jgdlbe.product.mapper;

import org.jgdlbe.product.dto.DepositProductDTO;
import org.jgdlbe.product.dto.DepositRateDTO;
import org.jgdlbe.product.entity.DepositProduct;
import org.jgdlbe.product.entity.DepositRate;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public final class DepositProductMapper {

    private DepositProductMapper() {}

    public static DepositProductDTO toDto(DepositProduct p) {
        if (p == null) return null;
        return DepositProductDTO.builder()
                .productId(p.getId())                 // 엔티티 PK: id
                .finCoNo(p.getFinCoNo())
                .korCoNm(p.getKorCoNm())
                .finPrdtCd(p.getFinPrdtCd())
                .finPrdtNm(p.getFinPrdtNm())
                .mtrtInt(p.getMtrtInt())
                .spdCnd(p.getSpdCnd())
                .joinMember(p.getJoinMember())
                .etcNote(p.getEtcNote())
                .maxLimit(p.getMaxLimit())
                .rates(toRateDtos(p.getRates()))
                .build();
    }

    public static List<DepositProductDTO> toDtoList(List<DepositProduct> list) {
        if (list == null) return List.of();
        return list.stream().filter(Objects::nonNull)
                .map(DepositProductMapper::toDto)
                .collect(Collectors.toList());
    }

    public static List<DepositRateDTO> toRateDtos(List<DepositRate> rates) {
        if (rates == null) return Collections.emptyList();
        return rates.stream().filter(Objects::nonNull)
                .map(r -> DepositRateDTO.builder()
                        .intRateType(r.getIntRateType())
                        .intrRateTypeNm(r.getIntrRateTypeNm())
                        .saveTrm(r.getSaveTrm())
                        .intrRate(r.getIntrRate())
                        .intrRate2(r.getIntrRate2())
                        .build())
                .collect(Collectors.toList());
    }
}
