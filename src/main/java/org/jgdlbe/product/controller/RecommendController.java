package org.jgdlbe.product.controller;

import lombok.RequiredArgsConstructor;
import org.jgdlbe.product.dto.*;
import org.jgdlbe.product.service.CardRecommendService;
import org.jgdlbe.product.service.DepositRecommendService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/recommend")
@RequiredArgsConstructor
public class RecommendController {

    private final DepositRecommendService appService;
    private final CardRecommendService cardService;

    @PostMapping
    public ResponseEntity<SavedProfileResponse> analyzeAndSave(@RequestBody ProfileScoreRequest req,
                                                               Authentication authentication) {
        String username = authentication.getName();
        var result = appService.analyzeAndSave(username, req);

        return ResponseEntity.ok(
                new SavedProfileResponse(result.profileType().name(), result.profileLabel())
        );
    }

    @GetMapping("/deposit")
    public ResponseEntity<RecommendResponse> recommendDeposits(Authentication authentication) {
        String username = authentication.getName();
        var response = appService.recommendDepositsBySavedProfile(username);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/deposit/{uuid}")
    public ResponseEntity<DepositProductDTO> getDepositById(@PathVariable("uuid") UUID productId) {
        DepositProductDTO dto = appService.getDepositById(productId);
        return ResponseEntity.ok(dto);
    }

    @GetMapping("/card")
    public ResponseEntity<RecommendCardResponse> recommendCards(Authentication authentication) {
        String username = authentication.getName();
        RecommendCardResponse response = cardService.recommendCardsBySavedProfile(username);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/card/{uuid}")
    public ResponseEntity<CardSummaryDto> getCardById(@PathVariable("uuid") UUID cardId) {
        CardSummaryDto dto = cardService.getCardById(cardId);
        return ResponseEntity.ok(dto);
    }

    public record SavedProfileResponse(String profileType, String profileLabel) {}
}
