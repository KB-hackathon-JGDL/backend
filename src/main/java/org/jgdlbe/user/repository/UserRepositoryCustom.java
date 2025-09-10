package org.jgdlbe.user.repository;

import org.jgdlbe.user.dto.MentorInfoDTO;
import org.jgdlbe.user.dto.UserDTO;
import org.jgdlbe.user.dto.UserFilterDTO;
import org.jgdlbe.user.entity.UserEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface UserRepositoryCustom {

    Page<UserDTO> findByFilter(UserFilterDTO filterDTO, Pageable pageable);
}
