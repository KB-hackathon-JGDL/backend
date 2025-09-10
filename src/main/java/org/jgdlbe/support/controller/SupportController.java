package org.jgdlbe.support.controller;


import lombok.RequiredArgsConstructor;
import org.jgdlbe.support.dto.SupportDetailDTO;
import org.jgdlbe.support.dto.SupportSummaryDTO;
import org.jgdlbe.support.repository.SupportProgramBoardRepository;
import org.jgdlbe.support.service.SupportService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/v1/support")
public class SupportController {

    private final SupportProgramBoardRepository boardRepo;
    private final SupportService supportService;

    @GetMapping
    public List<SupportSummaryDTO> getSupportSummaries() {
        return boardRepo.findAllSummaries();
    }

    @PostMapping("/{id}")
    public ResponseEntity<?> getSupportDetail(@PathVariable("id") UUID id) {
        try {
            SupportDetailDTO dto = supportService.getDetailWithFiles(id);
            return ResponseEntity.ok(dto);
        } catch (NoSuchElementException e) {
            return ResponseEntity.notFound().build();
        }
    }
}
