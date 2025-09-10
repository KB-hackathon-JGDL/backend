CREATE TABLE IF NOT EXISTS support_program_board
(
    support_program_board_id BINARY(16)   NOT NULL,
    title                    VARCHAR(300) NOT NULL,
    region                   VARCHAR(120),
    start_date               DATE,
    end_date                 DATE,
    article_organization     VARCHAR(200),
    article_target           VARCHAR(500),
    article_content          TEXT,
    article_contact          VARCHAR(200),
    article_etc              TEXT,
    PRIMARY KEY (support_program_board_id)
);

CREATE TABLE IF NOT EXISTS support_program_file
(
    file_id                  BINARY(16)   NOT NULL,
    support_program_board_id BINARY(16)   NOT NULL,
    origin_name              VARCHAR(255) NOT NULL,
    file_type                VARCHAR(255) NOT NULL,
    PRIMARY KEY (file_id),
    INDEX idx_spf_board (support_program_board_id),
    CONSTRAINT fk_spf_board
        FOREIGN KEY (support_program_board_id)
            REFERENCES support_program_board (support_program_board_id)
            ON DELETE CASCADE
            ON UPDATE RESTRICT
);


SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '가배도와 함께하는 ''함께 서기'' 프로젝트 참여자 모집',
        '서울',
        '2025-08-28',
        '2025-09-18',
        '굿네이버스 서울중남지부·㈜가배도',
        '서울시 자립청년+가족',
        '바리스타 채용, 생계/자기계발비, 적금지원비',
        'banghwa2@gnk.or.kr / 팩스 / 02-2662-6661',
        NULL);
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '신청서', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '2025 하반기 월드비전 자립준비청년 지원사업',
        '충남',
        '2025-07-18',
        '2025-10-31',
        '월드비전',
        '만30세 미만 자립준비청년 및 보호연장아동',
        '꿈지원비, 주거비, 주거환경개선비, 긴급생계비',
        'cnjarip21@naver.com / 041-541-6553',
        NULL);
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '신청서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '개인정보수집이용동의서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '추천서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '보호종료확인서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '통장사본(긴급생계비 신청자)', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '교육비활용계획서(교육비신청자)', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '교보생명 자립준비청년 리스타트 LIFE 금융교육',
        '전국',
        '2024-12-31',
        '2025-12-31',
        '교보생명',
        '만18~27세 자립준비청년 100명',
        '금융교육(5회), Life 컨설팅, 활동비 60만원, 금융실습, 자립교육, 커뮤니티 활동',
        'geoid2021@naver.com',
        NULL);
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '신청서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '주민등록초본', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '보호종료확인서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '보호연장확인서', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '2025년 WOORI Chance 자립키트 (3차년도)',
        '전국',
        '2025-01-01',
        '2026-02-20',
        '우리금융미래재단·굿네이버스',
        '2024~2026 보호종료 자립준비청년(선착순 700명)',
        '생활안내서, 다이어리, 생필품 22종, 생활가전 선택',
        'https://www.woorichancekit.com/',
        NULL);
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '보호종료확인서', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '''자립교육'' 참여자 모집',
        '충남',
        '2025-03-07',
        '2025-12-31',
        NULL,
        '충남지역 보호종료 5년 이내 자립준비청년·보호연장아동',
        '자립교육 프로그램',
        'https://forms.gle/7tjPgQdQGZiJ15Uj6 / 041-541-6553',
        NULL);
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '신청서', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '클린하우스에서 리스타트',
        '서울, 경기, 인천',
        '2025-02-01',
        '2025-12-31',
        '청소년행복재단',
        '쓰레기집에서 생활하는 만24세 이하 고위기 청(소)년',
        '주거환경 개선, 사회복귀 단계별 지원',
        'aloysius0801@withjoy.or.kr / https://withjoy.or.kr/notice',
        NULL);
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '신청서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '보호종료확인서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '재원사실확인서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '재직증명서(해당자)', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '재학증명서(해당자)', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '주택계약서', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '희망디딤돌 충북센터 다온BRIDGE 입주자 모집',
        '충북',
        '2025-02-03',
        '2025-12-31',
        '충북센터',
        '만18세 이상 퇴소 5년 이내 보호종료(예정) 청년',
        '1인 주거공간 제공, 최대 2년, 사례관리 서비스',
        'https://jarip-hope.or.kr/residence/02.php / 043-267-5550',
        NULL);
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '신청서', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '자립준비청년 울타리 대출사업',
        '전국',
        '2025-01-01',
        '2099-12-31',
        '사회연대은행',
        '보호종료 5년 경과한 23~34세 자립준비청년',
        '금융 대출(두 번째 기회), 장기 금융지원',
        '02-2280-3372 / https://www.bss.or.kr/business-apply/9991/',
        NULL);
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '사업신청서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '보호종료확인서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '주민등록등본', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '신분증 사본', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '대출용도 증빙서류', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '[두나무 넥스트 잡] 창업지원사업 참여자 모집',
        '전국',
        '2025-01-01',
        '2025-12-31',
        '두나무·사회연대은행',
        '19~39세 자립준비청년 및 쉼터 청년 (신규·기창업자 포함)',
        '무이자 대출(최대 2천만원, 4년), 경영컨설팅(2회)',
        NULL,
        '사회적기업·소셜벤처 고용 유지 필요');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '신청서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '개인정보이용동의서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '주민등록등본', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '주거지 임대차계약서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '신분증 사본', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '통장 사본', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '보호종료확인서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '소득금액증명원', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '해당자제출서류', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '취약계층청년 휴대폰 요금 지원 톡톡 프로젝트',
        '전국',
        '2025-01-01',
        '2025-12-31',
        '초록우산 경기지역본부',
        '만18~24세 저소득 청년',
        '휴대폰 요금 월 45,000원 + 휴대폰 보험(1년간)',
        '070-8820-0647',
        NULL);
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '신청서', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '2025 청년 생활안정 지원사업(3차)',
        '전국',
        '2025-09-01',
        '2025-09-11',
        '아름다운재단·청년지갑트레이닝센터',
        '전국 아동양육시설(그룹홈 포함) 및 가정위탁 보호 종료 만18~34세 자립준비청년 (수급·차상위 또는 기준 중위소득 100% 이하)',
        '생활안정지원금, 긴급지원금(일부), 생활안정 1:1 재무관리상담',
        'https://gwon.net/2025_bfyouth3',
        '신청방법: 온라인 신청서 작성 및 서류 제출(포스터 QR 또는 링크)');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '생활안정지원금', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '보호종료확인서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '저소득/기준 중위소득 확인서류', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '2025년 자립준비청년 매입임대주택 입주자 수시모집',
        '대구',
        '2025-09-09',
        '2025-10-31',
        '대구도시개발공사',
        '「아동복지법」 제16조 및 제16조의3에 따라 가정위탁 보호조치가 종료되거나 아동복지시설에서 퇴소한지 5년 이내인 사람 - 보호조치를 연장한 자, 보호조치 종료 예정자, 시설 퇴소 예정자 포함',
        '임대보증금 100만원,시중 시세의 40% 수준의 임대료 , 2년 , 재계약 4회가능 (무주택 자격 충족 시 최장 10년 거주)',
        'gwjeong@dudc.or.kr',
        '문의처 : 대구도시개발공사 주거복지처처 청년 매입임대 담당(☎ 053-350-0293)');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '신청서', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '자립준비청년 법률상담',
        '서울',
        '2025-09-01',
        '2025-09-12',
        '한국여성변호사회',
        '자립준비청년(지역 및 보호종료 기간 등 무관)',
        '상속,노무,부동산,형사 등 전반적인 법률문제',
        'gwjeong@dudc.or.kr',
        '상담 희망 내용 및 가능시간 확인 후 매칭 , 개별 연락 및 내방 상담');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '개별연락', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '2025 청년 면접비 지원사업 참여자 모집',
        '대구',
        '2025-03-04',
        '2025-11-30',
        '대구광역시청년센터',
        '대구 소재 중소·중견기업 면접에 참여한 미취업 상태의 만19~39세 청년',
        '면접비 1인 1회 5만원 지원 (대구 소재 중소기업 면접 대상, 선착순·예산 소진 시 조기마감)',
        '053-426-1939 / dgyc1939@daum.net',
        '접수방법: 온라인 / 결과발표일: 2025-11-30 / 24년도 참여자 재참여 가능 / 예산 소진 시 조기마감');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '참여신청서(구글폼)', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '통장사본', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '신분증 사본', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '면접 증빙서류 (면접 확인서, 확인 문자, 확인 메일, 기타 증빙)', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '대한전력전자(주) 생산·기술직 신입/경력 채용',
        '경기',
        '2025-01-01',
        '2026-01-01',
        '대한전력전자(주)',
        '자립준비청년, 생산·기술직 신입 및 경력(1~5년) / 고등학교 졸업 이상',
        'UPS 생산, 제품 검수·포장, 현장 납품 및 설치 지원, 제품 구매보조',
        '온라인 접수 또는 saintpain47@naver.com',
        '근무조건: 정규직(수습 3개월), 주5일(08:30~18:00), 경기 안양시 동안구 전파로 104번길 70. 복지: 연차, 휴가, 상여금, 퇴직연금, 4대보험, 자격증 수당, 단체상해보험, 각종 선물·지원. 전형절차: 서류전형 → 1차면접 → 2차면접 → 최종합격');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '이력서(첨부파일 양식)', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '기타 증빙서류(자격증 사본 등)', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '''두발로'' 4기 참여자 모집 (교육/주거/생계지원)',
        '서울',
        '2025-08-01',
        '2025-12-31',
        '(주)범익',
        '자립준비청년 (개발자·디자이너·사무직 희망자)',
        'IT 전문가 양성 과정: 기초교육 → 취업연계. 개발자, 디자이너, 일반사무 과정. 교육/주거/생계지원 포함.',
        '김민선 담당자 (kms@bi-cns.com / 02-6952-8164)',
        '교육 및 면접 장소: 서울 영등포구 (선유도역 인근) (주)범익 서울 사업장. 신청방법: 포스터 QR설문 작성(https://bit.ly/44J2BpL). 프로그램 세부정보: https://m.site.naver.com/1NgED. 유의사항: 취업 연계 목적, 허위 서류 제출 시 불이익, 모집 일정은 내부 사정에 따라 변경될 수 있음.');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '이력서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '자기소개서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '최종합격자 추가 제출서류(추후 안내)', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '(주)하이트롤 생산직 모집',
        '경기',
        '2025-01-01',
        '2026-01-01',
        '(주)하이트롤',
        '자립준비청년, 학력·경력 무관',
        '생산직 채용 (범용선반/CNC선반). 주요업무: 정밀 가공작업, 기계 유지보수, 생산 공정 관리, 품질 검사, 작업 일정 조정.',
        '온라인 접수 (개별연락)',
        '근무조건: 정규직, 주5일, 경기도 파주시 조리읍 팔학골길 141. 우대사항: 전기/전자공학 전공, CNC선반기능사, 관련자격증 소지, 직무경험, CAD/CAM 능숙자. 자립준비청년 우선채용.');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '이력서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '자격증 사본(해당자)', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '기타 증빙서류(경력증명 등)', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '자립준비청년 엔지니어 인턴쉽 및 채용',
        '경기',
        '2025-01-01',
        '2026-01-01',
        '(주)범양이엔지 (귀뚜라미범양냉방 계열)',
        '자립준비청년 (엔지니어 인턴십 후 채용 연계 희망자)',
        '공조냉동부문 엔지니어 인턴십 → 채용 연계 프로그램. 현장 실무 경험, 자격증 취득, 기술 벨류업을 통한 전문 엔지니어 양성.',
        '채용담당자 최영찬 차장 (010-3765-7986)',
        '채용절차: 1차 서류심사(자기소개서·이력서) → 2차 1:1 면접 → 합격통보');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '이력서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '자기소개서', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '남양주시 2025년 청년도전지원사업',
        '경기',
        '2025-01-01',
        '2026-01-01',
        '남양주시 · (사)한국고용복지센터(남양주점)',
        '최근 6개월 간 미취업 중인 만 18~39세 청년',
        '자기이해, 직무탐색, 취업역량 강화, 원데이 클래스 등 맞춤형 프로그램 제공. 최대 350만원 수당 및 인센티브(참여수당, 이수 인센티브, 취업 인센티브) 지원. 프로그램 종료 후 1:1 상담·컨설팅으로 취업 및 진로설계 밀착 지원.',
        '031-595-6304 / 경기도 남양주시 사릉로 14, 4층(금곡프라자) / 인스타그램 @young._.dream',
        '교육장소: 남양주시 청년창업센터, 사회적경제지원센터, 다산 정약용도서관. 신청방법: 고용24 홈페이지 ''청년도전지원사업'' 검색 후 신청. 모집 일정: 상시 선착순, 중기 3기(7/2~10/31), 단기(9/16~11/4).');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '참여신청서(고용24 양식)', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '이력서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '기타 기관 요청 서류', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '[서대문구] 2025 청년도전 지원사업',
        '서울',
        '2025-01-01',
        '2026-01-01',
        '서대문구 · 뉴팀즈 주식회사',
        '만18~34세 청년 (최근 6개월 이상 취업·교육·직업훈련 미참여자, 주30시간 미만 아르바이트 종사자)',
        '자기이해, 직무탐색, 취업역량강화, 원데이클래스 등 프로그램 제공. 참여자에게 최대 220~350만원 수당 및 인센티브 지원. 1:1 맞춤형 상담·컨설팅 및 국민취업지원제도 연계.',
        '신청서: https://forms.gle/MXUziLfZxoq4Lhaj9 / 카카오톡 플러스친구: sdmyouth / 인스타그램: @sdm_youthchallenge',
        '진행장소: 서대문구 경기대로 79, B1층 엘앤씨타운. 프로그램 일정: 중기 15주 과정(5월~8월), 주1회 10:00~18:00. 모집 인원 초과 시 조기 마감. 신청방법: 구글 신청서 제출 및 고용24 로그인 후 기관 선택.');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '참여신청서(구글폼)', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '고용24 신청서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '기타 기관 요청 서류', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '정규직 신입사원 및 나무의사 모집 공고',
        '서울',
        '2025-01-01',
        '2026-01-01',
        '(주)강전유나무종합병원',
        '정규직 신입사원 및 나무의사 채용 희망 청년',
        '정규직 채용. 복리후생: 주5일 근무, 4대보험, 점심·간식 제공, 기숙사 제공(일부 비용 부담), 출장 경비 회사 부담.',
        '주소: 서울 송파구 위례성대로16길 4-17 3층(방이동) / 팩스: 02-2202-0905 / 이메일: ktree1976@daum.net / 문의: 인사담당자 이용규 부장 (010-5226-7696, 02-2202-0900~4)',
        '신청방법: 우편, 팩스, 이메일, 방문 접수 가능. 지방출장 시 회사에서 비용 전액 부담.');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '이력서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '자기소개서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '기타 회사 요청 서류', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '2025년 자립준비청년 디지털 진로지원 사업 ''디벨롭''',
        '전국',
        '2025-01-01',
        '2026-01-01',
        '함께일하는재단 · 과학기술정보통신부',
        '자립준비청년, 아동복지시설/위탁가정 퇴소(예비 포함) 청년, 보호대상아동(중·고등학생), 청소년쉼터 입·퇴소자',
        'AI·디지털 분야 창업·창작·취업 연계 교육을 통한 진로 지원. 창업교육(기초·실전), 창작교육(콘텐츠 기획·영상편집), 취업연계(직무교육·인턴십). 전 과정 무료, 식사 제공, 교통비 지원, 우수자 표창, 수료증 발급.',
        '온라인 신청: https://flagup.kr/application/list.php / 모집 공고: flagup.kr, 자립정보ON',
        '사업일정: 창업교육(5~9월, 해외 탐방 포함), 창작교육(8~11월), 취업연계(5~12월, 인턴십 연 2회). 주요혜택: 교육수당(월 60만원), 자격증 취득 지원(Adobe CP, ITQ OA Master), 인턴십 지원금(월 최대 250만원).');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '참여신청서(온라인 양식)', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '보호종료확인서(해당자)', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '학생증 또는 재학증명서(보호대상아동 해당자)', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '기타 기관 요청 서류', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '[러쉬코리아] 디지털물류팀 주간 현장 업무 담당자 모집',
        '충북',
        '2025-01-01',
        '2026-01-01',
        '러쉬코리아',
        '자립준비청년(아동복지법 제38조 자립지원 대상자), 지게차 운전 가능자, 학력·성별·전공 무관',
        '디지털물류팀 주간 현장 업무 담당자 채용. 주요업무: 물류 입출고 관리, 피킹/패킹, 재고관리, 제품 관리 및 적재.',
        '이메일: lush_recruit@lush.co.kr (제목: [자립] 주간 현장 업무 지원_이름)',
        '근무형태: 계약직(3개월) 후 정규직 전환 가능. 근무지: 충북 진천군 덕산읍 신척산단4로 93. 근무요일: 주5일(월~금). 급여: 면접 후 개별 연락.');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '이력서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '자기소개서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '보호종료확인서 또는 보호확인서 또는 재원증명서 (택1)', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '2025년 한국교통안전공단 하반기 정규직 직원 채용',
        '전국',
        '2025-09-01',
        '2025-09-11',
        '한국교통안전공단',
        '자립준비청년 우대, 정규직 신규직 채용(행정 4명, 기술 51명, 연구교수 11명)',
        '정규직 채용 총 66명: 행정(4명), 기술(51명), 연구교수(11명). 근무지 전국. 지원서 접수 9/1~9/11, 온라인 접수(채용 홈페이지).',
        '채용 홈페이지: https://kotsa.career.co.kr / 문의: 채용콜센터(02-2006-6122), 인재개발처(054-459-7199, 7197)',
        '결과 발표일: 2025-10-01. 결과 확인: 채용 홈페이지 참조.');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '지원서(온라인 양식)', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '자격증 및 경력증빙서류(해당자)', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '기타 공단 요구 서류', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '포니정 발돋움장학',
        '전국',
        '2025-08-27',
        '2025-09-15',
        '포니정재단 · 사회복지법인 아이들과미래재단',
        '전국 자립준비청년(보호종료/보호예정) 및 보호연장아동 (1996~2007년 출생자, 2026년 1월 31일 보호종료 예정자 포함)',
        '자립준비청년의 직업·창업을 위한 장학금 및 프로그램 지원. 모집인원 20명.',
        '개별 연락 예정',
        '서류합격자 발표: 2025-09-22, 면접심사: 2025-09-28~09-29(오프라인), 최종합격자 발표: 2025-10-02.');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '신청서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '개인정보동의서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '보호종료(예정) 확인서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '기타 기관 요청 서류', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '서울시 2025년 청년인생설계학교 3기 참여자 모집',
        '서울',
        '2025-08-25',
        '2025-09-15',
        '서울특별시 · 청년인생설계학교 운영사무국',
        '만 19~39세 서울시 거주 청년(1985~2006년생). 제대군인 최대 42세까지 신청 가능. 자립준비청년 우선선정(정원의 50%까지).',
        '총 435명 모집 (스케치코스 15명, 라이프코스 140명, 커리어코스 200명, 리더십코스 80명). 각 코스별 매주 1회 2시간, 총 5회 구성. 진행기간: 2025-10-13 ~ 2025-11-15.',
        '운영사무국 010-5695-3056 / 카카오톡 @청년인생설계학교 / 신청: https://youth.seoul.go.kr',
        '진행장소: 서울광역청년센터, 중랑 청년청 등. 결과발표일: 2025-09-19, 개별 안내 및 청년몽땅정보통 공지사항.');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '참여신청서(온라인 양식)', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '개인정보 동의서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '기타 운영사무국 요청 서류', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '2025년 한국가스안전공사 정규직(채용형인턴) 채용',
        '전국',
        '2025-09-01',
        '2025-09-16',
        '한국가스안전공사',
        '정규직 채용형 인턴 지원자 (행정, 기술, 연구, 장애, 자립준비청년). 자립준비청년 대상 제한경쟁 및 우대가점 적용.',
        '채용인원 73명. 분야: 행정(경영지원), 기술(검사/점검·안전진단/평가), 연구(기술연구), 장애, 자립준비청년. 전형절차: 서류평가 → 필기시험 → 자기소개서·증빙서류 접수 → 면접시험 → 합격자 발표 → 입사 및 신입사원 교육.',
        '홈페이지: https://kgs.applyin.co.kr',
        '접수기간: 2025-09-08 14:00 ~ 2025-09-16 14:00. 결과발표일: 2025-12-10, 공사 홈페이지에서 개별 확인. 지원분야별 중복지원 불가.');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '지원서(온라인 작성)', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '자기소개서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '증빙서류(자격증, 경력증명서 등)', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '자립준비청년 확인서(해당자)', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '진로꿀팁소통 ''크리에이터''',
        '서울',
        '2025-09-01',
        '2025-09-16',
        '서울자립지원전담기관',
        '크리에이터 활동 및 유튜브 운영에 관심 있는 청년',
        '유튜버 ''은수저''와 함께하는 진로꿀팁소통 프로그램. 내용: 세상에 없는 채널, 나만의 유튜브로 시작하기.',
        '담당: 인혜령 주임 (070-8833-7687) / 신청링크: https://forms.gle/sPXEJDievUkjV87F9',
        '일정: 2025-09-23(화) 16:00~18:30. 인원: 10명 이내. 장소: 서울자립지원전담기관 교육장. 결과 발표일: 2025-09-17, 개별 연락.');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '참여신청서(구글폼)', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '한국수목원정원관리원 체험형 청년인턴 공고''',
        '전국',
        '2025-09-08',
        '2025-09-18',
        '한국수목원정원관리원',
        '자립준비청년(제한경쟁)',
        '제한경쟁(자립준비청년,3명) 행정지원, 교육지원 , 연구지원 , 근무지 세종',
        '-',
        '계약기간 약 6개월(25.10.27-26.4.24) , 보수 월 2,236,270원 , 근무 평가를 통해 1회에 한하여 3개월 근로계약 연장 가능');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '응시지원서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '자기소개서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '개인정보 수집 이용 동의서', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '2025 하반기 직업교육 훈련생 모집(추가모집)',
        '서울',
        '2025-01-01',
        '2026-01-01',
        '서울시 직업교육기관',
        '만 15세 이상 서울시민, 서울 외국인 등록 영주권자 또는 내국인 배우자 및 그 자녀',
        '직업교육 훈련 추가 모집. 교육비·교재비·실습비 전액 무료. 국가기술자격증 취득 지원 및 기능검정료 지원. 우선 선발자 수당 지급(월 최대 25만원). 취업 연계 및 중식 제공.',
        '온라인: www.sitedu.or.kr / 방문: 강동구 고덕로 183 / 문의: 02-440-5500',
        '상시 모집(추가모집). 결과발표 상시, 개별 연락.');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '참여신청서(온라인 양식)', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '주민등록등본 또는 외국인등록증', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '기타 기관 요청 서류', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '[두나무 넥스트 잡] 인턴십 지원사업 (2차모집)',
        '전국',
        '2025-08-20',
        '2025-09-21',
        '두나무 · (사)함께만드는세상(사회연대은행)',
        '만 19~34세 자립준비청년 및 쉼터 입·퇴소 청년 (아동양육시설, 공동생활가정, 가정위탁 퇴소 청년, 청소년 쉼터 3개월 이상 보호 청년)',
        '인턴십 프로그램 운영. 인턴십 오리엔테이션 및 온보딩 교육(9/24~9/26) 후 2025-10-01부터 인턴십 수행. 주 5일 근무, 세전 월 230만원 급여 지급. 월 1회 기업 멘토링 제공. 교육 성실 참가자 대상 교육수당 지급.',
        '신청링크: https://www.dunamunextseries.or.kr/job/job5_1',
        '결과 발표일: 2025-09-22, 개별 안내 예정. 지원요건: 오리엔테이션 및 온보딩교육 전 일정 참여 가능, 인턴십 기간 성실 수행 가능.');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '이력서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '자기소개서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '보호종료확인서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '쉼터 보호확인서', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '[KISA] AI 보안관제 전문인력 양성기초(온라인) 모집',
        '전국',
        '2025-08-18',
        '2025-09-23',
        '한국인터넷진흥원(KISA) · 한국정보보호교육센터',
        '정보보안에 관심 있는 누구나 (비전공자·초심자 포함)',
        'AI 보안관제 전문인력 양성과정 기초(온라인). 교육기간: 2025-09-01 ~ 2025-09-30. 온라인 강의, 시간·장소 제약 없이 수강 가능. 비전공자도 참여 가능한 정보보안 기초 교육.',
        '문의: 한국정보보호교육센터 (T. 02-921-1466 / 카카오채널 ''한국정보보호교육센터'')',
        '교육비 전액 지원. 수료 시 2026년 K-shield 주니어 선발 및 AI 보안관제 전문인력 양성과정(오프라인) 선발 시 가산점 부여. 결과 확인: 신청 시 사용한 메일 주소로 개별 발송.');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '참여신청서(온라인 접수)', '문서');

