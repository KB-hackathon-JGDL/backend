package org.jgdlbe.user.mapper;

import lombok.RequiredArgsConstructor;
import org.jgdlbe.user.dto.UserCreateDTO;
import org.jgdlbe.user.dto.UserDTO;
import org.jgdlbe.user.entity.UserEntity;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class UserMapper {

    public UserEntity toEntity(UserCreateDTO dto) {
        return UserEntity.builder()
            .username(dto.getUsername())
            .name(dto.getName())
            .password(dto.getPassword())
            .userRole(dto.getUserRole())
            .birthDate(dto.getBirthDate())
            .phone(dto.getPhone())
            .region(dto.getRegion())
            .info(dto.getInfo())
            .build();
    }

    public UserDTO toDTO(UserEntity entity) {
        return UserDTO.builder()
            .userId(entity.getUserId())
            .username(entity.getUsername())
            .name(entity.getName())
            .userRole(entity.getUserRole())
            .birthDate(entity.getBirthDate())
            .phone(entity.getPhone())
            .region(entity.getRegion())
            .info(entity.getInfo())
            .createdDate(entity.getCreatedDate())
            .build();
    }
}
