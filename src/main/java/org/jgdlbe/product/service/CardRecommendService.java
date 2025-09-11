package org.jgdlbe.product.service;

import lombok.RequiredArgsConstructor;
import org.jgdlbe.product.dto.CardBenefitDto;
import org.jgdlbe.product.dto.CardSummaryDto;
import org.jgdlbe.product.dto.RecommendCardResponse;
import org.jgdlbe.product.entity.CardBenefit;
import org.jgdlbe.product.entity.CardInfo;
import org.jgdlbe.product.repository.CardInfoRepository;
import org.jgdlbe.user.entity.UserEntity;
import org.jgdlbe.user.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class CardRecommendService {

    private final UserRepository userRepository;
    private final CardInfoRepository cardInfoRepository;

    @Transactional(readOnly = true)
    public RecommendCardResponse recommendCardsBySavedProfile(String username) {
        UserEntity user = userRepository.findByUsername(username)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 사용자"));

        String label = user.getInfo();
        if (label == null || label.trim().isEmpty()) {
            throw new IllegalStateException("사용자 정보에 저장된 성향이 없습니다.");
        }

        String normalized = label.trim();
        List<CardInfo> cards = cardInfoRepository.findByProfile(normalized);

        List<CardSummaryDto> items = cards.stream()
                .map(this::toCardSummary)
                .toList();

        RecommendCardResponse res = new RecommendCardResponse();
        res.setProfileLabel(normalized);
        res.setCount(items.size());
        res.setItems(items);
        return res;
    }

    @Transactional(readOnly = true)
    public CardSummaryDto getCardById(UUID cardId) {
        CardInfo card = cardInfoRepository.findWithBenefitsByCardId(cardId)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 카드 상품"));
        return toCardSummary(card);
    }

    private CardSummaryDto toCardSummary(CardInfo c) {
        List<CardBenefitDto> benefits = c.getBenefits().stream()
                .map(this::toBenefitDto)
                .toList();

        return new CardSummaryDto(
                c.getCardId(),
                c.getCardName(),
                c.getIssuer(),
                c.getProfile(),
                c.getAnnualFee(),
                c.getMonthlySpend(),
                c.getIssuanceFee(),
                c.getBrand(),
                c.getDomesticOverseas(),
                benefits
        );
    }



    private CardBenefitDto toBenefitDto(CardBenefit b) {
        return new CardBenefitDto(b.getBenefitOrder(), b.getBenefitText());
    }
}
