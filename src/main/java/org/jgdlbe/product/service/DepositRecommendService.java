package org.jgdlbe.product.service;

import lombok.RequiredArgsConstructor;
import org.jgdlbe.product.domain.ProfileType;
import org.jgdlbe.product.dto.DepositProductDTO;
import org.jgdlbe.product.dto.ProfileScoreRequest;
import org.jgdlbe.product.dto.RecommendResponse;
import org.jgdlbe.product.entity.DepositProduct;
import org.jgdlbe.product.mapper.DepositProductMapper;
import org.jgdlbe.product.repository.DepositProductRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DepositRecommendService {

    private final ProfileAnalyzer analyzer;
    private final DepositProductRepository productRepo;

    public RecommendResponse recommend(ProfileScoreRequest req) {
        ProfileType type = analyzer.analyze(req);
        String label = type.getLabel();

        List<DepositProduct> products = productRepo.findAll().stream()
                .filter(p -> label.equals(p.getProfile()))
                .toList();

        List<DepositProductDTO> dtoList = DepositProductMapper.toDtoList(products);

        return RecommendResponse.builder()
                .profileType(type)
                .profileLabel(label)
                .products(dtoList)
                .build();
    }

}
