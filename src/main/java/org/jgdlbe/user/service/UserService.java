package org.jgdlbe.user.service;

import java.util.List;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jgdlbe.common.config.JwtTokenProvider;
import org.jgdlbe.common.exception.DataNotFoundException;
import org.jgdlbe.common.exception.ErrorCode;
import org.jgdlbe.common.exception.InvalidRequestException;
import org.jgdlbe.user.domain.UserRole;
import org.jgdlbe.user.dto.MentorInfoDTO;
import org.jgdlbe.user.dto.UserCreateDTO;
import org.jgdlbe.user.dto.UserDTO;
import org.jgdlbe.user.dto.UserFilterDTO;
import org.jgdlbe.user.dto.UserLoginDTO;
import org.jgdlbe.mentorReview.entity.MentorReviewEntity;
import org.jgdlbe.user.entity.UserEntity;
import org.jgdlbe.user.mapper.UserMapper;
import org.jgdlbe.user.repository.UserRepository;
import org.jgdlbe.mentorReview.repository.MentorReviewRepository;
import org.springframework.data.domain.Page;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
public class UserService {

    private final UserRepository userRepository;

    private final MentorReviewRepository mentorReviewRepository;

    private final UserMapper userMapper;

    private final PasswordEncoder encoder;

    private final JwtTokenProvider jwtTokenProvider;

    public UserDTO createUser(UserCreateDTO createDTO) {
        if (userRepository.findByUsername(createDTO.getUsername()).isPresent()) {
            throw new InvalidRequestException(ErrorCode.USER_IS_EXISTED);
        }

        UserEntity entity = userMapper.toEntity(createDTO);
        entity.setPassword(encoder.encode(createDTO.getPassword()));

        UserEntity created = userRepository.save(entity);

        if (created.getUserRole() == UserRole.ROLE_MENTOR) {
            MentorReviewEntity reviewEntity = MentorReviewEntity.builder()
                .userId(created.getUserId())
                .build();
            mentorReviewRepository.save(reviewEntity);
        }

        return userMapper.toDTO(created);
    }

    public UserDTO login(UserLoginDTO userLoginDTO) {
        UserEntity loginUser = userRepository.findByUsername(userLoginDTO.getUsername())
            .orElseThrow(() -> new InvalidRequestException(ErrorCode.INVALID_USERNAME_OR_PASSWORD));

        if (!encoder.matches(userLoginDTO.getPassword(), loginUser.getPassword())) {
            throw new InvalidRequestException(ErrorCode.INVALID_USERNAME_OR_PASSWORD);
        }

        UserDTO user = userMapper.toDTO(loginUser);
        user.setAccessKey(jwtTokenProvider.generateAccessToken(loginUser));
        // TODO jwt 토큰 반환

        return user;
    }

    public UserDTO getUser(UUID userId) {
        UserEntity userEntity = userRepository.findById(userId).orElseThrow(
            () -> new DataNotFoundException(ErrorCode.COMMON_USER_NOT_FOUND));
        return userMapper.toDTO(userEntity);
    }

    public Page<UserDTO> getUserList(UserFilterDTO filterDTO) {

        return userRepository.findByFilter(filterDTO, filterDTO.getPageRequest());
    }

    public List<MentorInfoDTO> getMentorUserList() {
        return userRepository.findAllMentorInfos();
    }

    public MentorInfoDTO getMentor(UUID userId) {

        if (!isUserMentor(userId)) {
           throw new InvalidRequestException(ErrorCode.USER_IS_NOT_MENTOR);
        }
        return userRepository.findMentorInfo(userId);
    }

    private boolean isUserMentor(UUID userId) {
        UserEntity user = userRepository.findById(userId).orElseThrow(
            () -> new DataNotFoundException(ErrorCode.COMMON_USER_NOT_FOUND));

        return user.getUserRole() == UserRole.ROLE_MENTOR;
    }
}
