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
@RequestMapping("/api/supports")
public class SupportController {

    private final SupportProgramBoardRepository boardRepo;
    private final SupportService supportService;

    @GetMapping
    public List<SupportSummaryDTO> getSupportSummaries() {
        return boardRepo.findAllSummaries();
    }

    @GetMapping("/{id}")
    public SupportDetailDTO getSupportDetail(@PathVariable("id") UUID id) {
        return supportService.getDetailWithFiles(id);
    }
}
