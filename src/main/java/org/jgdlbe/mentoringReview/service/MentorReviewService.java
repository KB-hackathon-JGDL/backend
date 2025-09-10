package org.jgdlbe.mentoringReview.service;

import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.jgdlbe.mentoringReservation.repository.MentoringReservationRepository;
import org.jgdlbe.mentoringReview.dto.MentorReviewDTO;
import org.jgdlbe.mentoringReview.mapper.MentorReviewMapper;
import org.jgdlbe.mentoringReview.repository.MentorReviewRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class MentorReviewService {

    private final MentorReviewRepository repository;

    private final MentorReviewMapper mapper;

    public MentorReviewDTO getMentorReview(UUID userId) {
        return mapper.toDTO(repository.findByUserId(userId));
    }

}
