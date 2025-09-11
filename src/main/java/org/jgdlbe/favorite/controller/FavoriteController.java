package org.jgdlbe.favorite.controller;

import lombok.RequiredArgsConstructor;
import org.jgdlbe.favorite.service.FavoriteService;
import org.jgdlbe.product.dto.CardSummaryDto;
import org.jgdlbe.product.dto.DepositProductDTO;
import org.jgdlbe.support.dto.SupportSummaryDTO;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/favorites")
@RequiredArgsConstructor
public class FavoriteController {

    private final FavoriteService favoriteService;

    @PostMapping("/cards/{cardId}")
    public ResponseEntity<String> addCardFavorite(@PathVariable("cardId") UUID cardId,
                                                  Authentication authentication) {
        String username = authentication.getName();
        favoriteService.addCardFavorite(username, cardId);
        return ResponseEntity.ok("즐겨찾기 등록이 완료되었습니다.");
    }

    @PostMapping("/deposit-products/{productId}")
    public ResponseEntity<String> addDepositFavorite(@PathVariable("productId") UUID productId,
                                                     Authentication authentication) {
        String username = authentication.getName();
        favoriteService.addDepositFavorite(username, productId);
        return ResponseEntity.ok("즐겨찾기 등록이 완료되었습니다.");
    }

    @PostMapping("/supports/{supportId}")
    public ResponseEntity<String> addSupplyFavorite(@PathVariable("supportId") UUID programId,
                                                    Authentication authentication) {
        String username = authentication.getName();
        favoriteService.addSupplyFavorite(username, programId);
        return ResponseEntity.ok("즐겨찾기 등록이 완료되었습니다.");
    }

    @DeleteMapping("/cards/{cardId}")
    public ResponseEntity<String> removeCardFavorite(@PathVariable("cardId") UUID cardId,
                                                     Authentication authentication) {
        String username = authentication.getName();
        favoriteService.removeCardFavorite(username, cardId);
        return ResponseEntity.ok("성공적으로 삭제되었습니다.");
    }

    @DeleteMapping("/deposit-products/{productId}")
    public ResponseEntity<String> removeDepositFavorite(@PathVariable("productId") UUID depositId,
                                                        Authentication authentication) {
        String username = authentication.getName();
        favoriteService.removeDepositFavorite(username, depositId);
        return ResponseEntity.ok("성공적으로 삭제되었습니다.");
    }

    @DeleteMapping("/supports/{supportId}")
    public ResponseEntity<String> removeSupplyFavorite(@PathVariable("supportId") UUID programId,
                                                       Authentication authentication) {
        String username = authentication.getName();
        favoriteService.removeSupplyFavorite(username, programId);
        return ResponseEntity.ok("성공적으로 삭제되었습니다.");
    }

    @GetMapping("/cards")
    public ResponseEntity<List<CardSummaryDto>> getCardFavorites(Authentication authentication) {
        String username = authentication.getName();
        List<CardSummaryDto> favorites = favoriteService.getCardFavorites(username);
        return ResponseEntity.ok(favorites);
    }

    @GetMapping("/deposit-products")
    public ResponseEntity<List<DepositProductDTO>> getDepositFavorites(Authentication authentication) {
        String username = authentication.getName();
        List<DepositProductDTO> favorites = favoriteService.getDepositFavorites(username);
        return ResponseEntity.ok(favorites);
    }

    @GetMapping("/supports")
    public ResponseEntity<List<SupportSummaryDTO>> getSupplyFavorites(Authentication authentication) {
        String username = authentication.getName();
        List<SupportSummaryDTO> favorites = favoriteService.getSupplyFavorites(username);
        return ResponseEntity.ok(favorites);
    }
}
