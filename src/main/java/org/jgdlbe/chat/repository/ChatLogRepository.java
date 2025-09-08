package org.jgdlbe.chat.repository;

import java.util.List;
import java.util.UUID;
import org.jgdlbe.chat.dto.ChatLogDTO;
import org.jgdlbe.chat.dto.ChatMessageDTO;
import org.jgdlbe.chat.entity.ChatLogEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

public interface ChatLogRepository extends JpaRepository<ChatLogEntity, UUID> {

    List<ChatLogEntity> findByMentoringReservationIdOrderByIdDesc(UUID mentoringReservationId);
}
