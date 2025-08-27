package org.jgdlbe.user.service;

import java.util.Optional;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jgdlbe.common.exception.DataNotFoundException;
import org.jgdlbe.common.exception.ErrorCode;
import org.jgdlbe.common.exception.InvalidRequestException;
import org.jgdlbe.user.dto.UserCreateDTO;
import org.jgdlbe.user.dto.UserDTO;
import org.jgdlbe.user.dto.UserLoginDTO;
import org.jgdlbe.user.entity.UserEntity;
import org.jgdlbe.user.mapper.UserMapper;
import org.jgdlbe.user.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class UserService {

    private final UserRepository userRepository;

    private final UserMapper userMapper;

    public UserDTO createUser(UserCreateDTO createDTO) {
        if (userRepository.findByUsername(createDTO.getUsername()).isPresent()) {
            throw new InvalidRequestException(ErrorCode.USER_IS_EXISTED);
        }

        // TODO password 인코더

        UserEntity created = userRepository.save(userMapper.toEntity(createDTO));
        return userMapper.toDTO(created);
    }

    public UserDTO login(UserLoginDTO userLoginDTO) {
        UserEntity loginUser = userRepository.findByUsername(userLoginDTO.getUsername())
            .orElseThrow(() -> new DataNotFoundException(ErrorCode.COMMON_USER_NOT_FOUND));

        // TODO password 인코더 검증
        // TODO jwt 토큰 반환

        return userMapper.toDTO(loginUser);
    }

    public UserDTO getUser(UUID userId) {
        UserEntity userEntity = userRepository.findById(userId).orElseThrow(
            () -> new DataNotFoundException(ErrorCode.COMMON_USER_NOT_FOUND));
        return userMapper.toDTO(userEntity);
    }
}
