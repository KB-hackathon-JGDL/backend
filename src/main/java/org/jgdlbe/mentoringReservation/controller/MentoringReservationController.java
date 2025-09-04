package org.jgdlbe.mentoringReservation.controller;


import java.util.List;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jgdlbe.mentoringReservation.dto.CreateMentoringReservationDTO;
import org.jgdlbe.mentoringReservation.dto.MentoringReservationDTO;
import org.jgdlbe.mentoringReservation.dto.MentoringReservationRequestDTO;
import org.jgdlbe.mentoringReservation.service.MentoringReservationService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class MentoringReservationController {

    private final MentoringReservationService mentoringService;

    @PostMapping("/users/{userId}/mentoring-reservations")
    public void createMentoringSchedule(
        @PathVariable UUID userId,
        @RequestBody List<CreateMentoringReservationDTO> reservationDTOList) {

        mentoringService.createMentoringSchedule(userId, reservationDTOList);
    }

    @PatchMapping("/mentoring-reservations/{mentoringReservationsId}")
    public void reservationMentoring(@PathVariable UUID mentoringReservationsId,
        @RequestBody MentoringReservationRequestDTO requestDTO) {

        mentoringService.reservationMentoring(mentoringReservationsId, requestDTO);
    }


    @GetMapping("/mentoring-reservations/{mentoringReservationsId}")
    public MentoringReservationDTO getMentoringReservation(
        @PathVariable UUID mentoringReservationsId) {

        return mentoringService.getMentoringReservation(mentoringReservationsId);
    }

    @GetMapping("/users/{userId}/mentoring-reservations")
    public List<MentoringReservationDTO> getReservationList(@PathVariable UUID userId) {

        return mentoringService.getReservationList(userId);
    }
}