SET @board_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_board (support_program_board_id, title, region, start_date, end_date,
                                   article_organization, article_target, article_content, article_contact, article_etc)
VALUES (@board_id,
        '[천안시] 2025 청년도전 지원사업',
        '충남',
        '2025-07-30',
        '2025-10-20',
        '천안청년센터 이음 · 천안시 · 고용노동부',
        '천안시 거주 18~39세 미취업 청년 (6개월 이상 취·창업/교육/직업훈련 이력 없는 자, 주 30시간 미만 생계형 근로자, 대학(원)생·휴학생·졸업유예자 제외)',
        '심리 및 진로상담, 자신감 회복, 진로탐색, 취업역량 강화, 외부연계, 자율활동. 도전 단기(40시간, 최대 50만원, 선착순 60명), 도전 중기(120시간, 최대 220만원, 선착순 120명).',
        '전화: 041-900-2031 / 방문: 천안시 동남구 은행길5-4, 천안청년몰 흥흥발전소 B1 청년도전지원팀 / 카카오톡: 천안청년센터 이음 채널',
        '접수방법: 고용24 온라인 신청(https://www.work24.go.kr/cm/main.do), 구글폼(https://forms.gle/XaXn931zpeBsoyia7), 방문 접수 가능. 결과발표: 상시 개별 연락. 유의사항: 신청정보 부정확 시 취소 가능, 참여 시 유사 사업 6개월간 제한.');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '참여신청서(온라인·구글폼)', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '신분증 사본', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '주민등록등본 또는 거주확인서', '문서');
SET @file_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO support_program_file (file_id, support_program_board_id, origin_name, file_type)
VALUES (@file_id, @board_id, '기타 센터 요청 서류', '문서');