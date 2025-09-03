package org.jgdlbe.mentoringReservation.service;


import java.util.List;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.jgdlbe.common.exception.ErrorCode;
import org.jgdlbe.common.exception.InvalidRequestException;
import org.jgdlbe.mentoringReservation.dto.CreateMentoringReservationDTO;
import org.jgdlbe.mentoringReservation.entity.MentoringReservationEntity;
import org.jgdlbe.mentoringReservation.repository.MentoringReservationRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class MentoringReservationService {

    private final MentoringReservationRepository reservationRepository;

    public void createMentoringSchedule(UUID mentorId,
        List<CreateMentoringReservationDTO> reservationDTOList) {

        for (CreateMentoringReservationDTO dto : reservationDTOList) {
            reservationRepository.save(MentoringReservationEntity.builder()
                .mentorUserId(mentorId)
                .MentoringTime(dto.getMentoringTime())
                .MentoringDate(dto.getMentoringDate())
                .build());
        }
    }

    public void reservationMentoring(UUID menteeId, UUID reservationId) {

        MentoringReservationEntity reservation = reservationRepository.findById(reservationId)
            .orElseThrow(() -> new InvalidRequestException(ErrorCode.NOT_FOUND_MENTORING_RESERVATION));

        if (reservation.getMenteeUserId() != null) {
            throw new InvalidRequestException(ErrorCode.RESERVATION_TIME_ALREADY_BOOKED);
        }

        reservation.setMenteeUserId(menteeId);
        reservationRepository.save(reservation);
    }
}
