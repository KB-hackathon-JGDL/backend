CREATE TABLE IF NOT EXISTS card_favorite
(
    favorite_id BINARY(16) NOT NULL,
    user_id     BINARY(16) NOT NULL,
    card_id     BINARY(16) NOT NULL,
    created_at  TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (favorite_id),
    UNIQUE KEY uq_user_card (user_id, card_id),
    CONSTRAINT fk_cardfav_user FOREIGN KEY (user_id) REFERENCES user (user_id),
    CONSTRAINT fk_cardfav_card FOREIGN KEY (card_id) REFERENCES card_info (card_id)
);

CREATE TABLE IF NOT EXISTS deposit_favorite
(
    favorite_id BINARY(16) NOT NULL,
    user_id     BINARY(16) NOT NULL,
    deposit_id  BINARY(16) NOT NULL,
    created_at  TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (favorite_id),
    UNIQUE KEY uq_user_deposit (user_id, deposit_id),
    CONSTRAINT fk_depfav_user FOREIGN KEY (user_id) REFERENCES user (user_id),
    CONSTRAINT fk_depfav_deposit FOREIGN KEY (deposit_id) REFERENCES deposit_product (product_id)
);

CREATE TABLE IF NOT EXISTS supply_favorite
(
    favorite_id BINARY(16) NOT NULL,
    user_id     BINARY(16) NOT NULL,
    program_id  BINARY(16) NOT NULL,
    created_at  TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (favorite_id),
    UNIQUE KEY uq_user_program (user_id, program_id),
    CONSTRAINT fk_supfav_user FOREIGN KEY (user_id) REFERENCES user (user_id),
    CONSTRAINT fk_supfav_program FOREIGN KEY (program_id) REFERENCES support_program_board (support_program_board_id)
);