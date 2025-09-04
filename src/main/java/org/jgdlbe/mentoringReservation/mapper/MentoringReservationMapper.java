package org.jgdlbe.mentoringReservation.mapper;

import org.jgdlbe.mentoringReservation.dto.MentoringReservationDTO;
import org.jgdlbe.mentoringReservation.entity.MentoringReservationEntity;
import org.springframework.stereotype.Component;

@Component
public class MentoringReservationMapper {

    public MentoringReservationDTO toDTO(MentoringReservationEntity entity) {
        return MentoringReservationDTO.builder()
            .mentoringReservationId(entity.getMentoringReservationId())
            .mentorUserId(entity.getMentorUserId())
            .menteeUserId(entity.getMenteeUserId())
            .MentoringTime(entity.getMentoringTime())
            .MentoringDate(entity.getMentoringDate())
            .consultationCard(entity.getConsultationCard())
            .build();

    }
}
