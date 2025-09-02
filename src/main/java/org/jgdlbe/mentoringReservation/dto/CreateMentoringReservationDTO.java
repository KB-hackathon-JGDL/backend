package org.jgdlbe.mentoringReservation.dto;

import java.time.LocalDate;
import lombok.Data;

@Data
public class CreateMentoringReservationDTO {

    private Integer MentoringTime;
    private LocalDate MentoringDate;
}
