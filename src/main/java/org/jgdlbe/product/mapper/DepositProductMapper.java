package org.jgdlbe.product.mapper;

import org.jgdlbe.product.dto.DepositProductDTO;
import org.jgdlbe.product.entity.DepositProduct;
import org.jgdlbe.product.entity.DepositRate;

import java.math.BigDecimal;
import java.util.DoubleSummaryStatistics;
import java.util.List;
import java.util.Objects;
import java.util.stream.Stream;

public final class DepositProductMapper {

    private DepositProductMapper() {}

    public static DepositProductDTO toDto(DepositProduct p) {
        if (p == null) return null;

        Double minRate = null;
        Double maxRate = null;

        List<DepositRate> rates = p.getRates();
        if (rates != null && !rates.isEmpty()) {
            DoubleSummaryStatistics stats = rates.stream()
                    .flatMap(r -> Stream.of(r.getIntrRate(), r.getIntrRate2())) // BigDecimal 둘 다 고려
                    .filter(Objects::nonNull)
                    .mapToDouble(BigDecimal::doubleValue)
                    .summaryStatistics();

            if (stats.getCount() > 0) {
                minRate = stats.getMin();
                maxRate = stats.getMax();
            }
        }

        return DepositProductDTO.builder()
                .productId(p.getId())
                .finCoNo(p.getFinCoNo())
                .korCoNm(p.getKorCoNm())
                .finPrdtCd(p.getFinPrdtCd())
                .finPrdtNm(p.getFinPrdtNm())
                .mtrtInt(p.getMtrtInt())
                .spdCnd(p.getSpdCnd())
                .joinMember(p.getJoinMember())
                .etcNote(p.getEtcNote())
                .maxLimit(p.getMaxLimit())
                .minRate(minRate)
                .maxRate(maxRate)
                .build();
    }

    public static List<DepositProductDTO> toDtoList(List<DepositProduct> list) {
        if (list == null) return List.of();
        return list.stream()
                .filter(Objects::nonNull)
                .map(DepositProductMapper::toDto)
                .toList();
    }

    public static DepositProduct toEntity(DepositProductDTO dto) {
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
}
