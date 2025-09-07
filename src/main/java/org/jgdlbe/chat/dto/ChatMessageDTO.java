package org.jgdlbe.chat.dto;

import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.jgdlbe.common.domain.ChatType;
import org.jgdlbe.common.dto.BaseDTO;

@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ChatMessageDTO extends BaseDTO {

    private UUID mentoringReservationId;
    private ChatType chatType;
    private String message;
    private UUID sender;
    private UUID receiver;

}
