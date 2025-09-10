CREATE TABLE IF NOT EXISTS chat_log
(
    id                       BIGINT AUTO_INCREMENT,
    mentoring_reservation_id BINARY(16)   NOT NULL,
    message                  VARCHAR(200) NOT NULL,
    created_date             DATETIME(6),
    updated_date             DATETIME(6),
    created_by               BINARY(16),
    updated_by               BINARY(16),
    PRIMARY KEY (id),
    FOREIGN KEY (mentoring_reservation_id) REFERENCES mentoring_reservation (mentoring_reservation_id)
);
