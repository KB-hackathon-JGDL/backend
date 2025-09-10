package org.jgdlbe.support.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDate;
import java.util.UUID;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
@Entity
@Table(name = "support_program_board")
public class SupportProgramBoard {

    @Id
    @Column(name = "support_program_board_id", columnDefinition = "BINARY(16)")
    private UUID id;

    @Column(nullable = false, length = 300)
    private String title;

    @Column(length = 120)
    private String region;

    private LocalDate startDate;
    private LocalDate endDate;

    @Column(name = "article_organization", length = 200)
    private String articleOrganization;

    @Column(name = "article_target", length = 500)
    private String articleTarget;

    @Column(name = "article_content", columnDefinition = "TEXT")
    private String articleContent;

    @Column(name = "article_contact", length = 200)
    private String articleContact;

    @Column(name = "article_etc", columnDefinition = "TEXT")
    private String articleEtc;
}
