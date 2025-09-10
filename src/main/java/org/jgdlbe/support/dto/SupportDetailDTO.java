package org.jgdlbe.support.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class SupportDetailDTO {
    private UUID id;
    private String title;
    private String region;
    private LocalDate startDate;
    private LocalDate endDate;
    private String articleOrganization;
    private String articleTarget;
    private String articleContent;
    private String articleContact;
    private String articleEtc;

    private List<SupportFileItemDTO> files;
}
