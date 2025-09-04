package org.jgdlbe.mentoringReservation.dto;

import java.time.LocalDate;
import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MentoringReservationDTO {

    private UUID mentoringReservationId;

    private UUID mentorUserId;
    private UUID menteeUserId;

    private Integer MentoringTime;
    private LocalDate MentoringDate;
    private String consultationCard;

}
