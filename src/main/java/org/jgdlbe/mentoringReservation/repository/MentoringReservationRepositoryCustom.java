package org.jgdlbe.mentoringReservation.repository;

import java.util.List;
import org.jgdlbe.mentoringReservation.dto.MentoringReservationDTO;
import org.jgdlbe.mentoringReservation.dto.MentoringReservationFilterDTO;
import org.jgdlbe.mentoringReservation.entity.MentoringReservationEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface MentoringReservationRepositoryCustom {

    Page<MentoringReservationEntity> findByFilter(MentoringReservationFilterDTO filter, Pageable pageable);
}
