package org.jgdlbe.mentoringReservation.service;


import java.util.List;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.jgdlbe.common.exception.DataNotFoundException;
import org.jgdlbe.common.exception.ErrorCode;
import org.jgdlbe.common.exception.InvalidRequestException;
import org.jgdlbe.mentoringReservation.domain.ChatStatus;
import org.jgdlbe.mentoringReservation.dto.MentoringReservationCreateDTO;
import org.jgdlbe.mentoringReservation.dto.MentoringReservationDTO;
import org.jgdlbe.mentoringReservation.dto.MentoringReservationFilterDTO;
import org.jgdlbe.mentoringReservation.dto.MentoringReservationRequestDTO;
import org.jgdlbe.mentoringReservation.dto.MentoringReservationUpdateDTO;
import org.jgdlbe.mentoringReservation.entity.MentoringReservationEntity;
import org.jgdlbe.mentoringReservation.mapper.MentoringReservationMapper;
import org.jgdlbe.mentoringReservation.repository.MentoringReservationRepository;
import org.jgdlbe.user.domain.UserRole;
import org.jgdlbe.user.dto.UserDTO;
import org.jgdlbe.user.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class MentoringReservationService {

    private final MentoringReservationRepository reservationRepository;

    private final UserService userService;

    private final MentoringReservationMapper mapper;

    public void createMentoringSchedule(UUID mentorId,
        List<MentoringReservationCreateDTO> reservationDTOList) {

        for (MentoringReservationCreateDTO dto : reservationDTOList) {
            reservationRepository.save(MentoringReservationEntity.builder()
                .mentorUserId(mentorId)
                .MentoringTime(dto.getMentoringTime())
                .MentoringDate(dto.getMentoringDate())
                .chatStatus(ChatStatus.PENDING)
                .build());
        }
    }

    public void reservationMentoring(UUID reservationId,
        MentoringReservationRequestDTO requestDTO) {

        MentoringReservationEntity reservation = reservationRepository.findById(reservationId)
            .orElseThrow(
                () -> new InvalidRequestException(ErrorCode.NOT_FOUND_MENTORING_RESERVATION));

        if (reservation.getMenteeUserId() != null) {
            throw new InvalidRequestException(ErrorCode.RESERVATION_TIME_ALREADY_BOOKED);
        }

        reservation.setMenteeUserId(requestDTO.getMenteeUserId());
        reservation.setConsultationCard(requestDTO.getConsultationCard());
        reservationRepository.save(reservation);
    }

    public MentoringReservationDTO getMentoringReservation(UUID mentoringReservationId) {

        MentoringReservationEntity entity = reservationRepository.findById(mentoringReservationId)
            .orElseThrow(
                () -> new DataNotFoundException(ErrorCode.NOT_FOUND_MENTORING_RESERVATION));

        return mapper.toDTO(entity);
    }

    public List<MentoringReservationDTO> getReservationList(UUID userId) {

        UserDTO user = userService.getUser(userId);

        MentoringReservationFilterDTO filter = MentoringReservationFilterDTO.builder().build();

        if (user.getUserRole() == UserRole.ROLE_MENTOR) {
            filter.setMentorUserId(userId);
        } else if (user.getUserRole() == UserRole.ROLE_USER) {
            filter.setMenteeUserId(userId);
        }

        return reservationRepository.findByFilter(filter, filter.getPageRequest()).stream()
            .map(mapper::toDTO).toList();
    }

    public void updateMentoringReservationChatStatus(
        MentoringReservationUpdateDTO updateDTO) {

        MentoringReservationEntity entity = reservationRepository.findById(
            updateDTO.getMentoringReservationId()).orElseThrow(
            () -> new DataNotFoundException(ErrorCode.NOT_FOUND_MENTORING_RESERVATION));

        entity.setChatStatus(updateDTO.getChatStatus());
    }
}
