package org.jgdlbe.mentorReview.dto;

import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MentorReviewUpdateDTO {
    private UUID mentorUserId;
    private boolean kind;
    private boolean clear;
    private boolean friendly;
    private boolean listening;
    private boolean detailed;
    private boolean helpful;
}