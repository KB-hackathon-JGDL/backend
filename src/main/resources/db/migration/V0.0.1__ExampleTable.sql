CREATE TABLE example
(
    example_id     BINARY(16),
    example_code   VARCHAR(255),
    example_string VARCHAR(255),
    created_date   DATETIME(6),
    updated_date   DATETIME(6),
    created_by     BINARY(16),
    updated_by     BINARY(16),
    PRIMARY KEY (example_id)
);