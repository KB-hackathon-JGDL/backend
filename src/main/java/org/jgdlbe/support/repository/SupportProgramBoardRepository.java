package org.jgdlbe.support.repository;

import org.jgdlbe.support.dto.SupportSummaryDTO;
import org.jgdlbe.support.entity.SupportProgramBoard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.UUID;

public interface SupportProgramBoardRepository extends JpaRepository<SupportProgramBoard, UUID> {

    @Query("""
           select new org.jgdlbe.support.dto.SupportSummaryDTO(b.title, b.region)
           from SupportProgramBoard b
           """)
    List<SupportSummaryDTO> findAllSummaries();
}
