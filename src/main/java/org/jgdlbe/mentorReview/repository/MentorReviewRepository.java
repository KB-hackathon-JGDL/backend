package org.jgdlbe.mentorReview.repository;

import java.util.UUID;
import org.jgdlbe.mentorReview.entity.MentorReviewEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MentorReviewRepository extends JpaRepository<MentorReviewEntity, UUID> {

    MentorReviewEntity findByUserId(UUID userId);
}
