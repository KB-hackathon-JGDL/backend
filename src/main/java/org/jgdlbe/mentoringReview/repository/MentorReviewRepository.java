package org.jgdlbe.mentoringReview.repository;

import java.util.UUID;
import org.jgdlbe.mentoringReview.entity.MentorReviewEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MentorReviewRepository extends JpaRepository<MentorReviewEntity, UUID> {

    MentorReviewEntity findByUserId(UUID userId);
}
