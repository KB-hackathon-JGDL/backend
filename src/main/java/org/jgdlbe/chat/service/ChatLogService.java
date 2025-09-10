package org.jgdlbe.chat.service;

import java.util.List;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.jgdlbe.chat.dto.ChatLogDTO;
import org.jgdlbe.chat.dto.ChatMessageDTO;
import org.jgdlbe.chat.entity.ChatLogEntity;
import org.jgdlbe.chat.mapper.ChatLogMapper;
import org.jgdlbe.chat.repository.ChatLogRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class ChatLogService {

    private final ChatLogRepository chatLogRepository;

    private final ChatLogMapper mapper;

    public void createChatLog(ChatMessageDTO chatMessageDTO) {
        ChatLogEntity entity = ChatLogEntity.builder()
            .mentoringReservationId(chatMessageDTO.getMentoringReservationId())
            .message(chatMessageDTO.getMessage())
            .build();

        entity.setCreatedBy(chatMessageDTO.getSender());

        chatLogRepository.save(entity);
    }

    public List<ChatLogDTO> getChatLogList(UUID mentoringReservationId) {
        return chatLogRepository.findByMentoringReservationIdOrderByIdDesc(mentoringReservationId).stream()
            .map(mapper::toDTO).toList();
    }

}
