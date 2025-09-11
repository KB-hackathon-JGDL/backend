package org.jgdlbe.product.service;

import lombok.RequiredArgsConstructor;
import org.jgdlbe.product.domain.ProfileType;
import org.jgdlbe.product.dto.DepositProductDTO;
import org.jgdlbe.product.dto.ProfileScoreRequest;
import org.jgdlbe.product.dto.RecommendResponse;
import org.jgdlbe.product.entity.DepositProduct;
import org.jgdlbe.product.mapper.DepositProductMapper;
import org.jgdlbe.product.repository.DepositProductRepository;
import org.jgdlbe.user.entity.UserEntity;
import org.jgdlbe.user.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DepositRecommendService {

    private final ProfileAnalyzer analyzer;
    private final UserRepository userRepository;
    private final DepositProductRepository depositRepo;

    @Transactional
    public SavedProfileResult analyzeAndSave(String username, ProfileScoreRequest req) {
        ProfileType type = analyzer.analyze(req);
        String label = type.getLabel() == null ? "" : type.getLabel().trim();

        UserEntity user = userRepository.findByUsername(username)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 사용자"));

        user.setInfo(label);

        return new SavedProfileResult(type, label);
    }

    @Transactional(readOnly = true)
    public RecommendResponse recommendDepositsBySavedProfile(String username) {
        UserEntity user = userRepository.findByUsername(username)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 사용자"));

        String label = user.getInfo();
        if (label == null || label.trim().isEmpty()) {
            throw new IllegalStateException("사용자 정보에 저장된 성향이 없습니다.");
        }

        String normalized = label.trim();
        List<DepositProduct> products = depositRepo.findByProfileNormalized(normalized);
        List<DepositProductDTO> dtoList = products.stream()
                .map(DepositProductMapper::toDto)
                .toList();

        return RecommendResponse.builder()
                .profileLabel(normalized)
                .products(dtoList)
                .build();
    }

    /** POST 응답용 내부 DTO */
    public record SavedProfileResult(ProfileType profileType, String profileLabel) {}

}
