package org.jgdlbe.user.dto;

import java.time.LocalDate;
import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.jgdlbe.common.domain.Region;
import org.jgdlbe.common.dto.BaseDTO;
import org.jgdlbe.user.domain.UserRole;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@EqualsAndHashCode(callSuper = true)
public class UserDTO extends BaseDTO {
    private UUID userId;

    private String username;
    private String name;
    private UserRole userRole;
    private LocalDate birthDate;
    private String phone;
    private Region region;
    private String info;
    private String businessField;
    private String career;
    private String credentials;

    private String accessToken;
}
