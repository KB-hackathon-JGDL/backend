package org.jgdlbe.product.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jgdlbe.product.dto.FssBaseProductDTO;
import org.jgdlbe.product.dto.FssOptionRateDTO;
import org.jgdlbe.product.dto.FssResultDTO;
import org.jgdlbe.product.entity.DepositProduct;
import org.jgdlbe.product.entity.DepositRate;
import org.jgdlbe.product.repository.DepositProductRepository;
import org.jgdlbe.product.repository.DepositRateRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class SavingIngestService {

    private final RestTemplate restTemplate;
    private final ObjectMapper objectMapper;
    private final DepositProductRepository productRepo;
    private final DepositRateRepository rateRepo;

    @Value("${fss.api.auth}")        private String auth;
    @Value("${fss.api.base-url}")    private String baseUrl;
    @Value("${fss.api.saving-path}") private String savingPath;
    @Value("${fss.api.topFinGrpNo}") private String defaultTopFinGrpNo;

    public IngestResult ingest(String topFinGrpNo) {
        String group = (topFinGrpNo == null || topFinGrpNo.isBlank()) ? defaultTopFinGrpNo : topFinGrpNo;

        int pageNo = 1;
        int maxPageNo;
        int upsertProducts = 0;
        int savedRates = 0;

        do {
            URI uri = buildUri(group, pageNo);
            FssResultDTO r = callFss(uri);

            if (!"000".equals(r.getErrCd())) {
                throw new IllegalStateException("FSS 적금 API 에러: " + r.getErrCd() + " - " + r.getErrMsg());
            }
            maxPageNo = (r.getMaxPageNo() == null) ? 1 : r.getMaxPageNo();

            Map<String, List<FssOptionRateDTO>> optMap = new HashMap<>();
            List<FssOptionRateDTO> optionList = r.getOptionList();
            if (optionList != null) {
                for (FssOptionRateDTO op : optionList) {
                    if (op == null || op.getFinPrdtCd() == null || op.getFinPrdtCd().isBlank()) continue;
                    optMap.computeIfAbsent(op.getFinPrdtCd(), k -> new ArrayList<>()).add(op);
                }
            }

            List<FssBaseProductDTO> baseList = r.getBaseList();
            if (baseList != null) {
                for (FssBaseProductDTO bp : baseList) {
                    if (bp == null || bp.getFinPrdtCd() == null || bp.getFinPrdtCd().isBlank()) continue;

                    DepositProduct product = productRepo.findByFinPrdtCd(bp.getFinPrdtCd())
                            .orElseGet(DepositProduct::new);

                    product.setKorCoNm(bp.getKorCoNm());
                    product.setFinPrdtNm(bp.getFinPrdtNm());
                    product.setMtrtInt(bp.getMtrtInt());
                    product.setSpdCnd(bp.getSpclCnd());
                    product.setJoinMember(bp.getJoinMember());
                    product.setEtcNote(bp.getEtcNote());
                    product.setMaxLimit(bp.getMaxLimit());
                    product.setFinPrdtCd(bp.getFinPrdtCd());
                    product.setFinCoNo(bp.getFinCoNo());

                    product = productRepo.save(product);

                    // 금리 전체 교체 후 다시 저장
                    rateRepo.deleteByProduct(product);
                    List<FssOptionRateDTO> options = optMap.get(bp.getFinPrdtCd());
                    if (options != null) {
                        for (FssOptionRateDTO op : options) {
                            DepositRate rate = DepositRate.builder()
                                    .product(product)
                                    .rsrvType(op.getRsrvType() == null ? "NA" : op.getRsrvType())
                                    .rsrvTypeNm(op.getRsrvTypeNm())
                                    .intRateType(op.getIntrRateType())
                                    .intrRateTypeNm(op.getIntrRateTypeNm())
                                    .saveTrm(op.getSaveTrm())
                                    .intrRate(op.getIntrRate())
                                    .intrRate2(op.getIntrRate2())
                                    .build();
                            rateRepo.save(rate);
                            savedRates++;
                        }
                    }
                    upsertProducts++;
                }
            }

            pageNo++;
        } while (pageNo <= maxPageNo);

        return new IngestResult(upsertProducts, savedRates);
    }

    private FssResultDTO callFss(URI uri) {
        JsonNode root = restTemplate.getForObject(uri, JsonNode.class);
        if (root == null || root.path("result").isMissingNode()) {
            throw new IllegalStateException("FSS 적금 응답이 비어있습니다. uri=" + uri);
        }
        return objectMapper.convertValue(root.path("result"), FssResultDTO.class);
    }

    private URI buildUri(String topFinGrpNo, int pageNo) {
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("auth", auth);
        params.add("topFinGrpNo", topFinGrpNo);
        params.add("pageNo", String.valueOf(pageNo));

        return UriComponentsBuilder.fromHttpUrl(baseUrl + savingPath)
                .queryParams(params)
                .build(true)
                .toUri();
    }

    public record IngestResult(int products, int rates) {}
}