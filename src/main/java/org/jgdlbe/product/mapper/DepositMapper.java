package org.jgdlbe.product.mapper;

import org.jgdlbe.product.dto.DepositProductDTO;
import org.jgdlbe.product.dto.DepositRateDTO;
import org.jgdlbe.product.entity.DepositProduct;
import org.jgdlbe.product.entity.DepositRate;

import java.util.List;
import java.util.stream.Collectors;

public class DepositMapper {
    private DepositMapper() {
    }
    public static DepositProductDTO toProductDTO(DepositProduct product) {
        if (product == null) return null;

        return DepositProductDTO.builder()
                .productId(product.getId())
                .finCoNo(product.getFinCoNo())
                .korCoNm(product.getKorCoNm())
                .finPrdtCd(product.getFinPrdtCd())
                .finPrdtNm(product.getFinPrdtNm())
                .mtrtInt(product.getMtrtInt())
                .spdCnd(product.getSpdCnd())
                .joinMember(product.getJoinMember())
                .etcNote(product.getEtcNote())
                .maxLimit(product.getMaxLimit())
                .rates(toRateDTOList(product.getRates()))
                .build();
    }

    public static DepositRateDTO toRateDTO(DepositRate rate) {
        if (rate == null) return null;

        return DepositRateDTO.builder()
                .intRateType(rate.getIntRateType())
                .intrRateTypeNm(rate.getIntrRateTypeNm())
                .saveTrm(rate.getSaveTrm())
                .intrRate(rate.getIntrRate())
                .intrRate2(rate.getIntrRate2())
                .build();
    }

    public static List<DepositRateDTO> toRateDTOList(List<DepositRate> rates) {
        if (rates == null) return List.of();
        return rates.stream().map(DepositMapper::toRateDTO).collect(Collectors.toList());
    }

    // === DTO → Entity ===
    public static DepositProduct toProductEntity(DepositProductDTO dto) {
        if (dto == null) return null;

        return DepositProduct.builder()
                .id(dto.getProductId())
                .finCoNo(dto.getFinCoNo())
                .korCoNm(dto.getKorCoNm())
                .finPrdtCd(dto.getFinPrdtCd())
                .finPrdtNm(dto.getFinPrdtNm())
                .mtrtInt(dto.getMtrtInt())
                .spdCnd(dto.getSpdCnd())
                .joinMember(dto.getJoinMember())
                .etcNote(dto.getEtcNote())
                .maxLimit(dto.getMaxLimit())
                .build();
    }

    public static DepositRate toRateEntity(DepositRateDTO dto, DepositProduct product) {
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

    public static List<DepositRate> toRateEntityList(List<DepositRateDTO> dtos, DepositProduct product) {
        if (dtos == null) return List.of();
        return dtos.stream()
                .map(dto -> toRateEntity(dto, product))
                .collect(Collectors.toList());
    }
}

