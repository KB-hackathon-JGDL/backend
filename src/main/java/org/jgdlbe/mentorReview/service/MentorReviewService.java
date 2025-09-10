package org.jgdlbe.mentorReview.service;

import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.jgdlbe.mentorReview.dto.MentorReviewDTO;
import org.jgdlbe.mentorReview.dto.MentorReviewUpdateDTO;
import org.jgdlbe.mentorReview.entity.MentorReviewEntity;
import org.jgdlbe.mentorReview.mapper.MentorReviewMapper;
import org.jgdlbe.mentorReview.repository.MentorReviewRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class MentorReviewService {

    private final MentorReviewRepository repository;

    private final MentorReviewMapper mapper;

    public MentorReviewDTO updateMentorReview(MentorReviewUpdateDTO updateDTO) {
        MentorReviewEntity entity = repository.findByUserId(updateDTO.getMentorUserId());

        if (updateDTO.isKind()) entity.setKind(entity.getKind() + 1);
        if (updateDTO.isClear()) entity.setClear(entity.getClear() + 1);
        if (updateDTO.isFriendly()) entity.setFriendly(entity.getFriendly() + 1);
        if (updateDTO.isListening()) entity.setListening(entity.getListening() + 1);
        if (updateDTO.isDetailed()) entity.setDetailed(entity.getDetailed() + 1);
        if (updateDTO.isHelpful()) entity.setHelpful(entity.getHelpful() + 1);

        MentorReviewEntity updated = repository.save(entity);

        return mapper.toDTO(updated);
    }

}
