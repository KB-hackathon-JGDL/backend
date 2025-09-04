package org.jgdlbe.chat.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.jgdlbe.chat.dto.ChatRequestDTO;
import org.jgdlbe.chat.dto.ChatResponseDTO;
import org.jgdlbe.chat.service.OpenAiService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/chatbot")
@RequiredArgsConstructor
public class ChatBotController {
    private final OpenAiService openAiService;

    @PostMapping
    public ResponseEntity<ChatResponseDTO> handleChat(@Valid @RequestBody ChatRequestDTO request) {
        String userInput = request.getMessage().trim();
        String aiAnswer = openAiService.askOpenAi(userInput);
        return ResponseEntity.ok(new ChatResponseDTO(aiAnswer));
    }
}
