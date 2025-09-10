package org.jgdlbe.mentoringReview.mapper;

import lombok.RequiredArgsConstructor;
import org.jgdlbe.mentoringReview.dto.MentorReviewDTO;
import org.jgdlbe.mentoringReview.entity.MentorReviewEntity;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class MentorReviewMapper {

    public MentorReviewDTO toDTO(MentorReviewEntity entity) {
        return MentorReviewDTO.builder()
            .userId(entity.getUserId())
            .kind(entity.getKind())
            .clear(entity.getClear())
            .friendly(entity.getFriendly())
            .listening(entity.getListening())
            .detailed(entity.getDetailed())
            .helpful(entity.getHelpful())
            .build();
    }

}
