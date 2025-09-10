CREATE TABLE mentor_review
(
    id        BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id   BINARY(16) NOT NULL,
    kind      INT DEFAULT 0,
    clear     INT DEFAULT 0,
    friendly  INT DEFAULT 0,
    listening INT DEFAULT 0,
    detailed  INT DEFAULT 0,
    helpful   INT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES user (user_id),
    UNIQUE KEY unique_user_review (user_id)
);

INSERT INTO mentor_review (user_id)
VALUES (UNHEX(REPLACE('00000000-0000-0000-0000-000000000003', '-', ''))),
       (UNHEX(REPLACE('00000000-0000-0000-0000-000000000004', '-', ''))),
       (UNHEX(REPLACE('00000000-0000-0000-0000-000000000005', '-', ''))),
       (UNHEX(REPLACE('00000000-0000-0000-0000-000000000006', '-', '')));