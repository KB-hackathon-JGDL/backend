package org.jgdlbe.chat.dto;

import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.jgdlbe.common.dto.BaseDTO;
import org.jgdlbe.common.entity.BaseEntity;

@Data
@SuperBuilder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ChatLogDTO extends BaseDTO {
    private Long id;

    private UUID mentoringReservationId;
    private String message;

}
