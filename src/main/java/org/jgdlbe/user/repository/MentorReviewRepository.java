package org.jgdlbe.user.repository;

import java.util.UUID;
import org.jgdlbe.user.entity.MentorReviewEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MentorReviewRepository extends JpaRepository<MentorReviewEntity, UUID> {

}
