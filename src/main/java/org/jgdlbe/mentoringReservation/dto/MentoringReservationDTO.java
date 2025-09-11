package org.jgdlbe.mentoringReservation.dto;

import com.querydsl.core.annotations.QueryProjection;
import java.time.LocalDate;
import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.jgdlbe.mentoringReservation.domain.ChatStatus;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MentoringReservationDTO {

    private UUID mentoringReservationId;

    private UUID mentorUserId;
    private UUID menteeUserId;

    private Integer mentoringTime;
    private LocalDate mentoringDate;
    private String consultationCard;
    private ChatStatus chatStatus;

    private String name;
}
