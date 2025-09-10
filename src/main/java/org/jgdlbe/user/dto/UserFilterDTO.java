package org.jgdlbe.user.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.jgdlbe.common.dto.BaseFilterDTO;
import org.jgdlbe.user.domain.UserRole;

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@SuperBuilder
public class UserFilterDTO extends BaseFilterDTO {

    private UserRole userRole;
}
