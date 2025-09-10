package org.jgdlbe.support.entity;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter @Setter
@NoArgsConstructor
@Entity
@Table(name = "file_list")
public class FileListEntry {

    @Id
    @Column(name = "file_list_id", columnDefinition = "BINARY(16)")
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "file_id", nullable = false, columnDefinition = "BINARY(16)")
    private SupportProgramFile file;

    @Column(name = "origin_name", nullable = false, length = 255)
    private String originName;

    @Column(name = "file_type", nullable = false, length = 255)
    private String fileType; // 현재 정책상 "문서"
}