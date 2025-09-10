// src/main/java/org/jgdlbe/support/repository/SupportProgramFileRepository.java
package org.jgdlbe.support.repository;

import org.jgdlbe.support.entity.SupportProgramFile;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface SupportProgramFileRepository extends JpaRepository<SupportProgramFile, UUID> {
    List<SupportProgramFile> findByBoard_Id(UUID boardId);
}
