package org.jgdlbe.common.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jgdlbe.chat.dto.ChatMessageDTO;
import org.jgdlbe.chat.service.ChatLogService;
import org.jgdlbe.common.domain.ChatType;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Slf4j
@Component
@RequiredArgsConstructor
public class WebSocketChatHandler extends TextWebSocketHandler {

    private final ObjectMapper mapper;

    private final ChatLogService chatLogService;

    // 방ID -> 방에 있는 세션 1~2명
    private final Map<UUID, Set<WebSocketSession>> chatRoomSessions = new ConcurrentHashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        log.info("연결됨 (세션 ID: {})", session.getId());
        session.sendMessage(new TextMessage("연결 완료!"));
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        ChatMessageDTO chatMessageDTO = mapper.readValue(message.getPayload(), ChatMessageDTO.class);
        UUID roomId = chatMessageDTO.getMentoringReservationId();

        // 방에 세션 등록
        chatRoomSessions.computeIfAbsent(roomId, k -> ConcurrentHashMap.newKeySet()).add(session);

        // 메시지 타입별 처리
        chatMessageDTO.setCreatedDate(LocalDateTime.now());
        String msgJson = mapper.writeValueAsString(chatMessageDTO);

        switch (chatMessageDTO.getChatType()) {
            case TALK:
                // 모든 세션에 전송
                chatLogService.createChatLog(chatMessageDTO);
                broadcastToRoom(roomId, msgJson);
                break;

            case JOIN:
                chatMessageDTO.setMessage("상대가 입장했습니다.");
                chatLogService.createChatLog(chatMessageDTO);
                broadcastToRoom(roomId, mapper.writeValueAsString(chatMessageDTO));
                break;

            case LEAVE:
                chatMessageDTO.setMessage("상대가 퇴장했습니다.");
                chatLogService.createChatLog(chatMessageDTO);
                broadcastToRoom(roomId, mapper.writeValueAsString(chatMessageDTO));
                // 자기 세션 제거
                chatRoomSessions.get(roomId).remove(session);
                break;
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // 종료된 세션이 속한 방 찾기
        chatRoomSessions.forEach((roomId, sessions) -> {
            if (sessions.remove(session)) {
                log.info("연결 종료 (세션 ID: {})", session.getId());

                // 남아 있는 상대방에게 종료 메시지 전송
                if (!sessions.isEmpty()) {
                    ChatMessageDTO msg = new ChatMessageDTO();
                    msg.setChatType(ChatType.LEAVE);
                    msg.setMessage("상대방이 연결 종료로 채팅을 종료했습니다.");
                    msg.setCreatedDate(LocalDateTime.now());

                    try {
                        String msgJson = mapper.writeValueAsString(msg);
                        sessions.forEach(s -> {
                            try {
                                if (s.isOpen()) s.sendMessage(new TextMessage(msgJson));
                            } catch (Exception e) {
                                log.error("종료 메시지 전송 실패", e);
                            }
                        });
                    } catch (Exception e) {
                        log.error("종료 메시지 변환 실패", e);
                    }
                }
            }
        });
    }

    private void broadcastToRoom(UUID roomId, String msgJson) {
        chatRoomSessions.getOrDefault(roomId, Set.of())
            .forEach(s -> {
                try {
                    if (s.isOpen()) s.sendMessage(new TextMessage(msgJson));
                } catch (Exception e) {
                    log.error("메시지 전송 실패", e);
                }
            });
    }
}