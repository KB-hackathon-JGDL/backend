package org.jgdlbe.support.service;

import lombok.RequiredArgsConstructor;
import org.jgdlbe.support.dto.SupportDetailDTO;
import org.jgdlbe.support.dto.SupportFileItemDTO;
import org.jgdlbe.support.dto.SupportSummaryDTO;
import org.jgdlbe.support.entity.SupportProgramBoard;
import org.jgdlbe.support.entity.SupportProgramFile;
import org.jgdlbe.support.repository.SupportProgramBoardRepository;
import org.jgdlbe.support.repository.SupportProgramFileRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class SupportService {

    private final SupportProgramBoardRepository boardRepo;
    private final SupportProgramFileRepository fileRepo;

    @Transactional(readOnly = true)
    public List<SupportSummaryDTO> getSummaries() {
        return boardRepo.findAll().stream()
                .map(b -> new SupportSummaryDTO(b.getTitle(), b.getRegion()))
                .toList();
    }


    @Transactional(readOnly = true)
    public SupportDetailDTO getDetailWithFiles(UUID boardId) {
        SupportProgramBoard b = boardRepo.findById(boardId)
                .orElseThrow(() -> new NoSuchElementException("지원사업을 찾을 수 없습니다. id=" + boardId));

        List<SupportFileItemDTO> files = fileRepo.findByBoard_Id(boardId).stream()
                .map(this::toFileItemDTO)
                .toList();

        return toDetailDTO(b, files);
    }

    private SupportFileItemDTO toFileItemDTO(SupportProgramFile f) {
        return new SupportFileItemDTO(f.getOriginName(), f.getFileType());
    }

    private SupportDetailDTO toDetailDTO(SupportProgramBoard b, List<SupportFileItemDTO> files) {
        return new SupportDetailDTO(
                b.getId(),
                b.getTitle(),
                b.getRegion(),
                b.getStartDate(),
                b.getEndDate(),
                b.getArticleOrganization(),
                b.getArticleTarget(),
                b.getArticleContent(),
                b.getArticleContact(),
                b.getArticleEtc(),
                files
        );
    }
}
