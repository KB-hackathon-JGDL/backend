package org.jgdlbe.product.controller;

import lombok.RequiredArgsConstructor;
import org.jgdlbe.product.dto.ProfileScoreRequest;
import org.jgdlbe.product.dto.RecommendResponse;
import org.jgdlbe.product.service.DepositRecommendService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/recommend")
@RequiredArgsConstructor
public class RecommendController {

    private final DepositRecommendService appService;

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

    public record SavedProfileResponse(String profileType, String profileLabel) {}
}
