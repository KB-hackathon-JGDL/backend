package org.jgdlbe.mentorReview.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Table(name = "mentor_review")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MentorReviewEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private UUID userId;

    private int kind;
    private int clear;
    private int friendly;
    private int listening;
    private int detailed;
    private int helpful;
}
