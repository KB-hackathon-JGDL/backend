CREATE TABLE IF NOT EXISTS card_info
(
    card_id           BINARY(16)   NOT NULL,
    card_name         VARCHAR(200) NOT NULL,
    issuer            VARCHAR(120) NOT NULL,
    annual_fee        VARCHAR(100),
    monthly_spend     VARCHAR(100),
    issuance_fee      VARCHAR(100),
    brand             VARCHAR(100),
    domestic_overseas VARCHAR(100),
    profile           VARCHAR(50)  NULL,
    PRIMARY KEY (card_id)
);

CREATE TABLE IF NOT EXISTS card_benefit
(
    benefit_id    BINARY(16) NOT NULL,
    card_id       BINARY(16) NOT NULL,
    benefit_order INT        NOT NULL,
    benefit_text  TEXT       NOT NULL,
    PRIMARY KEY (benefit_id),
    CONSTRAINT fk_card_benefit_card FOREIGN KEY (card_id) REFERENCES card_info (card_id)
);

INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('fa6d774a4d8c5505b7a1bf64c0f45a24'), 'ONE 체크카드', '케이뱅크', '없음', '없음', '없음', 'VISA', '해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('e975fcc954835e20ad5447baf619b956'), '노리2 체크카드 (KB Pay)', 'KB국민카드', '없음', '20만원 이상', '없음',
        'VISA, Mastercard', '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('b510fbb931e2544594d34423f0115de8'), '모빌리언스카드', 'KG모빌리언스', '없음', '없음', '없음', '', '국내전용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('5abc519c90a552aaa6fdb36634197e11'), '트래블러스 체크카드', 'KB국민카드', '없음', '20만원 이상', '없음', 'Mastercard',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('4a1bda5ccd845617b2a0d0d82ae98d31'), '네이버페이 머니카드', '네이버페이', '없음', '없음', '없음', 'VISA', '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('589ad3e5cf00578fb443dfbbfac076c0'), '더나은 체크카드', 'MG새마을금고', '없음', '30만원 이상', '없음', 'VISA', '해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('0b2ffd12da4b500092d424bdee2e715e'), 'KB 틴업 체크카드', 'KB국민카드', '없음', '없음', '없음', 'Mastercard',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('28e0b8d44d7657be8478f7fba4f08779'), '토스뱅크 체크카드', '토스뱅크', '없음', '없음', '없음', 'Mastercard', '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('410db53ffe785cabbeb25876a78a5d43'), '신한카드 SOL트래블 체크', '신한카드', '없음', '없음', '없음', 'Mastercard',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('1aaf29210b935991a7ee6bf388fbce6e'), '네이버페이 머니 하나 체크카드', '하나카드', '없음', '25만원 이상', '없음', 'Mastercard',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('2ce809e4db045209b6a0c64329b83f14'), '카카오페이 신한 체크카드', '신한카드', '없음', '없음', '없음', 'Mastercard', '해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('e6018be576fd56039801ebf07d68323b'), '신한카드 Deep Dream 체크', '신한카드', '없음', '없음', '없음', 'VISA, UnionPay',
        '해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('edd5d1b6f94b5ed79cfa767495a8b5f5'), '토심이 첵첵 체크카드', 'KB국민카드', '없음', '30만원 이상', '없음', 'Mastercard',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('79b45044a5545fd1909e15fecccd8285'), '노리2 체크카드 (Global)', 'KB국민카드', '없음', '20만원 이상', '없음', 'Mastercard',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('c6e2e19ea591556b8b116c6374fa08a3'), '직장인보너스체크카드', 'KB국민카드', '없음', '20만원 이상', '없음', 'VISA, Mastercard',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('3b8d949e72e15b449f5ce2d0e15efb88'), '개이득 체크카드', '우체국', '없음', '없음', '없음', 'VISA', '해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('ea77944d8a0152739a12f5d506483e32'), '신한카드 Hey Young 체크', '신한카드', '없음', '20만원 이상', '없음', 'VISA',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('40c18cc4a26c578395b6949b56658f33'), '카드의정석 오하CHECK', '우리카드', '없음', '20만원 이상', '없음', 'Mastercard',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('a07cb772d5e15c77a4fb4e56d535d5d5'), '노리 체크카드', 'KB국민카드', '없음', '20만원 이상', '없음',
        'VISA, Mastercard, UnionPay', '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('ebf107f0a3df5525936d6b71d17f85f6'), '신한카드 플리 체크 (산리오캐릭터즈)', '신한카드', '없음', '없음', '없음', 'Mastercard',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('d9378883555f5dc0ad8e5f8dfc348a37'), '춘식이달달체크카드', 'NH농협카드', '없음', '20만원 이상', '없음', 'Mastercard',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('fdf1f86fc2575c2e9a6554a4d2a90796'), 'NH20해봄체크카드', 'NH농협카드', '없음', '20만원 이상', '없음', 'Mastercard',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('3495423eea3c580da184435b3ebf1c58'), '카카오뱅크 프렌즈 체크카드', '카카오뱅크', '없음', '없음', '없음', 'Mastercard', '해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('15cdd581e5085b16a8bc3f0598d0c4d0'), '트래블로그 체크카드', '하나카드', '없음', '없음', '없음', 'Mastercard, UnionPay',
        '해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('aff56b9bc5a651bea147815c3840aa77'), '신한카드 On 체크 (잔망루피)', '신한카드', '없음', '20만원 이상', '없음', 'VISA', '해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('dfb06e82447f5759a3c9ddf7bbdefca7'), '카드의정석 EVERY CHECK', '우리카드', '없음', '없음', '없음', 'Mastercard',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('b2868159c3915820bc6354f1bd991589'), 'NH 무럭이 체크카드', 'NH농협카드', '없음', '없음', '없음', '', '국내전용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('92408ce9c318545ca79aec5af4b484ae'), 'K-패스카드 (체크)', 'NH농협카드', '없음', '20만원 이상', '없음', 'VISA', '해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('cc72ad75161a58779d3f1d74ac1dfa4e'), '달달 하나 체크카드', '하나카드', '없음', '없음', '없음', 'VISA, Mastercard',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('af4e5a39da4a5bb5831d6ce43f39798c'), '현대카드 M CHECK', '현대카드', '2,000원', '없음', '없음', '', '국내전용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('09d39fdd0e5150d4a238a6a04206a888'), 'PAYCO 포인트 카드', '엔에이치엔페이코', '없음', '없음', '없음', 'VISA', '해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('8cd57d15a52b5045be11d955aa044ccd'), '청춘대로 싱글 체크카드', 'KB국민카드', '없음', '30만원 이상', '없음',
        'Mastercard, UnionPay', '해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('913d1cad017a580789f099b6ed3aa498'), '탐나는전 체크카드', 'KB국민카드', '없음', '10만원 이상', '없음', '', '국내전용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('3741764e363c51b9827cba4c2c7f2ece'), 'NH 트래블리 체크카드', 'NH농협카드', '없음', '없음', '없음', 'Mastercard', '해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('c2d33c8459e655929cadd4748185aa45'), '신한카드 On 체크', '신한카드', '없음', '20만원 이상', '없음', 'VISA', '해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('93e4872aa6ac5c14bd88b47b39907cd3'), 'K-패스 삼성체크카드', '삼성카드', '없음', '30만원 이상', '없음', '', '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('6534a6acc63652a4a431a93220f50771'), 'IBK 무민카드 (체크)', 'IBK기업은행', '없음', '30만원 이상', '없음', 'BC, UnionPay',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('b7a92ee18a305f5690096dfc2bff175f'), '스타플러스 체크카드', 'KB국민카드', '없음', '없음', '없음', 'Mastercard',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('e6ce8c0691985233adbbf2c3fa5dbdac'), '신한 후불 기후동행 체크카드', '신한카드', '없음', '20만원 이상', '없음', 'Mastercard',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('a91659c466b65e8f9d0ab008bf32706f'), '신한카드 Way 체크 (쥬라기)', '신한카드', '없음', '20만원 이상', '없음', 'VISA',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('517cc5d8844c5d138a7fb4de76b02c2f'), 'K-패스 체크카드', 'KB국민카드', '없음', '20만원 이상', '없음', 'VISA', '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('00458b3a0b235d0b9f560f29eef2d554'), 'K-패스 하나 체크카드', '하나카드', '없음', '30만원 이상', '없음', 'VISA',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('04987a32cd4153ae971bc6ed4d3b7d17'), '라이프핏 체크카드', 'MG새마을금고', '없음', '20만원 이상', '없음', 'Mastercard', '해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('789fa13f46c35164b8fb2ad6fd16f71c'), '위비트래블 체크카드', '우리카드', '없음', '없음', '없음', 'Mastercard', '해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('d2fea734229456bca817e151adc0de9e'), 'KB국민 우리동네 체크카드', 'KB국민카드', '없음', '20만원 이상', '없음', 'VISA, UnionPay',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('de5094c890685a88b802fa1f27d4ba2b'), '올바른 NEW HAVE 체크카드', 'NH농협카드', '없음', '없음', '없음', 'Mastercard',
        '해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('bda1f4790206531da75f23243a941cff'), 'KB국민 기후동행 체크카드', 'KB국민카드', '없음', '없음', '없음', '', '국내전용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('3d46a2cfcc2b57988b47c7004bc9e4e4'), '카드의정석 EVERYDAY CHECK', '우리카드', '없음', '없음', '없음', 'Mastercard',
        '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('4cf97b70bb2c5b20b927a7a81bb0db1a'), '신한카드 Pick I 체크 캐릭터형 (한교동)', '신한카드', '없음', '20만원 이상', '없음',
        'Mastercard', '국내전용 / 해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('d7c4e4d4d63e5f0f9534ba95ee0920a1'), '카카오페이 트래블로그 체크카드', '하나카드', '없음', '20만원 이상', '없음', 'Mastercard',
        '해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('056549342665569f8cdaa46c2bba8c1c'), 'I-Travel (체크)', 'IBK기업은행', '없음', '없음', '없음', 'Mastercard, BC',
        '해외겸용');
