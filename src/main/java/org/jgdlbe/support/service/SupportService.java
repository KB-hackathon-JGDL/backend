package org.jgdlbe.support.service;

import lombok.RequiredArgsConstructor;
import org.jgdlbe.support.dto.SupportDetailDTO;
import org.jgdlbe.support.dto.SupportFileItemDTO;
import org.jgdlbe.support.entity.SupportProgramBoard;
import org.jgdlbe.support.entity.SupportProgramFile;
import org.jgdlbe.support.repository.FileListEntryRepository;
import org.jgdlbe.support.repository.SupportProgramBoardRepository;
import org.jgdlbe.support.repository.SupportProgramFileRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@RequiredArgsConstructor
public class SupportService {

    private final SupportProgramBoardRepository boardRepo;
    private final SupportProgramFileRepository fileRepo;
    private final FileListEntryRepository fileListRepo;

    @Transactional(readOnly = true)
    public SupportDetailDTO getDetailWithFiles(UUID boardId) {
        SupportProgramBoard b = boardRepo.findById(boardId)
                .orElseThrow(() -> new NoSuchElementException("지원사업을 찾을 수 없습니다. id=" + boardId));

        List<SupportProgramFile> files = fileRepo.findByBoard_Id(boardId);
        List<UUID> fileIds = files.stream().map(SupportProgramFile::getId).toList();

        List<SupportFileItemDTO> fileItems = List.of();
        if (!fileIds.isEmpty()) {
            fileItems = fileListRepo.findByFile_IdIn(fileIds).stream()
                    .map(e -> new SupportFileItemDTO(e.getOriginName(), e.getFileType()))
                    .toList();
        }

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
                fileItems
        );
    }
}
