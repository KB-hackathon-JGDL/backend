package org.jgdlbe.mentoringReservation.dto;

import java.time.LocalDate;
import lombok.Data;

@Data
public class MentoringReservationCreateDTO {

    private Integer mentoringTime;
    private LocalDate mentoringDate;
}
