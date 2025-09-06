package org.jgdlbe.product.controller;

import lombok.RequiredArgsConstructor;
import org.jgdlbe.product.dto.ProfileScoreRequest;
import org.jgdlbe.product.dto.RecommendResponse;
import org.jgdlbe.product.service.DepositRecommendService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/v1/recommend")
@RequiredArgsConstructor
public class RecommendController {

    private final DepositRecommendService depositRecommendService;

    @PostMapping("/deposits")
    public ResponseEntity<RecommendResponse> recommendDeposits(@RequestBody ProfileScoreRequest req) {
        return ResponseEntity.ok(depositRecommendService.recommend(req));
    }
}
