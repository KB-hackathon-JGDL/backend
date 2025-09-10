package org.jgdlbe.user.repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.jgdlbe.example.entity.ExampleEntity;
import org.jgdlbe.user.dto.MentorInfoDTO;
import org.jgdlbe.user.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends JpaRepository<UserEntity, UUID>, UserRepositoryCustom {

    Optional<UserEntity> findByUsername(String username);

    @Query(value = """
        SELECT 
            BIN_TO_UUID(u.user_id) AS userId,
            u.name AS name,
            u.user_role AS userRole,
            u.birth_date AS birthDate,
            u.phone AS phone,
            u.region AS region,
            u.info AS info,
            u.business_field AS businessField,
            u.career AS career,
            u.credentials AS credentials,
            CASE 
                WHEN mr.kind = GREATEST(mr.kind, mr.clear, mr.friendly, mr.listening, mr.detailed, mr.helpful) THEN 'kind'
                WHEN mr.clear = GREATEST(mr.kind, mr.clear, mr.friendly, mr.listening, mr.detailed, mr.helpful) THEN 'clear'
                WHEN mr.friendly = GREATEST(mr.kind, mr.clear, mr.friendly, mr.listening, mr.detailed, mr.helpful) THEN 'friendly'
                WHEN mr.listening = GREATEST(mr.kind, mr.clear, mr.friendly, mr.listening, mr.detailed, mr.helpful) THEN 'listening'
                WHEN mr.detailed = GREATEST(mr.kind, mr.clear, mr.friendly, mr.listening, mr.detailed, mr.helpful) THEN 'detailed'
                WHEN mr.helpful = GREATEST(mr.kind, mr.clear, mr.friendly, mr.listening, mr.detailed, mr.helpful) THEN 'helpful'
            END AS mostReview
        FROM user u
        LEFT JOIN mentor_review mr ON u.user_id = mr.user_id
        WHERE u.user_role = 'ROLE_MENTOR'
        """, nativeQuery = true)
    List<MentorInfoDTO> findAllMentorInfos();

    @Query(value = """
        SELECT 
            BIN_TO_UUID(u.user_id) AS userId,
            u.name AS name,
            u.user_role AS userRole,
            u.birth_date AS birthDate,
            u.phone AS phone,
            u.region AS region,
            u.info AS info,
            u.business_field AS businessField,
            u.career AS career,
            u.credentials AS credentials,
            CASE 
                WHEN mr.kind = GREATEST(mr.kind, mr.clear, mr.friendly, mr.listening, mr.detailed, mr.helpful) THEN 'kind'
                WHEN mr.clear = GREATEST(mr.kind, mr.clear, mr.friendly, mr.listening, mr.detailed, mr.helpful) THEN 'clear'
                WHEN mr.friendly = GREATEST(mr.kind, mr.clear, mr.friendly, mr.listening, mr.detailed, mr.helpful) THEN 'friendly'
                WHEN mr.listening = GREATEST(mr.kind, mr.clear, mr.friendly, mr.listening, mr.detailed, mr.helpful) THEN 'listening'
                WHEN mr.detailed = GREATEST(mr.kind, mr.clear, mr.friendly, mr.listening, mr.detailed, mr.helpful) THEN 'detailed'
                WHEN mr.helpful = GREATEST(mr.kind, mr.clear, mr.friendly, mr.listening, mr.detailed, mr.helpful) THEN 'helpful'
            END AS mostReview
        FROM user u
        LEFT JOIN mentor_review mr ON u.user_id = mr.user_id
        WHERE u.user_id = :userId
        """, nativeQuery = true)
    MentorInfoDTO findMentorInfo(@Param("userId") UUID userId);
}
