-- deposit_product: 상품 기본 정보
CREATE TABLE IF NOT EXISTS deposit_product
(
    product_id  BINARY(16)   NOT NULL, -- UUID(BINARY16)
    kor_co_nm   VARCHAR(200) NULL,     -- 금융회사명
    fin_prdt_nm VARCHAR(200) NULL,     -- 금융상품명
    mtrt_int    TEXT         NULL,     -- 만기후이자율 설명
    spd_cnd     TEXT         NULL,     -- 우대조건 (ERD: spd_cnd)
    join_member VARCHAR(200) NULL,     -- 가입대상
    etc_note    TEXT         NULL,     -- 기타유의사항
    max_limit   BIGINT       NULL,     -- 최고한도
    fin_prdt_cd VARCHAR(64)  NOT NULL, -- 금융상품코드
    fin_co_no   VARCHAR(20)  NULL,     -- 금융회사코드
    PRIMARY KEY (product_id),
    UNIQUE KEY uk_fin_prdt_cd (fin_prdt_cd)
);

-- deposit_rate: 금리/옵션 정보 (PK: uuid, FK: product_id)
CREATE TABLE IF NOT EXISTS deposit_rate
(
    uuid              BINARY(16)     NOT NULL, -- UUID(BINARY16) PK
    product_id        BINARY(16)     NOT NULL, -- FK -> deposit_product.product_id
    int_rate_type     ENUM ('S','M') NOT NULL, -- S=단리, M=복리
    intr_rate_type_nm VARCHAR(50)    NULL,     -- 금리유형명
    save_trm          SMALLINT       NOT NULL, -- 저축기간(개월)
    intr_rate         DECIMAL(5, 3)  NULL,     -- 기본금리
    intr_rate2        DECIMAL(5, 3)  NULL,     -- 최고우대금리
    PRIMARY KEY (uuid),
    KEY idx_rate_product (product_id),
    CONSTRAINT fk_rate_product
        FOREIGN KEY (product_id) REFERENCES deposit_product (product_id)
            ON DELETE CASCADE ON UPDATE RESTRICT,
    -- 동일 상품/유형/기간 조합 중복 방지 (권장)
    UNIQUE KEY uk_rate_opt (product_id, int_rate_type, save_trm)
);
