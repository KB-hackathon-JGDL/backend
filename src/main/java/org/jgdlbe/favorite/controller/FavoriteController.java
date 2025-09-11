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
@RequestMapping("/api/favorite")
@RequiredArgsConstructor
public class FavoriteController {

    private final FavoriteService favoriteService;

    @PostMapping("/card/{uuid}")
    public ResponseEntity<String> addCardFavorite(@PathVariable("uuid") UUID cardId,
                                                  Authentication authentication) {
        String username = authentication.getName();
        favoriteService.addCardFavorite(username, cardId);
        return ResponseEntity.ok("즐겨찾기 등록이 완료되었습니다.");
    }

    @PostMapping("/deposit/{uuid}")
    public ResponseEntity<String> addDepositFavorite(@PathVariable("uuid") UUID depositId,
                                                     Authentication authentication) {
        String username = authentication.getName();
        favoriteService.addDepositFavorite(username, depositId);
        return ResponseEntity.ok("즐겨찾기 등록이 완료되었습니다.");
    }

    @PostMapping("/supply/{uuid}")
    public ResponseEntity<String> addSupplyFavorite(@PathVariable("uuid") UUID programId,
                                                    Authentication authentication) {
        String username = authentication.getName();
        favoriteService.addSupplyFavorite(username, programId);
        return ResponseEntity.ok("즐겨찾기 등록이 완료되었습니다.");
    }

    @DeleteMapping("/card/{uuid}")
    public ResponseEntity<String> removeCardFavorite(@PathVariable("uuid") UUID cardId,
                                                     Authentication authentication) {
        String username = authentication.getName();
        favoriteService.removeCardFavorite(username, cardId);
        return ResponseEntity.ok("성공적으로 삭제되었습니다.");
    }

    @DeleteMapping("/deposit/{uuid}")
    public ResponseEntity<String> removeDepositFavorite(@PathVariable("uuid") UUID depositId,
                                                        Authentication authentication) {
        String username = authentication.getName();
        favoriteService.removeDepositFavorite(username, depositId);
        return ResponseEntity.ok("성공적으로 삭제되었습니다.");
    }

    @DeleteMapping("/supply/{uuid}")
    public ResponseEntity<String> removeSupplyFavorite(@PathVariable("uuid") UUID programId,
                                                       Authentication authentication) {
        String username = authentication.getName();
        favoriteService.removeSupplyFavorite(username, programId);
        return ResponseEntity.ok("성공적으로 삭제되었습니다.");
    }

    @GetMapping("/card")
    public ResponseEntity<List<CardSummaryDto>> getCardFavorites(Authentication authentication) {
        String username = authentication.getName();
        List<CardSummaryDto> favorites = favoriteService.getCardFavorites(username);
        return ResponseEntity.ok(favorites);
    }

    @GetMapping("/deposit")
    public ResponseEntity<List<DepositProductDTO>> getDepositFavorites(Authentication authentication) {
        String username = authentication.getName();
        List<DepositProductDTO> favorites = favoriteService.getDepositFavorites(username);
        return ResponseEntity.ok(favorites);
    }

    @GetMapping("/supply")
    public ResponseEntity<List<SupportSummaryDTO>> getSupplyFavorites(Authentication authentication) {
        String username = authentication.getName();
        List<SupportSummaryDTO> favorites = favoriteService.getSupplyFavorites(username);
        return ResponseEntity.ok(favorites);
    }
}
