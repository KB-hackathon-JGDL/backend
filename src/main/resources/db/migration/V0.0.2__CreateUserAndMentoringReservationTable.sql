CREATE TABLE user
(
    user_id      BINARY(16),
    username     VARCHAR(255)                                    NOT NULL,
    name         VARCHAR(20)                                     NOT NULL,
    password     VARCHAR(255)                                    NOT NULL,
    user_role    ENUM ('ROLE_ADMIN', 'ROLE_MENTOR', 'ROLE_USER') NOT NULL,
    birth_date   DATETIME(6),
    gender       CHAR(1),
    phone        VARCHAR(50),
    region       ENUM ('SEOUL', 'BUSAN', 'DAEGU', 'INCHEON', 'GWANGJU',
        'DAEJEON', 'ULSAN', 'SEJONG', 'GYEONGGI', 'GANGWON',
        'CHUNGBUK', 'CHUNGNAM', 'JEONBUK', 'JEONNAM', 'GYEONGBUK',
        'GYEONGNAM', 'JEJU'),
    info         VARCHAR(255),
    created_date DATETIME(6),
    updated_date DATETIME(6),
    created_by   BINARY(16),
    updated_by   BINARY(16),
    PRIMARY KEY (user_id)
);

CREATE TABLE mentoring_reservation
(
    mentoring_reservation_id BINARY(16),
    mentor_user_id           BINARY(16) NOT NULL,
    mentee_user_id           BINARY(16),
    mentoring_time           INT        NOT NULL,
    mentoring_date           DATE       NOT NULL,
    PRIMARY KEY (mentoring_reservation_id),
    FOREIGN KEY (mentor_user_id) REFERENCES user (user_id),
    FOREIGN KEY (mentee_user_id) REFERENCES user (user_id)
)