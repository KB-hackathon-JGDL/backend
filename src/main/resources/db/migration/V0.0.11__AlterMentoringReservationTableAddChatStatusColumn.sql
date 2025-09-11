ALTER TABLE mentoring_reservation
    ADD COLUMN chat_status ENUM('PENDING', 'ACTIVE', 'COMPLETED') NOT NULL;
