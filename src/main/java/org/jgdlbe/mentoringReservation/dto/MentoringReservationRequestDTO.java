package org.jgdlbe.mentoringReservation.dto;

import java.util.UUID;
import lombok.Data;

@Data
public class MentoringReservationRequestDTO {
    private String consultationCard;
    private UUID menteeUserId;

}
