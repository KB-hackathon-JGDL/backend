package org.jgdlbe.user.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.time.LocalDate;
import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;
import org.jgdlbe.common.domain.Region;
import org.jgdlbe.common.entity.BaseEntity;
import org.jgdlbe.example.dto.ExampleUpdateDTO;
import org.jgdlbe.user.domain.UserRole;

@Entity
@Data
@Table(name = "user")
@Builder
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class UserEntity extends BaseEntity {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(columnDefinition = "BINARY(16)")
    private UUID userId;

    private String username;
    private String name;
    private String password;
    @Enumerated(EnumType.STRING)
    private UserRole userRole;
    private LocalDate birthDate;
    private String phone;
    @Enumerated(EnumType.STRING)
    private Region region;
    private String info;

}
