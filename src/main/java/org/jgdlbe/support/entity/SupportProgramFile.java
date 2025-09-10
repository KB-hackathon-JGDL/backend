// src/main/java/org/jgdlbe/support/entity/SupportProgramFile.java
package org.jgdlbe.support.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.UUID;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
@Entity
@Table(name = "support_program_file")
public class SupportProgramFile {

    @Id
    @Column(name = "file_id", columnDefinition = "BINARY(16)")
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "support_program_board_id", nullable = false, columnDefinition = "BINARY(16)")
    private SupportProgramBoard board;

    @Column(name = "origin_name", nullable = false, length = 255)
    private String originName;

    @Column(name = "file_type", nullable = false, length = 255)
    private String fileType; // 현재 정책: "문서"
}
