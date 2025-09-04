package org.jgdlbe.mentoringReservation.dto;


import java.util.UUID;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.jgdlbe.common.dto.BaseFilterDTO;

@Data
@EqualsAndHashCode(callSuper = true)
@SuperBuilder
@NoArgsConstructor
public class MentoringReservationFilterDTO extends BaseFilterDTO{

    private UUID mentorUserId;
    private UUID menteeUserId;
}
