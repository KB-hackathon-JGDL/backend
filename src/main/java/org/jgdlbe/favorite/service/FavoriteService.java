package org.jgdlbe.favorite.service;

import lombok.RequiredArgsConstructor;
import org.jgdlbe.common.exception.DataNotFoundException;
import org.jgdlbe.common.exception.ErrorCode;
import org.jgdlbe.favorite.dto.AddFavoriteResponse;
import org.jgdlbe.favorite.entity.CardFavoriteEntity;
import org.jgdlbe.favorite.entity.DepositFavoriteEntity;
import org.jgdlbe.favorite.entity.SupplyFavoriteEntity;
import org.jgdlbe.favorite.repository.CardFavoriteRepository;
import org.jgdlbe.favorite.repository.DepositFavoriteRepository;
import org.jgdlbe.favorite.repository.SupplyFavoriteRepository;
import org.jgdlbe.product.dto.CardBenefitDto;
import org.jgdlbe.product.dto.CardSummaryDto;
import org.jgdlbe.product.dto.DepositProductDTO;
import org.jgdlbe.product.entity.CardBenefit;
import org.jgdlbe.product.entity.CardInfo;
import org.jgdlbe.product.entity.DepositProduct;
import org.jgdlbe.product.mapper.DepositProductMapper;
import org.jgdlbe.product.repository.CardInfoRepository;
import org.jgdlbe.product.repository.DepositProductRepository;
import org.jgdlbe.support.dto.SupportSummaryDTO;
import org.jgdlbe.support.entity.SupportProgramBoard;
import org.jgdlbe.support.repository.SupportProgramBoardRepository;
import org.jgdlbe.user.entity.UserEntity;
import org.jgdlbe.user.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class FavoriteService {

    private final UserRepository userRepository;

    private final CardFavoriteRepository cardFavoriteRepository;
    private final DepositFavoriteRepository depositFavoriteRepository;
    private final SupplyFavoriteRepository supplyFavoriteRepository;

    private final CardInfoRepository cardInfoRepository;
    private final DepositProductRepository depositProductRepository;
    private final SupportProgramBoardRepository supportProgramBoardRepository;

    @Transactional
    public AddFavoriteResponse addCardFavorite(String username, UUID cardId) {
        UUID userId = getUserId(username);

        if (cardFavoriteRepository.existsByUserIdAndCardId(userId, cardId)) {
            CardFavoriteEntity fav = cardFavoriteRepository.findByUserIdAndCardId(userId, cardId).orElseThrow();
            return new AddFavoriteResponse(fav.getFavoriteId(), "CARD", cardId, fav.getCreatedAt(), true);
        }

        CardFavoriteEntity saved = cardFavoriteRepository.save(
                CardFavoriteEntity.builder()
                        .favoriteId(UUID.randomUUID())
                        .userId(userId)
                        .cardId(cardId)
                        .build()
        );
        return new AddFavoriteResponse(saved.getFavoriteId(), "CARD", cardId, saved.getCreatedAt(), false);
    }

    @Transactional
    public AddFavoriteResponse addDepositFavorite(String username, UUID depositId) {
        UUID userId = getUserId(username);

        if (depositFavoriteRepository.existsByUserIdAndDepositId(userId, depositId)) {
            DepositFavoriteEntity fav = depositFavoriteRepository.findByUserIdAndDepositId(userId, depositId).orElseThrow();
            return new AddFavoriteResponse(fav.getFavoriteId(), "DEPOSIT", depositId, fav.getCreatedAt(), true);
        }

        DepositFavoriteEntity saved = depositFavoriteRepository.save(
                DepositFavoriteEntity.builder()
                        .favoriteId(UUID.randomUUID())
                        .userId(userId)
                        .depositId(depositId)
                        .build()
        );
        return new AddFavoriteResponse(saved.getFavoriteId(), "DEPOSIT", depositId, saved.getCreatedAt(), false);
    }

    @Transactional
    public AddFavoriteResponse addSupplyFavorite(String username, UUID programId) {
        UUID userId = getUserId(username);

        if (supplyFavoriteRepository.existsByUserIdAndProgramId(userId, programId)) {
            SupplyFavoriteEntity fav = supplyFavoriteRepository.findByUserIdAndProgramId(userId, programId).orElseThrow();
            return new AddFavoriteResponse(fav.getFavoriteId(), "SUPPLY", programId, fav.getCreatedAt(), true);
        }

        SupplyFavoriteEntity saved = supplyFavoriteRepository.save(
                SupplyFavoriteEntity.builder()
                        .favoriteId(UUID.randomUUID())
                        .userId(userId)
                        .programId(programId)
                        .build()
        );
        return new AddFavoriteResponse(saved.getFavoriteId(), "SUPPLY", programId, saved.getCreatedAt(), false);
    }


    @Transactional
    public boolean removeCardFavorite(String username, UUID cardId) {
        UUID userId = getUserId(username);
        return cardFavoriteRepository.deleteByUserIdAndCardId(userId, cardId) > 0;
    }

    @Transactional
    public boolean removeDepositFavorite(String username, UUID depositId) {
        UUID userId = getUserId(username);
        return depositFavoriteRepository.deleteByUserIdAndDepositId(userId, depositId) > 0;
    }

    @Transactional
    public boolean removeSupplyFavorite(String username, UUID programId) {
        UUID userId = getUserId(username);
        return supplyFavoriteRepository.deleteByUserIdAndProgramId(userId, programId) > 0;
    }


    @Transactional(readOnly = true)
    public List<DepositProductDTO> getDepositFavorites(String username) {
        UUID userId = getUserId(username);
        List<DepositFavoriteEntity> favs = depositFavoriteRepository.findByUserId(userId);
        if (favs.isEmpty()) return List.of();

        List<UUID> idsOrdered = favs.stream()
                .sorted(Comparator.comparing(DepositFavoriteEntity::getCreatedAt).reversed())
                .map(DepositFavoriteEntity::getDepositId)
                .toList();

        Map<UUID, DepositProduct> map = depositProductRepository.findAllById(idsOrdered)
                .stream()
                .collect(Collectors.toMap(DepositProduct::getId, x -> x));

        return idsOrdered.stream()
                .map(map::get)
                .filter(Objects::nonNull)
                .map(DepositProductMapper::toDto)
                .toList();
    }

    @Transactional(readOnly = true)
    public List<CardSummaryDto> getCardFavorites(String username) {
        UUID userId = getUserId(username);
        List<CardFavoriteEntity> favs = cardFavoriteRepository.findByUserId(userId);
        if (favs.isEmpty()) return List.of();

        List<UUID> idsOrdered = favs.stream()
                .sorted(Comparator.comparing(CardFavoriteEntity::getCreatedAt).reversed())
                .map(CardFavoriteEntity::getCardId)
                .toList();

        // 혜택까지 한 번에 로딩 (Repository에 @EntityGraph 설정된 findByCardIdIn 사용)
        Map<UUID, CardInfo> map = cardInfoRepository.findByCardIdIn(new HashSet<>(idsOrdered))
                .stream()
                .collect(Collectors.toMap(CardInfo::getCardId, x -> x));

        return idsOrdered.stream()
                .map(map::get)
                .filter(Objects::nonNull)
                .map(this::toCardSummaryDto)
                .toList();
    }

    @Transactional(readOnly = true)
    public List<SupportSummaryDTO> getSupplyFavorites(String username) {
        UUID userId = getUserId(username);
        List<SupplyFavoriteEntity> favs = supplyFavoriteRepository.findByUserId(userId);
        if (favs.isEmpty()) return List.of();

        List<UUID> idsOrdered = favs.stream()
                .sorted(Comparator.comparing(SupplyFavoriteEntity::getCreatedAt).reversed())
                .map(SupplyFavoriteEntity::getProgramId)
                .toList();

        Map<UUID, SupportProgramBoard> map = supportProgramBoardRepository.findAllById(idsOrdered)
                .stream()
                .collect(Collectors.toMap(SupportProgramBoard::getId, x -> x));

        return idsOrdered.stream()
                .map(map::get)
                .filter(Objects::nonNull)
                .map(e -> new SupportSummaryDTO(e.getTitle(), e.getRegion()))
                .toList();
    }

    // =======================
    // 내부 유틸
    // =======================

    private CardSummaryDto toCardSummaryDto(CardInfo c) {
        List<CardBenefitDto> benefits = c.getBenefits().stream()
                .sorted(Comparator.comparingInt(CardBenefit::getBenefitOrder))
                .map(b -> new CardBenefitDto(b.getBenefitOrder(), b.getBenefitText()))
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

    private UUID getUserId(String username) {
        UserEntity user = userRepository.findByUsername(username)
                .orElseThrow(() -> new DataNotFoundException(ErrorCode.COMMON_USER_NOT_FOUND));
        return user.getUserId();
    }
}
