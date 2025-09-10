ALTER TABLE deposit_rate
    ADD COLUMN rsrv_type VARCHAR(8) NULL,
    ADD COLUMN rsrv_type_nm VARCHAR(50) NULL;

ALTER TABLE deposit_product
    ADD COLUMN profile VARCHAR(32) NULL;

ALTER TABLE deposit_rate
DROP INDEX uk_rate_opt;

ALTER TABLE deposit_rate
    ADD UNIQUE KEY uk_rate_opt (product_id, rsrv_type, int_rate_type, save_trm);