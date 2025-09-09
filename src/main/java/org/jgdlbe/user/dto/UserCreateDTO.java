package org.jgdlbe.user.dto;

import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.jgdlbe.common.domain.Region;
import org.jgdlbe.user.domain.UserRole;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserCreateDTO {

    private String username;
    private String name;
    private String password;
    private UserRole userRole;
    private LocalDate birthDate;
    private String phone;
    private Region region;
    private String info;
    private String businessField;
    private String career;
    private String credentials;


}
