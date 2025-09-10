package org.jgdlbe.mentoringReservation.controller;


import java.util.List;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.jgdlbe.common.utils.AuthUtils;
import org.jgdlbe.mentoringReservation.dto.MentoringReservationCreateDTO;
import org.jgdlbe.mentoringReservation.dto.MentoringReservationDTO;
import org.jgdlbe.mentoringReservation.dto.MentoringReservationRequestDTO;
import org.jgdlbe.mentoringReservation.service.MentoringReservationService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class MentoringReservationController {

    private final MentoringReservationService mentoringService;

    @PostMapping("/mentoring-reservations")
    public void createMentoringSchedule(
        @RequestBody List<MentoringReservationCreateDTO> reservationDTOList) {
        UUID userId = AuthUtils.getUserId();

        mentoringService.createMentoringSchedule(userId, reservationDTOList);
    }

    @PatchMapping("/mentoring-reservations/{mentoringReservationId}")
    public void reservationMentoring(@PathVariable UUID mentoringReservationId,
        @RequestBody MentoringReservationRequestDTO requestDTO) {

        if (requestDTO.getMenteeUserId() == null) {
            requestDTO.setMenteeUserId(AuthUtils.getUserId());
        }

        mentoringService.reservationMentoring(mentoringReservationId, requestDTO);
    }


    @GetMapping("/mentoring-reservations/{mentoringReservationId}")
    public MentoringReservationDTO getMentoringReservation(
        @PathVariable UUID mentoringReservationId) {

        return mentoringService.getMentoringReservation(mentoringReservationId);
    }

    @GetMapping("/mentoring-reservations")
    public List<MentoringReservationDTO> getReservationList() {

        return mentoringService.getReservationList(AuthUtils.getUserId());
    }
}
