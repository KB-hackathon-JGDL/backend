package org.jgdlbe.common.exception;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ErrorCode {

    private String messageId;

    /* COMMON */
    public final static ErrorCode COMMON_ACCESS_DENIED = new ErrorCode(
        "COMMON.ERROR.ACCESS_DENIED");
    public final static ErrorCode COMMON_BINDING_ERROR = new ErrorCode(
        "COMMON.ERROR.BINDING_ERROR");
    public final static ErrorCode COMMON_DATA_NOT_FOUND = new ErrorCode(
        "COMMON.ERROR.DATA_NOT_FOUND");
    public final static ErrorCode COMMON_EXTERNAL_SYSTEM_FAILED = new ErrorCode(
        "COMMON.ERROR.EXTERNAL_SYSTEM_FAILED");
    public final static ErrorCode COMMON_INTERNAL_SERVER_ERROR = new ErrorCode(
        "COMMON.ERROR.INTERNAL_SERVER_ERROR");
    public final static ErrorCode COMMON_INVALID_REQUEST = new ErrorCode(
        "COMMON.ERROR.INVALID_REQUEST");
    public final static ErrorCode DUPLICATED_REQUEST = new ErrorCode(
        "COMMON.ERROR.DUPLICATED_REQUEST");

    /* USER */
    public final static ErrorCode COMMON_USER_NOT_FOUND = new ErrorCode(
        "유저를 찾을 수 없습니다.");
    public final static ErrorCode USER_IS_EXISTED = new ErrorCode(
        "이미 존재하는 유저입니다.");
    public final static ErrorCode INVALID_USERNAME_OR_PASSWORD = new ErrorCode(
        "아이디 또는 패스워드가 일치하지 않습니다.");
    public final static ErrorCode USER_ALREADY_DELETED = new ErrorCode(
        "USER.ERROR.USER_ALREADY.DELETED");
    public final static ErrorCode USER_IS_NOT_MENTOR = new ErrorCode(
        "멘토가 아닙니다.");

    /* MENTORING RESERVATION */
    public final static ErrorCode NOT_FOUND_MENTORING_RESERVATION = new ErrorCode(
        "예약을 찾을 수 없습니다.");
    public final static ErrorCode RESERVATION_TIME_ALREADY_BOOKED = new ErrorCode(
        "이미 예약된 시간입니다.");

}
