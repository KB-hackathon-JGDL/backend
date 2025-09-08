package org.jgdlbe.chat.controller;

import java.util.List;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.jgdlbe.chat.dto.ChatLogDTO;
import org.jgdlbe.chat.service.ChatLogService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class ChatLogController {

    private final ChatLogService chatLogService;

    @GetMapping("/mentoring-reservations/{mentoringReservationId}/chat-logs")
    public List<ChatLogDTO> getChatLogList(@PathVariable UUID mentoringReservationId) {

        return chatLogService.getChatLogList(mentoringReservationId);
    }

}
