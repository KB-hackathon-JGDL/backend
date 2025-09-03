package org.jgdlbe.mentoringReservation.repository;

import java.util.UUID;
import org.jgdlbe.example.entity.ExampleEntity;
import org.jgdlbe.example.repository.ExampleRepositoryCustom;
import org.jgdlbe.mentoringReservation.entity.MentoringReservationEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MentoringReservationRepository extends
    JpaRepository<MentoringReservationEntity, UUID>,
    MentoringReservationRepositoryCustom {

}
