package org.jgdlbe.support.entity;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "support_program_file")
public class SupportProgramFile {
    @Id
    @Column(name = "file_id", columnDefinition = "BINARY(16)")
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "support_program_board_id", nullable = false, columnDefinition = "BINARY(16)")
    private SupportProgramBoard board;
}
