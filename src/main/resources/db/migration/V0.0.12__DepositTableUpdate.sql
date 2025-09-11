SET @exists := (
    SELECT COUNT(*)
    FROM information_schema.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME   = 'deposit_rate'
      AND COLUMN_NAME  = 'rsrv_type'
);
SET @ddl := IF(@exists = 0,
               'ALTER TABLE `deposit_rate` ADD COLUMN `rsrv_type` VARCHAR(8) NULL',
               'SELECT 1'
            );
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @exists := (
    SELECT COUNT(*)
    FROM information_schema.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME   = 'deposit_rate'
      AND COLUMN_NAME  = 'rsrv_type_nm'
);
SET @ddl := IF(@exists = 0,
               'ALTER TABLE `deposit_rate` ADD COLUMN `rsrv_type_nm` VARCHAR(32) NULL',
               'SELECT 1'
            );
PREPARE stmt FROM @ddl; EXECUTE stmt; DEALLOCATE PREPARE stmt;

ALTER TABLE deposit_product ADD COLUMN profile VARCHAR(32) NULL;