INSERT INTO card_info (card_id, card_name, issuer, annual_fee, monthly_spend, issuance_fee, brand, domestic_overseas)
VALUES (UNHEX('57b91375fc0a5d20b02590f28ae576ec'), '우체국 LUCK-KEY 체크카드', '우체국', '없음', '10만원 이상', '없음', 'Mastercard',
        '국내전용 / 해외겸용');

INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('0d542e3979b8471fbde2b6c4fcde64e5'), UNHEX('fa6d774a4d8c5505b7a1bf64c0f45a24'), 1,
        'K-패스: 교통 요금 최대 53% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4edd581678f849c4bad84b51d2509a3a'), UNHEX('fa6d774a4d8c5505b7a1bf64c0f45a24'), 2, '대중교통 추가 3,000원 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('0ff9390a054c4444b2cd394e0f4d754a'), UNHEX('fa6d774a4d8c5505b7a1bf64c0f45a24'), 3, '오프라인 0.6% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('bbda5b4d7cc24a2c9010047676676b94'), UNHEX('fa6d774a4d8c5505b7a1bf64c0f45a24'), 4, '온라인 1.1% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('b4a5648fd6994928a5e5395db8e8e9ca'), UNHEX('fa6d774a4d8c5505b7a1bf64c0f45a24'), 5, '자주 쓰는 브랜드 최대 5% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('83b5f32cd64c457fa0f75f69d65896ba'), UNHEX('fa6d774a4d8c5505b7a1bf64c0f45a24'), 6,
        '3번 결제할 때마다 1,000원 캐시백 (무제한)');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('43ec810d4cd746229c307363f59ba184'), UNHEX('fa6d774a4d8c5505b7a1bf64c0f45a24'), 7,
        '전월실적 달성 시 건별 최대 2% 추가 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('fcc537a19b9941ad84360e2c57526db1'), UNHEX('e975fcc954835e20ad5447baf619b956'), 1, '스타벅스, 커피빈 10% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('7904b16265b640178d0b7c85dedcca3f'), UNHEX('e975fcc954835e20ad5447baf619b956'), 2,
        '구글플레이스토어, 앱스토어 10% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('bf77e887e75d424ea548a7be1a489374'), UNHEX('e975fcc954835e20ad5447baf619b956'), 3, '인터파크 티켓 10% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('3ac9531ee28947e99d3adb7f8f548138'), UNHEX('e975fcc954835e20ad5447baf619b956'), 4, '올리브영, 미용실 업종 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('ec89f392902146129b1a1da0e3151c0a'), UNHEX('e975fcc954835e20ad5447baf619b956'), 5, 'GS25, CU 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('8f18600df5db4ffeb6b6cd504b8253bb'), UNHEX('e975fcc954835e20ad5447baf619b956'), 6,
        '넷플릭스, 유튜브프리미엄 1,000원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4262dcb9776149eba582c022cee7fc69'), UNHEX('e975fcc954835e20ad5447baf619b956'), 7,
        '배달의민족, 요기요 1,000원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('2599b6f23d28440984a1de52b16036e2'), UNHEX('e975fcc954835e20ad5447baf619b956'), 8,
        'SKT, KT, LG U+, Liiv M 2,500원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('120c59c4f07f41519f979208c1ef06ae'), UNHEX('e975fcc954835e20ad5447baf619b956'), 9, 'CGV 4,000원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('36e7b643f458482687c6b67c2c6f4a3d'), UNHEX('e975fcc954835e20ad5447baf619b956'), 10,
        '에버랜드, 롯데월드 15,000원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('1cf775a7f95e43e4a2dbc8df663f96cd'), UNHEX('e975fcc954835e20ad5447baf619b956'), 11,
        'KB Pay 오프라인 가맹점 2% 추가 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('b7d096b50a694f9f86dea9b12eaca787'), UNHEX('e975fcc954835e20ad5447baf619b956'), 12,
        'KB Pay 온라인 가맹점 2% 추가 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('f5ffb4581f1241e09df6d233d1158fc3'), UNHEX('b510fbb931e2544594d34423f0115de8'), 1,
        '온라인 1% / 오프라인 0.5% 무제한 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('53676a517b4a48f683215c8a1980c217'), UNHEX('b510fbb931e2544594d34423f0115de8'), 2, '모빌마켓 이용 시 2% 무제한 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('644ec1988e0547d28e6e6b2b3e2bf353'), UNHEX('b510fbb931e2544594d34423f0115de8'), 3,
        'CU, GS25, 이마트24 최대 2% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('7237278368324a769d68f138918864fe'), UNHEX('b510fbb931e2544594d34423f0115de8'), 4,
        '카페/베이커리 브랜드 최대 7.5% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('45304e427c01459985acea1e5ec91f84'), UNHEX('b510fbb931e2544594d34423f0115de8'), 5,
        '대형마트/쇼핑/여가 브랜드 최대 8% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('5fa763396bea4c9a85e3fa2a5aa891cc'), UNHEX('b510fbb931e2544594d34423f0115de8'), 6, '외식 브랜드 최대 4.5% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('37cebc6c614747b39c49b689ab37341d'), UNHEX('b510fbb931e2544594d34423f0115de8'), 7, 'KFC 10% 즉시할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('279ae850ff0946a28639df183d19cb3c'), UNHEX('b510fbb931e2544594d34423f0115de8'), 8,
        'KG모바일 알뜰폰 결합 시 4.5% 혜택');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('5517447596c44469ac63bb9550c479ad'), UNHEX('b510fbb931e2544594d34423f0115de8'), 9, '다양한 충전수단, 30% 소득공제');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('e87fded5865b46eaaca9b31ea9d861dc'), UNHEX('b510fbb931e2544594d34423f0115de8'), 10,
        '휴대폰결제로 충전 후 최초 결제 시 2,000P 즉시 지급 + 매월 신규 이벤트 진행 중');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4931a493906e4d498bb2f30c37364f47'), UNHEX('b510fbb931e2544594d34423f0115de8'), 11,
        '‘휴대폰결제(소액결제)’ 로 충전해서 비상금 만들기');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4fbe41d358b642c19be9232ef4808f9a'), UNHEX('b510fbb931e2544594d34423f0115de8'), 12,
        '페이북 및 간편결제 가능, 마이태그 캐시백 혜택 적용');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('1bd39a94a71d4b45963c50fdebb4fc0d'), UNHEX('5abc519c90a552aaa6fdb36634197e11'), 1,
        '해외 가맹점, ATM 이용 수수료 면제');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('538fd82a1c234133a3e20f62b6c0b978'), UNHEX('5abc519c90a552aaa6fdb36634197e11'), 2, 'KB Pay 200원 추가 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('f10a46dcd1c141fb8bcb8adbed5ed84e'), UNHEX('5abc519c90a552aaa6fdb36634197e11'), 3, '카페 1,000원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4c680eb9063845739b8d1432be04fa70'), UNHEX('5abc519c90a552aaa6fdb36634197e11'), 4, '빵집 2,000원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('2ca069c184b94284af0e90e88eee0dd8'), UNHEX('5abc519c90a552aaa6fdb36634197e11'), 5, '철도 5,000원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4ef13f86c62a4c8aab77b9c14f26e709'), UNHEX('5abc519c90a552aaa6fdb36634197e11'), 6, '고속버스 2,000원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('65be36340d4a49eca52a2505d056a464'), UNHEX('5abc519c90a552aaa6fdb36634197e11'), 7, '주차장 500원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('0cc542d313954a57b907682d23cb89ed'), UNHEX('5abc519c90a552aaa6fdb36634197e11'), 8, '전국맛집 5,000원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('957078d319314465b3cee4d9a71b7b7a'), UNHEX('4a1bda5ccd845617b2a0d0d82ae98d31'), 1, '해외 온/오프라인 3% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('80c6f4207c5245ea8f588d6ba9b386b0'), UNHEX('4a1bda5ccd845617b2a0d0d82ae98d31'), 2,
        '네이버 쇼핑 간편결제 최대 1.5% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('295c920c424d40a9beb70694d5c0dd7a'), UNHEX('4a1bda5ccd845617b2a0d0d82ae98d31'), 3, '국내 온/오프라인 0.3% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('1457a738085b44d7ae78f24b47765a3a'), UNHEX('4a1bda5ccd845617b2a0d0d82ae98d31'), 4, 'N트래블클럽 업그레이드');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('e1182d3f66a9416cbff94e20ccd4029e'), UNHEX('4a1bda5ccd845617b2a0d0d82ae98d31'), 5,
        '플러스 멤버십 스튜던트 정기결제 10% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('e31595fb0ec446fc98aa419df2f3047f'), UNHEX('589ad3e5cf00578fb443dfbbfac076c0'), 1,
        '네이버페이, 카카오페이, 페이코 결제 시 20% 할인 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('ede61c5f3ab04a51aeec6dc38952434f'), UNHEX('589ad3e5cf00578fb443dfbbfac076c0'), 2,
        '쿠팡, 무신사, 지그재그, W컨셉, 에이블리 결제 시 20% 할인 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('eaf77235b2b046fa8978cf5ba4c6fea6'), UNHEX('589ad3e5cf00578fb443dfbbfac076c0'), 3,
        '스타벅스, 투썸플레이스, 커피빈, 메가커피, 빽다방, 컴포즈커피 결제 시 20% 할인 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('25254308cf624eeca3f79a4c037bc024'), UNHEX('589ad3e5cf00578fb443dfbbfac076c0'), 4,
        '해외 서비스수수료, 현금인출수수료, 예금잔액조회수수료 면제');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('502107d7bf704ebab962c84a142cc174'), UNHEX('0b2ffd12da4b500092d424bdee2e715e'), 1,
        'KB Pay 오프라인 결제 2% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('b7e5a9cb28b8462bbf7a9637936808df'), UNHEX('0b2ffd12da4b500092d424bdee2e715e'), 2, 'CU, 세븐일레븐 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('0445e9e6ead048a58cf0387c7139945d'), UNHEX('0b2ffd12da4b500092d424bdee2e715e'), 3,
        '다이소, 올리브영, KB Pay 쇼핑 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('e6cc3670b19a45cda8df47dab5963509'), UNHEX('0b2ffd12da4b500092d424bdee2e715e'), 4, '독서실 업종 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4395741eef924c0c967a21b199fc24f2'), UNHEX('0b2ffd12da4b500092d424bdee2e715e'), 5, '서점 업종, 문구점 업종 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('27b1e0d3db314ae78cc398b97e7d2f37'), UNHEX('0b2ffd12da4b500092d424bdee2e715e'), 6, 'PC방 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('2990ee99900646988eb6904b5f42fb53'), UNHEX('0b2ffd12da4b500092d424bdee2e715e'), 7,
        '구글 플레이스토어, 애플 앱스토어 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('ef5671f34a524dea868ce85ad1af8688'), UNHEX('0b2ffd12da4b500092d424bdee2e715e'), 8, '패밀리레스토랑 업종 10% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('c6d73917023e45a7aa2d989db629c4fe'), UNHEX('28e0b8d44d7657be8478f7fba4f08779'), 1,
        '일상 속 7가지 영역 월 최대 35,000원 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('a080ae4059794b92a4d97345f403305c'), UNHEX('28e0b8d44d7657be8478f7fba4f08779'), 2,
        '온라인 결제 7가지 영역 월 최대 14,000원 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('0ae2e17e424443c98574abd7a3051453'), UNHEX('28e0b8d44d7657be8478f7fba4f08779'), 3,
        '국내 온·오프라인 어디서나 0.3% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('d8ec1c978bbe47489a1b1456c0f43966'), UNHEX('28e0b8d44d7657be8478f7fba4f08779'), 4,
        '해외 결제 수수료 및 ATM 인출 수수료 면제');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('63785db07b3b418e9d14091bedfec69b'), UNHEX('28e0b8d44d7657be8478f7fba4f08779'), 5,
        '토스뱅크 체크카드 스위치 캐시백 시즌 5 : 오프라인 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4147846951fb44d5a6e9dd547d7489f8'), UNHEX('28e0b8d44d7657be8478f7fba4f08779'), 6,
        '토스뱅크 체크카드 스위치 캐시백 시즌 5 : 온라인 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('42c8e5315c2949d9952e448915709ba7'), UNHEX('28e0b8d44d7657be8478f7fba4f08779'), 7,
        '토스뱅크 체크카드 스위치 캐시백 시즌 5 : 어디서나 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('858d6aae993844c2b8deed14ca4268f0'), UNHEX('28e0b8d44d7657be8478f7fba4f08779'), 8,
        '토스뱅크 체크카드 스위치 캐시백 시즌 5 : 기부 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('10219d8a078a4abbb89286d140ca4d57'), UNHEX('410db53ffe785cabbeb25876a78a5d43'), 1,
        '해외 이용금액 현지 통화 결제 서비스');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('82c570f2e4974f278da70418999a183d'), UNHEX('410db53ffe785cabbeb25876a78a5d43'), 2,
        '국제 브랜드 수수료(1%) / 해외 서비스 수수료(0.2%) 면제');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('0c2d4b3c507f4930930b8b87eb6a6c61'), UNHEX('410db53ffe785cabbeb25876a78a5d43'), 3, '더라운지 공항라운지 본인 무료 입장');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('e3855825ffad46ae829fa2fe7a4e18bf'), UNHEX('410db53ffe785cabbeb25876a78a5d43'), 4,
        '해외 대중교통 컨택리스 방식 이용 시 1% 결제일 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('18b4a4cf02e044aba13eaa4c1aef860c'), UNHEX('410db53ffe785cabbeb25876a78a5d43'), 5, '국내 4대 편의점 5% 결제일 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('793096be6e634576aa616cfb43987b4c'), UNHEX('410db53ffe785cabbeb25876a78a5d43'), 6, '국내 대중교통 1% 결제일 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('91785b9ec99847cbad5bfc0624a51d3c'), UNHEX('410db53ffe785cabbeb25876a78a5d43'), 7, '해외이용 프로모션');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('6a86428e363e440aba4935df1a44e223'), UNHEX('1aaf29210b935991a7ee6bf388fbce6e'), 1, '네이버페이 포인트 1.2% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('a5f0a54fc0cc4c23a26969134074f3a0'), UNHEX('1aaf29210b935991a7ee6bf388fbce6e'), 2, '네이버페이 포인트 적립 서비스');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('b9ae2344a2b4498c9def9312988758b4'), UNHEX('1aaf29210b935991a7ee6bf388fbce6e'), 3, '플레이트 디자인 선택 가능');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('a2c7c645d8b54c789902f673b217e77b'), UNHEX('2ce809e4db045209b6a0c64329b83f14'), 1, '플레이트 디자인 선택 가능');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4659bc9dac02461aa12b4a73dc6b719e'), UNHEX('2ce809e4db045209b6a0c64329b83f14'), 2, '카카오페이 결제 시 2% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('74280676f283468fb8a2068ac2eb1fd7'), UNHEX('2ce809e4db045209b6a0c64329b83f14'), 3, '대중교통 3% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('2d3cd7c712b44f9db002304fae272f02'), UNHEX('2ce809e4db045209b6a0c64329b83f14'), 4, '이동통신요금 3% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('60be7d03582e4bd38043709fbe6ea7ec'), UNHEX('2ce809e4db045209b6a0c64329b83f14'), 5, 'CGV 영화 최대 3천원 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('894de36b9b1b4cc090f3b80a221902e9'), UNHEX('2ce809e4db045209b6a0c64329b83f14'), 6, '해외 전가맹점 이용금액 1% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('45f9715185c54cae9c61fca1500a5c06'), UNHEX('2ce809e4db045209b6a0c64329b83f14'), 7,
        '해외 인출 1건당 US $3 적립 제공');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('2680537efd314925bbc8256943f1134f'), UNHEX('2ce809e4db045209b6a0c64329b83f14'), 8, 'Master 플래티늄 서비스');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('e3e3ae01ec4942928e0f8935f5b1e98f'), UNHEX('e6018be576fd56039801ebf07d68323b'), 1, '모두드림 0.2% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('a9240d036cec4ef0890bffce58a5b487'), UNHEX('e6018be576fd56039801ebf07d68323b'), 2, '더해드림 0.6% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('d632f327a9804ae89ef95131e5808654'), UNHEX('e6018be576fd56039801ebf07d68323b'), 3, '챙겨드림 1.0% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('59f3930c49c34dfebf4d3dc6a2512a2f'), UNHEX('e6018be576fd56039801ebf07d68323b'), 4, '기본 포인트 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('ed370a4845f54aa88eeceb26626e2afd'), UNHEX('e6018be576fd56039801ebf07d68323b'), 5, '생활 영역 추가 포인트 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('06e9b02ccc064ba5af3cdc71b43ff9e8'), UNHEX('e6018be576fd56039801ebf07d68323b'), 6, '주유소 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('1ce5278c85434bfbb83e6b8956c5a4d2'), UNHEX('e6018be576fd56039801ebf07d68323b'), 7, '택시 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('f661c36741f44570ac054f9c394e0d7e'), UNHEX('e6018be576fd56039801ebf07d68323b'), 8, '금융 수수료 우대');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('d46e5ecc293a417d94abba57f087bcd3'), UNHEX('edd5d1b6f94b5ed79cfa767495a8b5f5'), 1, '버스·지하철 2~4천원 청구할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('6f1e4cc11409449e83eebd1fa692647d'), UNHEX('edd5d1b6f94b5ed79cfa767495a8b5f5'), 2, 'CU편의점 2~4천원 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('5970ef14c62f4f6ab125cbadc7dba9f0'), UNHEX('edd5d1b6f94b5ed79cfa767495a8b5f5'), 3, '스타벅스 2~4천원 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4b09847438ce4402a448f5a62dccb629'), UNHEX('edd5d1b6f94b5ed79cfa767495a8b5f5'), 4, 'CGV 2~4천원 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('bd6c145bf07a43f1ab91af6b8854bcec'), UNHEX('edd5d1b6f94b5ed79cfa767495a8b5f5'), 5, '텐바이텐 2~4천원 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('61e362e3ba6c4c3fa5eae3e7d2668e00'), UNHEX('edd5d1b6f94b5ed79cfa767495a8b5f5'), 6,
        '네이버페이·카카오페이·SSG페이 온라인 결제 2~4천원 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('d16ed056676342699f84c22067a46b1f'), UNHEX('edd5d1b6f94b5ed79cfa767495a8b5f5'), 7,
        '올리브영, 안경점 2~4천원 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('6876191a7d6444f4a44a5c0cc4e660e2'), UNHEX('edd5d1b6f94b5ed79cfa767495a8b5f5'), 8,
        'YES24, 교보문고 온라인 결제 2~4천원 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4a19da98d0ac4a45959c27c5eb3484af'), UNHEX('edd5d1b6f94b5ed79cfa767495a8b5f5'), 9,
        '인터파크티켓 온라인 결제 2~4천원 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('7c6d7b36910047d7a51e3d9b59ccf6ce'), UNHEX('79b45044a5545fd1909e15fecccd8285'), 1, '스타벅스, 커피빈 10% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('ab88b2ef4c2042fc9a97515230c873b6'), UNHEX('79b45044a5545fd1909e15fecccd8285'), 2,
        '구글플레이스토어, 앱스토어 10% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4c8d906b1c104f59b07f39413922de1b'), UNHEX('79b45044a5545fd1909e15fecccd8285'), 3, '인터파크 티켓 10% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('52fb9587393d40109c9faab25fc9dfc3'), UNHEX('79b45044a5545fd1909e15fecccd8285'), 4, '올리브영, 미용실 업종 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('67cc424b3ddf4579a0ede85e48ccfec0'), UNHEX('79b45044a5545fd1909e15fecccd8285'), 5, 'GS25, CU 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('e8cdf3d54fc84ccfabd7180974cd4ae7'), UNHEX('79b45044a5545fd1909e15fecccd8285'), 6,
        '넷플릭스, 유튜브프리미엄 1,000원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('549c263b64eb49fead0c874b546a4f7a'), UNHEX('79b45044a5545fd1909e15fecccd8285'), 7,
        '배달의민족, 요기요 1,000원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('8a628a90dfe7410aa62097cc2677d518'), UNHEX('79b45044a5545fd1909e15fecccd8285'), 8,
        'SKT, KT, LG U+, Liiv M 2,500원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('04d6bd7717d7403faf814013250d1ba2'), UNHEX('79b45044a5545fd1909e15fecccd8285'), 9, 'CGV 4,000원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('24f9658fa6cd428cb14c7ff798c890a4'), UNHEX('79b45044a5545fd1909e15fecccd8285'), 10,
        '에버랜드, 롯데월드 15,000원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4408f1d7887048748e5114e038ca5850'), UNHEX('79b45044a5545fd1909e15fecccd8285'), 11, '해외 가맹점 2% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('7e41153637fb4261a75d7ecf276992d4'), UNHEX('79b45044a5545fd1909e15fecccd8285'), 12,
        '공항라운지 더라운지멤버스 연 1회 이용권');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('1a373e45c04e4330a23ec76a8e7a01cc'), UNHEX('c6e2e19ea591556b8b116c6374fa08a3'), 1, '국세·지방세 7천원 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('aea250efc2394ab5835f713702be06c5'), UNHEX('c6e2e19ea591556b8b116c6374fa08a3'), 2,
        'GS칼텍스 주유 리터당 주중 50원, 주말 60원 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('7230cd17f9ab45a082ee1e62d00bae50'), UNHEX('c6e2e19ea591556b8b116c6374fa08a3'), 3,
        '스피드메이트 엔진오일교환 2만원 현장할인 및 정비 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('54d53fc368e0460fbc0db8e94e0eed2f'), UNHEX('c6e2e19ea591556b8b116c6374fa08a3'), 4, 'SK렌터카 할인 (연 2회)');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('a240e5ebc4634a609736fe93784bae2c'), UNHEX('c6e2e19ea591556b8b116c6374fa08a3'), 5,
        '롯데·현대·신세계백화점 5% 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('c93a8dd8ea6b4e5497c080432648706e'), UNHEX('c6e2e19ea591556b8b116c6374fa08a3'), 6, '아웃백 10% 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4f07ce91f94e4dc1bcc75065df58ef45'), UNHEX('c6e2e19ea591556b8b116c6374fa08a3'), 7, '버스·지하철 5% 청구할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('ee20cf7733814c28b0ab2ec5fbc47ba0'), UNHEX('c6e2e19ea591556b8b116c6374fa08a3'), 8,
        '이동통신요금 1,000원 환급할인 (월 1회)');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('a936526235d44cbba1437101fa63a018'), UNHEX('c6e2e19ea591556b8b116c6374fa08a3'), 9, '에버랜드 50% 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('75ac49dc41a94a11b6eb16f9b482fdb9'), UNHEX('c6e2e19ea591556b8b116c6374fa08a3'), 10, '해피포인트 5% 현장적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('e33e1dca79754379bb63038e2c35fa50'), UNHEX('3b8d949e72e15b449f5ce2d0e15efb88'), 1, '국내 전 가맹점 0.3% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('6cbef29c91c34a8fad07ec5b5b66eec9'), UNHEX('3b8d949e72e15b449f5ce2d0e15efb88'), 2, 'OTT 30% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('ae6e4d37c9c847379bd9b2f307263271'), UNHEX('3b8d949e72e15b449f5ce2d0e15efb88'), 3, '패션 30% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('5d1cbc5835c04cbca6c009421e95cd0a'), UNHEX('3b8d949e72e15b449f5ce2d0e15efb88'), 4, '멤버십 30% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('e676442fff0f4294bd26e118b4f92808'), UNHEX('ea77944d8a0152739a12f5d506483e32'), 1, '플레이트 디자인 선택 가능');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('c014179509144a88b1615ca4b01b91ff'), UNHEX('ea77944d8a0152739a12f5d506483e32'), 2, '대중교통 이용금액 5% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('ad4fb6e4d908458c9cc6bd67402b4d50'), UNHEX('ea77944d8a0152739a12f5d506483e32'), 3,
        '이동통신요금 자동납부 시 2천원 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('a998d7f18cb544e6a891ca9e30ce69b3'), UNHEX('ea77944d8a0152739a12f5d506483e32'), 4, 'CGV 영화 예매 5천원 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('ac7b7cf7553845f0b54a3d07cc90231e'), UNHEX('ea77944d8a0152739a12f5d506483e32'), 5, '편의점 1천원 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('88b2d4a621434d55b0a8c4b30d656079'), UNHEX('ea77944d8a0152739a12f5d506483e32'), 6, '카페 1천원 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('a9a88cae7e5d481184b341d5a1015a41'), UNHEX('ea77944d8a0152739a12f5d506483e32'), 7, '패스트푸드 1천원 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('e424c9ff642f423b8ecc5a86a67e8f0b'), UNHEX('ea77944d8a0152739a12f5d506483e32'), 8, '배달앱 1천원 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('63c19b3392b546a9b3da1b78e60af004'), UNHEX('ea77944d8a0152739a12f5d506483e32'), 9, '생활 가맹점 1천원 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('93823015d9ea4156ad8f52b4691492e6'), UNHEX('ea77944d8a0152739a12f5d506483e32'), 10, 'OTT 1천원 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('b0d01bd8467447dfbd87b12c68de58d5'), UNHEX('ea77944d8a0152739a12f5d506483e32'), 11, '온라인 쇼핑 1천원 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('023ff65b64cc482fbc1c65c98c4a0c70'), UNHEX('ea77944d8a0152739a12f5d506483e32'), 12,
        '간편결제(Pay) 이용 시 1% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('bad357a9b5864dabb13bd495f25345c9'), UNHEX('ea77944d8a0152739a12f5d506483e32'), 13,
        '해외 전 가맹점(온라인 포함) 1.2% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('96b51571ee9145c89439b9508d1bf3f7'), UNHEX('ea77944d8a0152739a12f5d506483e32'), 14,
        '해외 인출 1건 당 US $3 캐시백 제공');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('3a8caaca4f464f6ea85c4113b1408bea'), UNHEX('40c18cc4a26c578395b6949b56658f33'), 1, '온라인 쇼핑 5% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('e492dc7af56b425aa9a7136bd64881dd'), UNHEX('40c18cc4a26c578395b6949b56658f33'), 2, '간편결제 5% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('529a90bbc58b4f58b09be6a652c9df59'), UNHEX('40c18cc4a26c578395b6949b56658f33'), 3, '안경/렌즈 5% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('bd001ae790f6404fb9359190540adb5c'), UNHEX('40c18cc4a26c578395b6949b56658f33'), 4, '커피 5% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('566d8fe4de2144319611cb6c387e2061'), UNHEX('40c18cc4a26c578395b6949b56658f33'), 5, '배달/주문 5% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('810b85843fd9478ca065c5110739fdcd'), UNHEX('40c18cc4a26c578395b6949b56658f33'), 6, '대중교통 5% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('9c074f09b43341808ac67f83b8d24ece'), UNHEX('40c18cc4a26c578395b6949b56658f33'), 7, '이동통신 5% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('2a91696aa5fd4056bf7f1eb23270291c'), UNHEX('40c18cc4a26c578395b6949b56658f33'), 8, '해외 5% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('dc0b739902be432eb44c2cf260afcbce'), UNHEX('40c18cc4a26c578395b6949b56658f33'), 9, '어학시험 5% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('366284bdc3fa4216a16653b8c789ba28'), UNHEX('40c18cc4a26c578395b6949b56658f33'), 10, 'OTT 5% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('de82f082c4534a94981364c469049592'), UNHEX('40c18cc4a26c578395b6949b56658f33'), 11, '공연티켓 5% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('1628b239cd814f2c9099c75cb260dc03'), UNHEX('a07cb772d5e15c77a4fb4e56d535d5d5'), 1, '버스·지하철 10% 청구할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('5bf02edd70164c19aaaf5d59a2274966'), UNHEX('a07cb772d5e15c77a4fb4e56d535d5d5'), 2, '이동통신요금 2,500원 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('a423497a0655467ab4919d5f9e0951db'), UNHEX('a07cb772d5e15c77a4fb4e56d535d5d5'), 3, 'CGV 35% 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('95627208cb9640e2bd494deb4b78ce4a'), UNHEX('a07cb772d5e15c77a4fb4e56d535d5d5'), 4,
        '아웃백, VIPS / 스타벅스 20% 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('dc4d8c3ab574456eb9adab19c418b446'), UNHEX('a07cb772d5e15c77a4fb4e56d535d5d5'), 5, '에버랜드·롯데월드 50% 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('ce1a6b0180e0493f93dce1790809773a'), UNHEX('a07cb772d5e15c77a4fb4e56d535d5d5'), 6, '금융수수료 면제 서비스');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('358f72407d6148068f86302cba800a6c'), UNHEX('a07cb772d5e15c77a4fb4e56d535d5d5'), 7, 'GS25 5% 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('1ef5f09ea5ad4ec7b19ba036e61f8b6f'), UNHEX('a07cb772d5e15c77a4fb4e56d535d5d5'), 8, '교보문고 5% 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('491faf3eec3543adb1e5e4d0b2afc4a2'), UNHEX('ebf107f0a3df5525936d6b71d17f85f6'), 1, '국내 이용금액 최대 0.3% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('63e9696ba0154a47b7eec29c5687180e'), UNHEX('ebf107f0a3df5525936d6b71d17f85f6'), 2, '해외 이용금액 0.2% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('ffed2d5555d74166adb3304a96e211dc'), UNHEX('ebf107f0a3df5525936d6b71d17f85f6'), 3,
        '매월 2회 국내 이용 할인 쿠폰 제공');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('7afa634a28a44bbf96aaff71831bb325'), UNHEX('ebf107f0a3df5525936d6b71d17f85f6'), 4,
        'My Pick 가맹점 월 3, 6, 9번째 이용 건에 대해 마이신한포인트 1,000포인트 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('762d938b527943079d6a36f5f6148987'), UNHEX('ebf107f0a3df5525936d6b71d17f85f6'), 5, '카드 플레이트 선택 가능');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('72cf3dc959d84d558693aa44a1abcd05'), UNHEX('d9378883555f5dc0ad8e5f8dfc348a37'), 1, '월~금 0.5% NH포인트 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('71c0bba76c6644919a6cb76c192735a4'), UNHEX('d9378883555f5dc0ad8e5f8dfc348a37'), 2, '토,일 1% NH포인트 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('98e6e86016424c96a0f8083cf5f65e88'), UNHEX('d9378883555f5dc0ad8e5f8dfc348a37'), 3,
        '요일 관계없이 1.5% NH포인트 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('7d7c895a7efa4c4bb325cf692c61ad4d'), UNHEX('d9378883555f5dc0ad8e5f8dfc348a37'), 4,
        '유튜브, 넷플릭스, 유료 어플리케이션 결제 5% NH포인트 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('1f5096ec36cd4b949b197a3e30de6d64'), UNHEX('d9378883555f5dc0ad8e5f8dfc348a37'), 5, '국제공항 라운지 무료이용 서비스');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('fdea5cd8e0ed4a53a6a1acf979351c3c'), UNHEX('fdf1f86fc2575c2e9a6554a4d2a90796'), 1, '온라인쇼핑몰 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('06782628a7694a7fbb5ea22ff4d29e15'), UNHEX('fdf1f86fc2575c2e9a6554a4d2a90796'), 2, '배달앱 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('456a5e054e574a479402d9b612ca78db'), UNHEX('fdf1f86fc2575c2e9a6554a4d2a90796'), 3, '커피 20% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('da3ba1b9e11d46f18edf663ca7eba4ec'), UNHEX('fdf1f86fc2575c2e9a6554a4d2a90796'), 4,
        '해봄 선택 서비스(여행해봄/놀이해봄) 택1');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('faeec093afde4d839a9b6d84fbb7bd46'), UNHEX('fdf1f86fc2575c2e9a6554a4d2a90796'), 5, 'GS리테일 POP 서비스');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('19bad3aca48d412bb2d8513d11b9e29a'), UNHEX('fdf1f86fc2575c2e9a6554a4d2a90796'), 6, '주요서비스 통합 월 할인한도 적용');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('728965c07c2b4430bae808d8471badff'), UNHEX('3495423eea3c580da184435b3ebf1c58'), 1,
        '국내외 가맹점 조건 없이 캐시백 (평일 0.2%, 주말/공휴일 0.4%)');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('e08bf2267be84f578eafd8539e060fc0'), UNHEX('3495423eea3c580da184435b3ebf1c58'), 2, '학원 업종 1만원 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('474821ef62124f70bb4a62022a07964a'), UNHEX('3495423eea3c580da184435b3ebf1c58'), 3, '배달의민족 1천원 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('6f40f6f7a1ed454199c0610333b77820'), UNHEX('3495423eea3c580da184435b3ebf1c58'), 4,
        '카카오뱅크 프렌즈 체크카드 캐시백 프로모션 2025');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('092b9373252748f8a01291b45ef6647e'), UNHEX('3495423eea3c580da184435b3ebf1c58'), 5, '부릉부릉 K-패스 혜택');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('55249eab97a347ccb742af5f44e73dae'), UNHEX('3495423eea3c580da184435b3ebf1c58'), 6, '카드 플레이트 디자인 선택 가능');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('8d6667a1f5f74804969b374461ff7205'), UNHEX('15cdd581e5085b16a8bc3f0598d0c4d0'), 1, '해외 가맹점 이용 수수료 면제');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('680f741fefb04ea0b58789555a806c9b'), UNHEX('15cdd581e5085b16a8bc3f0598d0c4d0'), 2, '해외 ATM 인출 수수료 면제');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4530f3f3d2aa4b19910b94741e54865c'), UNHEX('15cdd581e5085b16a8bc3f0598d0c4d0'), 3, '국내 가맹점 이용금액 0.3% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4163046b440a4ed29b50053dfc3041ca'), UNHEX('15cdd581e5085b16a8bc3f0598d0c4d0'), 4, '카드 플레이트 3종 선택 가능');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('8e4430b700174cd3bfdec417cecc943b'), UNHEX('aff56b9bc5a651bea147815c3840aa77'), 1,
        '간편결제(Pay) 이용 시 최대 2% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('bfeff00e65144eab98fd61c16121d9b3'), UNHEX('aff56b9bc5a651bea147815c3840aa77'), 2,
        '생활편의영역 이용 시 최대 2% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('2f6aade4e3464746861bd4d66174020f'), UNHEX('aff56b9bc5a651bea147815c3840aa77'), 3, '해외 이용금액 1.3% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('387749fc1e024e08a502f11175366d44'), UNHEX('aff56b9bc5a651bea147815c3840aa77'), 4, '카드 플레이트 선택 가능');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('a183710e9ad74689aa3bba8177daa6a4'), UNHEX('dfb06e82447f5759a3c9ddf7bbdefca7'), 1,
        '국내외 가맹점 이용금액 0.2% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('5ab37c26655841108954e98b2bb4eb61'), UNHEX('dfb06e82447f5759a3c9ddf7bbdefca7'), 2,
        '전월실적에 따라 최대 3천원 추가 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('73dcb96e51094ce991bc878ec9cb6817'), UNHEX('dfb06e82447f5759a3c9ddf7bbdefca7'), 3,
        '공연·테마파크·영화·여행 중 한 곳 1만원 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('9233e403b7d74d54850f89ad88043953'), UNHEX('dfb06e82447f5759a3c9ddf7bbdefca7'), 4, '카드 플레이트 3종 선택 가능');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('2343b23753d44f5e89f99fc890e22d04'), UNHEX('b2868159c3915820bc6354f1bd991589'), 1,
        '국내/외 이용가맹점 0.2% NH포인트 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('b546534cc993431187a246bcb0cc5370'), UNHEX('b2868159c3915820bc6354f1bd991589'), 2,
        '6개 영역 중 이용금액 1위/2위 영역 기본적립의 3배/2배 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('950ca8ec93524a6399f90885c5375564'), UNHEX('b2868159c3915820bc6354f1bd991589'), 3, '국제공항 라운지 무료이용');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('ed437d816d9e41bfb5f25c328fb3fec9'), UNHEX('92408ce9c318545ca79aec5af4b484ae'), 1, '버스/지하철 10% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('c37f99f5bded407a91a7881efbd37547'), UNHEX('92408ce9c318545ca79aec5af4b484ae'), 2,
        '렌터카/카쉐어링/전기차 충전 5% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('6cf972706f7c44478d4a06e80c58438c'), UNHEX('92408ce9c318545ca79aec5af4b484ae'), 3,
        '이동통신요금/커피전문점/편의점 5% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4fa5265c461b41e8ad3a3b68e44063ae'), UNHEX('cc72ad75161a58779d3f1d74ac1dfa4e'), 1, '간편결제 0.3% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('be103a1ea1e44d7797f53da824ec68c0'), UNHEX('cc72ad75161a58779d3f1d74ac1dfa4e'), 2, '쇼핑 5% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('aa3c2a1b3d1644f4bb69a14a55ab8080'), UNHEX('cc72ad75161a58779d3f1d74ac1dfa4e'), 3, '구독 10% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('e0da7290a98248e1ba91fd74345c47e0'), UNHEX('cc72ad75161a58779d3f1d74ac1dfa4e'), 4, '하나머니 적립 서비스');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('3596133962574551be3f1b6e01b97e75'), UNHEX('af4e5a39da4a5bb5831d6ce43f39798c'), 1, '업종·이용금액별 기본 M포인트 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('dc6e2c6c5d4844d28edf47bef3be2dd5'), UNHEX('af4e5a39da4a5bb5831d6ce43f39798c'), 2, '추가 M포인트 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('376d003069bc4c0880a8eb3d5ae8092a'), UNHEX('09d39fdd0e5150d4a238a6a04206a888'), 1,
        '온라인 1% · 오프라인 최대 1% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4fd31da9d4e148789fa0dec76136992d'), UNHEX('09d39fdd0e5150d4a238a6a04206a888'), 2,
        '매월 바뀌는 브랜드 건당 최대 20% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('041b8b4251ae4030ab1f7d82b1665f3e'), UNHEX('09d39fdd0e5150d4a238a6a04206a888'), 3,
        '매월 바뀌는 브랜드 건당 최대 35% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('e76be8a4c93146b8ab3112edd01e7316'), UNHEX('09d39fdd0e5150d4a238a6a04206a888'), 4, '해외결제, 포인트결제 소득공제');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('6c2e49ac70c64274a70851a201d5bd79'), UNHEX('09d39fdd0e5150d4a238a6a04206a888'), 5, 'ATM 출금 월 2회 무료');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('b39ec86ed558454aa83a37756b94746d'), UNHEX('09d39fdd0e5150d4a238a6a04206a888'), 6, '교통카드 기능');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('e4cc5d055df14f06a6757dc2a02649dc'), UNHEX('8cd57d15a52b5045be11d955aa044ccd'), 1, '편의점 업종 5~10% 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('a3687de5a93f4e42b65dc706e3bb9249'), UNHEX('8cd57d15a52b5045be11d955aa044ccd'), 2,
        '다이소/소셜커머스 5~10% 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('5b6db0f1f1fc4c48afab25e9139879f6'), UNHEX('8cd57d15a52b5045be11d955aa044ccd'), 3, '대중교통, 택시 5% 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('96c12104145a4a5f8a25d098878bfe0a'), UNHEX('8cd57d15a52b5045be11d955aa044ccd'), 4, '동물병원 10% 환급할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('6f282cbb39aa49dfaad1e42dd1eb94c9'), UNHEX('8cd57d15a52b5045be11d955aa044ccd'), 5, '해외이용/해외직구 할인 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('a0c218c607a54a18ae28633faa9bbc48'), UNHEX('8cd57d15a52b5045be11d955aa044ccd'), 6,
        '라이프샵 여행 해외패키지 3% 현장할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('6a99baf241544ffeaf4a17c558220522'), UNHEX('913d1cad017a580789f099b6ed3aa498'), 1,
        '국내외 가맹점 0.2% 기본 포인트리 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('488f0c76006e4fc7abd756bfde86856c'), UNHEX('913d1cad017a580789f099b6ed3aa498'), 2,
        '음식점, 커피전문점 0.2% 추가 포인트리 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('99c18736889d4c63ba078054eda11b29'), UNHEX('913d1cad017a580789f099b6ed3aa498'), 3,
        '대중교통(버스·지하철), 택시 0.2% 추가 포인트리 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('2d84b16a926043c68b0dcf0a93db63a5'), UNHEX('913d1cad017a580789f099b6ed3aa498'), 4,
        '이동통신요금 0.2% 추가 포인트리 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('694845838bef4a0abf9326cfdebef190'), UNHEX('3741764e363c51b9827cba4c2c7f2ece'), 1, '국내 가맹점 0.2~0.3% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('7579357513644caba5f50d10da102aef'), UNHEX('3741764e363c51b9827cba4c2c7f2ece'), 2, '일상 가맹점 0.6% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('45fe416f50b94cdbbd446452f12c177f'), UNHEX('3741764e363c51b9827cba4c2c7f2ece'), 3, '외화 결제/인출 서비스');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('a2a3f7a590404688b5a3cdea96a2a5b8'), UNHEX('3741764e363c51b9827cba4c2c7f2ece'), 4, '자동충전 서비스');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4f2d4affe60c41789ed1698b42c2768f'), UNHEX('3741764e363c51b9827cba4c2c7f2ece'), 5, '해외 이용 수수료 면제');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('a4e9391b92e644db9adcda2eecf661af'), UNHEX('3741764e363c51b9827cba4c2c7f2ece'), 6, '전 세계 공항라운지 본인 무료 입장');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('d79b069bbbed47b79dea3bd9f18394d3'), UNHEX('c2d33c8459e655929cadd4748185aa45'), 1,
        '간편결제(Pay) 이용 시 최대 2% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('24a40d2a54a041b0aee23efe67fc30bc'), UNHEX('c2d33c8459e655929cadd4748185aa45'), 2,
        '생활편의영역 이용 시 최대 2% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('af337108592f4ecfa144c83f9ef40411'), UNHEX('c2d33c8459e655929cadd4748185aa45'), 3, '해외 이용금액 1.3% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('73eba22541f248e4bf1638a09c39409f'), UNHEX('c2d33c8459e655929cadd4748185aa45'), 4, '카드 플레이트 선택 가능');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('ad6f4b83ed4a432594f6b74f72719f77'), UNHEX('93e4872aa6ac5c14bd88b47b39907cd3'), 1, '대중교통 10% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('eeb6191e94d545609e6c8ba60bb1fe39'), UNHEX('93e4872aa6ac5c14bd88b47b39907cd3'), 2, '이동통신 10% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('3de9a25bf520437e81096e2b8a08cd63'), UNHEX('93e4872aa6ac5c14bd88b47b39907cd3'), 3,
        '편의점/커피전문점/제과 1,000원 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('d235a3993fdc404e9a743ddac2589bf7'), UNHEX('93e4872aa6ac5c14bd88b47b39907cd3'), 4, 'CGV 3,000원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('a04b54dd032c475a86a1647b313735a9'), UNHEX('93e4872aa6ac5c14bd88b47b39907cd3'), 5, 'K-패스 마일리지 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('59d6bf9aeb1a4e7cac0f0b8f9f9568bf'), UNHEX('6534a6acc63652a4a431a93220f50771'), 1, '대중교통 건당 100원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4d31d5fbd79f4b5ba20027aaa63fb2c7'), UNHEX('6534a6acc63652a4a431a93220f50771'), 2, '온라인 쇼핑 10% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('0d9880022c4349689dfd2f4e2046bcef'), UNHEX('6534a6acc63652a4a431a93220f50771'), 3, '커피전문점 10% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('c352c39f96f046a9af72164d4af49674'), UNHEX('b7a92ee18a305f5690096dfc2bff175f'), 1, '스타벅스, 커피빈 10% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('55a14c76ea2f4f7eb773e7b82306b64d'), UNHEX('b7a92ee18a305f5690096dfc2bff175f'), 2,
        '구글플레이스토어, 앱스토어 10% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('1f1cdb5e237644f49e32c5c98e44b4fd'), UNHEX('b7a92ee18a305f5690096dfc2bff175f'), 3, '인터파크 티켓 10% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('c6811fe99d25486681328908d8ebc7c0'), UNHEX('b7a92ee18a305f5690096dfc2bff175f'), 4, '올리브영, 미용실 업종 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('7ed9d66a612346c3b8c7bd20a4209efa'), UNHEX('b7a92ee18a305f5690096dfc2bff175f'), 5, 'GS25, CU 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('541a5d82a7ef45a5b4881c3e53c2e38c'), UNHEX('b7a92ee18a305f5690096dfc2bff175f'), 6,
        '넷플릭스, 유튜브프리미엄 1,000원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('225e0cbaa7174e9fb8e591bf327926c6'), UNHEX('b7a92ee18a305f5690096dfc2bff175f'), 7,
        '배달의민족, 요기요 1,000원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('18691ba84a9f40c5bdb1268488ac82df'), UNHEX('b7a92ee18a305f5690096dfc2bff175f'), 8,
        'SKT, KT, LG U+, Liiv M 2,500원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('8caae54311f74fd1bd613f56f929bfa4'), UNHEX('b7a92ee18a305f5690096dfc2bff175f'), 9, 'CGV 4,000원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('ff4c537b9d4d4199ad006486a6606a78'), UNHEX('b7a92ee18a305f5690096dfc2bff175f'), 10,
        '에버랜드, 롯데월드 15,000원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4fde7aa02d3e4fdeaf2bdb3a0c688e65'), UNHEX('b7a92ee18a305f5690096dfc2bff175f'), 11, '해외 가맹점 2% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('4931e81726d74fa4ad27fc0c009b885e'), UNHEX('b7a92ee18a305f5690096dfc2bff175f'), 12,
        '공항라운지 더라운지멤버스 연 1회 제공');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('0105025d50dc4a10bcbe6dd2463a52ae'), UNHEX('e6ce8c0691985233adbbf2c3fa5dbdac'), 1,
        '후불 기후동행카드 서비스 (대중교통 이용 혜택)');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('c59fca37221846dda05d146f6ddcc2fd'), UNHEX('e6ce8c0691985233adbbf2c3fa5dbdac'), 2, '온라인 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('7f8e2db8cc514be4a500ce581e7813a8'), UNHEX('e6ce8c0691985233adbbf2c3fa5dbdac'), 3, '오프라인 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('fb956465ae7f4132b4ca75db827d3956'), UNHEX('e6ce8c0691985233adbbf2c3fa5dbdac'), 4,
        '버스, 지하철 이용 건당 100원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('ca19328ac3a8491aa1bc6e6a6494a812'), UNHEX('e6ce8c0691985233adbbf2c3fa5dbdac'), 5, '쿠팡, 티몬, 위메프 10% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('eb9a05bb89df4de2b8eb42428a41ac93'), UNHEX('e6ce8c0691985233adbbf2c3fa5dbdac'), 6,
        'GS25, CU, 세븐일레븐, 올리브영 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('3fb130c921b040b88eaf02ce61802306'), UNHEX('e6ce8c0691985233adbbf2c3fa5dbdac'), 7,
        'CGV, 롯데시네마, 메가박스 4천원 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('457302ffbc2d4189a798054e8c1f20dc'), UNHEX('e6ce8c0691985233adbbf2c3fa5dbdac'), 8, '주요 커피전문점 10% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('dd6e800995bd4c69985d703adfaee25c'), UNHEX('e6ce8c0691985233adbbf2c3fa5dbdac'), 9, '금융우대서비스 제공');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('db3995f0c0d9442eb3de11837c294ab1'), UNHEX('e6ce8c0691985233adbbf2c3fa5dbdac'), 10,
        '주요 놀이공원 무료입장 또는 할인 (월 1회, 연 2회)');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('a217897198b64b989d705a9995277d00'), UNHEX('a91659c466b65e8f9d0ab008bf32706f'), 1, '대중교통 이용 시 최대 5% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('49d2863594f74ea48e4b3bfbf6db92a7'), UNHEX('a91659c466b65e8f9d0ab008bf32706f'), 2,
        '생활편의영역 이용 시 최대 2% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('da00f7ba325e4193b09fa4d3439c8141'), UNHEX('a91659c466b65e8f9d0ab008bf32706f'), 3, '해외 이용금액 1.3% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('d2dbace398df4dd1b923c6c6bbe98b9e'), UNHEX('517cc5d8844c5d138a7fb4de76b02c2f'), 1, '대중교통 10% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('a15f347979a64173afbcc48081bb12ac'), UNHEX('517cc5d8844c5d138a7fb4de76b02c2f'), 2, '생활서비스 1% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('1572b6be1c5f4a72b9093ffd70bc54f8'), UNHEX('517cc5d8844c5d138a7fb4de76b02c2f'), 3,
        'KB Pay 이용 시 1% 추가 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('991cf25068b74908ae461870e4e5b294'), UNHEX('517cc5d8844c5d138a7fb4de76b02c2f'), 4, '포인트리 적립 서비스');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('e9601890fe92410e94a174052c53076f'), UNHEX('00458b3a0b235d0b9f560f29eef2d554'), 1,
        '버스/지하철 10% 캐시백 (월 3천원, 월 6천원)');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('715206d55cc94a61be7126ab7b37f4f2'), UNHEX('00458b3a0b235d0b9f560f29eef2d554'), 2,
        '다이소/올리브영 1% 캐시백 (월 1만원)');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('99f34bf5688e42b884f42e8808191366'), UNHEX('00458b3a0b235d0b9f560f29eef2d554'), 3,
        '스타벅스/커피빈 1% 캐시백 (월 5천원)');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('efb9d61235aa48b5bb78dea44dc1ce8b'), UNHEX('04987a32cd4153ae971bc6ed4d3b7d17'), 1, '자동납부 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('d018fc981a0749ecbc3684b08945a9e6'), UNHEX('04987a32cd4153ae971bc6ed4d3b7d17'), 2, '통신비 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('5f1d7c7f1de94d838a118aa082824f4e'), UNHEX('04987a32cd4153ae971bc6ed4d3b7d17'), 3, '커피전문점 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('328aecaed423461eb0c11db186eb9bc5'), UNHEX('04987a32cd4153ae971bc6ed4d3b7d17'), 4, '편의/생활 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('5651d65526fe41ef804db7d15eadd7d8'), UNHEX('04987a32cd4153ae971bc6ed4d3b7d17'), 5, '포토 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('52a053cf28a542b3a86b77355ac41949'), UNHEX('04987a32cd4153ae971bc6ed4d3b7d17'), 6, '해외 이용 수수료 면제');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('ccd544eb5efb47e99cf308cd5d7247de'), UNHEX('789fa13f46c35164b8fb2ad6fd16f71c'), 1, '해외 수수료 면제 서비스');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('a287bb16d70347bd91ccee80a2e27c42'), UNHEX('789fa13f46c35164b8fb2ad6fd16f71c'), 2, '해외 5% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('5cfd78cfdca841708b33f654aadcc5ce'), UNHEX('789fa13f46c35164b8fb2ad6fd16f71c'), 3, '쇼핑 5% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('6961a12f981a4649a862b9265835a24b'), UNHEX('789fa13f46c35164b8fb2ad6fd16f71c'), 4, '푸드 5% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('bafd5cb1060e44eb8b8d2606772d24a8'), UNHEX('789fa13f46c35164b8fb2ad6fd16f71c'), 5, '일상 5% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('a6d633f03ee34e879d08084311cfc00d'), UNHEX('d2fea734229456bca817e151adc0de9e'), 1, '세탁소 10% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('717afa85f6414b2a94026d2b613186b7'), UNHEX('d2fea734229456bca817e151adc0de9e'), 2, '정육점 10% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('db8d3f0da70b43d9933e3576e3df7e61'), UNHEX('d2fea734229456bca817e151adc0de9e'), 3, '슈퍼마켓 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('6aca8b5c19fb4a3c87248981a9a73686'), UNHEX('d2fea734229456bca817e151adc0de9e'), 4, '반찬가게 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('1fff183f5dae4c119b14f97ee412308b'), UNHEX('d2fea734229456bca817e151adc0de9e'), 5, '야채과일가게 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('55f12c42a4cb449d80640ad21b216bf0'), UNHEX('d2fea734229456bca817e151adc0de9e'), 6, '번개장터(번개페이) 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('eba3f996d97a46f2910c6ecee154f0a1'), UNHEX('d2fea734229456bca817e151adc0de9e'), 7, '카드 디자인 선택 가능');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('0e7961e0505c4b64b960cdc857f7019c'), UNHEX('de5094c890685a88b802fa1f27d4ba2b'), 1,
        '국내외 이용가맹점 0.2% NH포인트 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('b2b4ccaa4a394a68b921dfd73b4bb233'), UNHEX('de5094c890685a88b802fa1f27d4ba2b'), 2,
        '이용금액 1위/2위 영역 기본적립의 3배/2배 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('c93feca65bca49dd8ee446669db02e5d'), UNHEX('de5094c890685a88b802fa1f27d4ba2b'), 3, '국제 공항라운지 무료이용');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('b2b667bf65de4afc9039fd1792b1daed'), UNHEX('de5094c890685a88b802fa1f27d4ba2b'), 4,
        '농협 인터넷·모바일·스마트·텔레뱅킹 이체수수료 통합 월 5회 면제');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('da5f0efd54d14c758dc99ee1b71358f2'), UNHEX('bda1f4790206531da75f23243a941cff'), 1,
        '커피, 편의점, 약국, 패스트푸드 2% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('9093f06f670641978c8e680f8fafb65f'), UNHEX('bda1f4790206531da75f23243a941cff'), 2, 'KB Pay, 올리브영 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('11cf454867b44abe83221b8b2716342b'), UNHEX('bda1f4790206531da75f23243a941cff'), 3, '영화 5% 할인');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('ed010de464e54b938d76217adb6c1f46'), UNHEX('bda1f4790206531da75f23243a941cff'), 4, '후불 기후동행카드 서비스 제공');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('69312d9916e54a25a61cf742607496ff'), UNHEX('3d46a2cfcc2b57988b47c7004bc9e4e4'), 1, '국내/해외 가맹점 0.2% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('2e331a2ec9e1429f8d5c39908bd8d2cb'), UNHEX('3d46a2cfcc2b57988b47c7004bc9e4e4'), 2, '우리페이 0.5% 추가 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('077583ee18694425b435e834b35d9aad'), UNHEX('3d46a2cfcc2b57988b47c7004bc9e4e4'), 3,
        '마트/슈퍼/커피/주유 1% 특별 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('d0904849f6134297821054629e52ede9'), UNHEX('4cf97b70bb2c5b20b927a7a81bb0db1a'), 1, '4대 편의점 10% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('c58b213768a149f3a4e5c852d385cf20'), UNHEX('4cf97b70bb2c5b20b927a7a81bb0db1a'), 2, '커피 업종 10% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('09fbb1dcc3fa43eaa3b80bbc75537bdd'), UNHEX('4cf97b70bb2c5b20b927a7a81bb0db1a'), 3, '해외 이용 1% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('2b0fbedde97b4ffbbe35b4f9148b9a36'), UNHEX('4cf97b70bb2c5b20b927a7a81bb0db1a'), 4, '음악, OTT, 도서 10% 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('af756e99ca0840318cda0a1a7df74bc9'), UNHEX('4cf97b70bb2c5b20b927a7a81bb0db1a'), 5,
        '온라인 쇼핑몰 최대 3천 포인트 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('b2bfd2943d2341e2b485679eb24670c9'), UNHEX('d7c4e4d4d63e5f0f9534ba95ee0920a1'), 1, '국내 가맹점 카카오페이 포인트 적립');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('40a65d69d21841c380e9a7b8ec7fa0b6'), UNHEX('d7c4e4d4d63e5f0f9534ba95ee0920a1'), 2, '해외 이용 수수료 면제 서비스');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('2850837a98f749c8bb897ce5317ffd0b'), UNHEX('d7c4e4d4d63e5f0f9534ba95ee0920a1'), 3, '해외 ATM 인출 수수료 면제');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('25da45919db8480ea0f859e93d085b42'), UNHEX('056549342665569f8cdaa46c2bba8c1c'), 1, '우대 환율 적용');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('f5cca028335a4f04a95ba96193225e70'), UNHEX('056549342665569f8cdaa46c2bba8c1c'), 2,
        '해외 가맹점 수수료(1%) 및 해외 이용 수수료(0.18%) 면제');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('8e2cf089ddaa4bd881bc82b1f9fd59aa'), UNHEX('056549342665569f8cdaa46c2bba8c1c'), 3,
        '해외 ATM 인출 수수료 월 3회 면제');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('ec167b5602f5474cbbce9cec48f8d38a'), UNHEX('056549342665569f8cdaa46c2bba8c1c'), 4,
        '대한항공 마일리지 (3천원당 1마일리지 적립, 건당 3만원 이상 결제 시)');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('505ef52191cf438190ab7365a622a52f'), UNHEX('57b91375fc0a5d20b02590f28ae576ec'), 1, '편의점 10% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('70c628a2957f4cbaa573c10cc90406e5'), UNHEX('57b91375fc0a5d20b02590f28ae576ec'), 2, '간편결제 7% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('8a775bb148274cfd985a1920caba5744'), UNHEX('57b91375fc0a5d20b02590f28ae576ec'), 3, '간편식 7% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('fe253c561ea4441c9dd4834ac8571863'), UNHEX('57b91375fc0a5d20b02590f28ae576ec'), 4, '커피 7% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('abb98b65934a40b3bd24e4fa0ed4583f'), UNHEX('57b91375fc0a5d20b02590f28ae576ec'), 5, '힐링 7% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('bd032272af7c4e8d9f55ff23f3699e75'), UNHEX('57b91375fc0a5d20b02590f28ae576ec'), 6, '학원 7% 캐시백');
INSERT INTO card_benefit (benefit_id, card_id, benefit_order, benefit_text)
VALUES (UNHEX('cc0cf6ca210646e2a160360067ef9652'), UNHEX('57b91375fc0a5d20b02590f28ae576ec'), 7,
        '우체국예금 제휴보험 3종 무료가입 (1년)');
