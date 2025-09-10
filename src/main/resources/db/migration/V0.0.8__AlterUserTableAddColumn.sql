ALTER TABLE user
    ADD COLUMN business_field VARCHAR(100) AFTER region,
    ADD COLUMN career         VARCHAR(100) AFTER business_field,
    ADD COLUMN credentials    VARCHAR(100) AFTER career;

UPDATE user
SET birth_date = '1997-06-03',
    region = 'SEOUL',
    phone = '010-1234-1234',
    business_field = '증권 / 투자',
    career         = '종로 펀드회사 근무, (2025) KB멀티캠퍼스 근무',
    credentials    = '투자자산운용사, 신용분석사',
    name           = '김병로',
    info           = '“ 저는 청년 한 분 한 분의 상황을 꼼꼼히 살펴
가장 알맞은 투자 솔루션을
찾아드리는 상담사입니다. “
복잡하고 어려운 절차 속에서도
따뜻하게 함께 걸어가며
든든한 동반자가 되어드리겠습니다. '
WHERE user_id = UUID_TO_BIN('00000000-0000-0000-0000-000000000003');

INSERT INTO user (user_id, username, name, password, user_role, birth_date, phone, region,
                  info, business_field, career, credentials, created_date, updated_date, created_by,
                  updated_by)

VALUES
-- MENTOR 계정
(UNHEX(REPLACE('00000000-0000-0000-0000-000000000004', '-', '')), 'mentor2', '박지훈',
 '$2b$10$KNHtNcDdCdJ3kMIz3nfwSehFd4nNmYMV9l5u7VrJuw6DXVM280REG', 'ROLE_MENTOR', '1995-03-15',
 '010-1234-1234', 'BUSAN', '멘토2', '증권 / 투자', 'KB국민은행 근무', '전기기사, 정보처리기사', NOW(), NOW(),
 (UNHEX(REPLACE('00000000-0000-0000-0000-000000000000', '-', ''))),
 (UNHEX(REPLACE('00000000-0000-0000-0000-000000000000', '-', '')))),

(UNHEX(REPLACE('00000000-0000-0000-0000-000000000005', '-', '')), 'mentor3', '김도현',
 '$2b$10$KNHtNcDdCdJ3kMIz3nfwSehFd4nNmYMV9l5u7VrJuw6DXVM280REG', 'ROLE_MENTOR', '1995-11-10',
 '010-1234-1234', 'SEOUL', '멘토2', '증권 / 투자', 'KB증권 근무', '투자자산운용사, AICPA', NOW(), NOW(),
 (UNHEX(REPLACE('00000000-0000-0000-0000-000000000000', '-', ''))),
 (UNHEX(REPLACE('00000000-0000-0000-0000-000000000000', '-', '')))),

(UNHEX(REPLACE('00000000-0000-0000-0000-000000000006', '-', '')), 'mentor4', '김민지',
 '$2b$10$KNHtNcDdCdJ3kMIz3nfwSehFd4nNmYMV9l5u7VrJuw6DXVM280REG', 'ROLE_MENTOR', '1999-02-10',
 '010-1234-1234', 'SEOUL', '멘토2', '증권 / 투자', '여의도 펀드회사 근무', '투자자산운용사, 정보처리기사', NOW(), NOW(),
 (UNHEX(REPLACE('00000000-0000-0000-0000-000000000000', '-', ''))),
 (UNHEX(REPLACE('00000000-0000-0000-0000-000000000000', '-', ''))));
