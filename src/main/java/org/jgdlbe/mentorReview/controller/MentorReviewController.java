package org.jgdlbe.mentorReview.controller;

import lombok.RequiredArgsConstructor;
import org.jgdlbe.mentorReview.dto.MentorReviewDTO;
import org.jgdlbe.mentorReview.dto.MentorReviewUpdateDTO;
import org.jgdlbe.mentorReview.service.MentorReviewService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class MentorReviewController {

    private final MentorReviewService mentorReviewService;


    @PatchMapping("/mentor-reviews")
    public MentorReviewDTO updateMentorReview(@RequestBody MentorReviewUpdateDTO updateDTO) {
        return mentorReviewService.updateMentorReview(updateDTO);
    }
}
