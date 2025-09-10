package org.jgdlbe.mentoringReview.dto;

import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MentorReviewDTO {

    private UUID userId;

    private int kind;
    private int clear;
    private int friendly;
    private int listening;
    private int detailed;
    private int helpful;

}
