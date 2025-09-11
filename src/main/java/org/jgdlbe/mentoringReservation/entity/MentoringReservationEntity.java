package org.jgdlbe.mentoringReservation.entity;

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
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;
import org.jgdlbe.mentoringReservation.domain.ChatStatus;

@Entity
@Data
@Table(name = "mentoring_reservation")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MentoringReservationEntity {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(columnDefinition = "BINARY(16)")
    private UUID mentoringReservationId;

    private UUID mentorUserId;
    private UUID menteeUserId;

    private Integer mentoringTime;
    private LocalDate mentoringDate;
    private String consultationCard;
    @Enumerated(EnumType.STRING)
    private ChatStatus chatStatus;
}
