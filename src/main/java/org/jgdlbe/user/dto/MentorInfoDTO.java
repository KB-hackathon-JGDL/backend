package org.jgdlbe.user.dto;

import com.querydsl.core.annotations.QueryProjection;
import java.time.LocalDate;
import java.util.UUID;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.jgdlbe.common.domain.Region;
import org.jgdlbe.user.domain.UserRole;

public interface MentorInfoDTO {
    UUID getUserId();
    String getName();
    UserRole getUserRole();
    LocalDate getBirthDate();
    String getPhone();
    Region getRegion();
    String getInfo();
    String getBusinessField();
    String getCareer();
    String getCredentials();
    String getMostReview();
}
