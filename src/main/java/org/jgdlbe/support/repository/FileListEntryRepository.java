package org.jgdlbe.support.repository;

import org.jgdlbe.support.entity.FileListEntry;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface FileListEntryRepository extends JpaRepository<FileListEntry, UUID> {
    List<FileListEntry> findByFile_IdIn(List<UUID> fileIds);
}
