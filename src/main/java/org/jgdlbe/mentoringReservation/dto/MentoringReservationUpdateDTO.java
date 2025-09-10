package org.jgdlbe.mentoringReservation.dto;

import java.time.LocalDate;
import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.jgdlbe.mentoringReservation.domain.ChatStatus;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MentoringReservationUpdateDTO {

    private UUID mentoringReservationId;
    private UUID menteeUserId;

    private Integer MentoringTime;
    private LocalDate MentoringDate;
    private ChatStatus chatStatus;
}
