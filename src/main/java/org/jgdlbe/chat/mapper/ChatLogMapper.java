package org.jgdlbe.chat.mapper;

import lombok.RequiredArgsConstructor;
import org.jgdlbe.chat.dto.ChatLogDTO;
import org.jgdlbe.chat.entity.ChatLogEntity;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ChatLogMapper {

    public ChatLogDTO toDTO(ChatLogEntity entity) {
        return ChatLogDTO.builder()
            .id(entity.getId())
            .mentoringReservationId(entity.getMentoringReservationId())
            .message(entity.getMessage())
            .createdBy(entity.getCreatedBy())
            .createdDate(entity.getCreatedDate())
            .build();
    }
}
