package org.jgdlbe.product.mapper;

import org.jgdlbe.product.dto.DepositRateDTO;
import org.jgdlbe.product.entity.DepositProduct;
import org.jgdlbe.product.entity.DepositRate;

import java.util.List;
import java.util.Objects;

public final class DepositRateMapper {

    private DepositRateMapper() {}

    public static DepositRateDTO toDto(DepositRate r) {
        if (r == null) return null;

        return DepositRateDTO.builder()
                .intRateType(r.getIntRateType())
                .intrRateTypeNm(r.getIntrRateTypeNm())
                .saveTrm(r.getSaveTrm())
                .intrRate(r.getIntrRate())
                .intrRate2(r.getIntrRate2())
                .build();
    }

    public static List<DepositRateDTO> toDtoList(List<DepositRate> rates) {
        if (rates == null) return List.of();
        return rates.stream()
                .filter(Objects::nonNull)
                .map(DepositRateMapper::toDto)
                .toList();
    }

    public static DepositRate toEntity(DepositRateDTO dto, DepositProduct product) {
        if (dto == null) return null;

        return DepositRate.builder()
                .product(product)
                .intRateType(dto.getIntRateType())
                .intrRateTypeNm(dto.getIntrRateTypeNm())
                .saveTrm(dto.getSaveTrm())
                .intrRate(dto.getIntrRate())
                .intrRate2(dto.getIntrRate2())
                .build();
    }

    public static List<DepositRate> toEntityList(List<DepositRateDTO> dtos, DepositProduct product) {
        if (dtos == null) return List.of();
        return dtos.stream()
                .filter(Objects::nonNull)
                .map(dto -> toEntity(dto, product))
                .toList();
    }
}
