-- 지역 추가하기
INSERT INTO p_region ("created_at", "updated_at", "region_id", "region_code", "region_name", "is_active", "full_name",
                      "sido", "sigungu", "eupmyendong")
VALUES (now(), now(), 'abcdef01-2345-6789-abcd-ef0123456789', 'R8F8B4021', 'atque', FALSE, 'velit', 'eligendi', 'aut',
        'ducimus');

-- 카테 고리 추가
-- INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
-- VALUES (now(), now(), '6530a750-89b7-44af-aebc-0e008fbeccd7', '치킨', NULL);

-- 1단계 카테고리
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), uuid_generate_v4(), '한식', NULL),
    (now(), now(), uuid_generate_v4(), '일식/중식', NULL),
    (now(), now(), uuid_generate_v4(), '양식/패스트푸드', NULL),
    (now(), now(), uuid_generate_v4(), '카페/디저트', NULL),
    (now(), now(), uuid_generate_v4(), '야식', NULL);

-- 2단계 카테고리
-- '한식' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), uuid_generate_v4(), '식사류', (SELECT category_id FROM p_category WHERE category_name = '한식' AND parent_category_id IS NULL)),
    (now(), now(), uuid_generate_v4(), '육류', (SELECT category_id FROM p_category WHERE category_name = '한식' AND parent_category_id IS NULL)),
    (now(), now(), uuid_generate_v4(), '기타', (SELECT category_id FROM p_category WHERE category_name = '한식' AND parent_category_id IS NULL));

-- '식사류' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), uuid_generate_v4(), '백반/가정식', (SELECT category_id FROM p_category WHERE category_name = '식사류' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '찌개/찜', (SELECT category_id FROM p_category WHERE category_name = '식사류' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '국밥', (SELECT category_id FROM p_category WHERE category_name = '식사류' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '면/국수', (SELECT category_id FROM p_category WHERE category_name = '식사류' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '죽/수프', (SELECT category_id FROM p_category WHERE category_name = '식사류' AND parent_category_id IS NOT NULL));

-- '육류' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), uuid_generate_v4(), '삼겹살/고기구이', (SELECT category_id FROM p_category WHERE category_name = '육류' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '족발/보쌈', (SELECT category_id FROM p_category WHERE category_name = '육류' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '곱창/막창/대창', (SELECT category_id FROM p_category WHERE category_name = '육류' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '갈비/찜닭', (SELECT category_id FROM p_category WHERE category_name = '육류' AND parent_category_id IS NOT NULL));

-- '기타' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), uuid_generate_v4(), '해산물/아구찜', (SELECT category_id FROM p_category WHERE category_name = '기타' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '분식 (떡볶이, 김밥 등)', (SELECT category_id FROM p_category WHERE category_name = '기타' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '전/빈대떡', (SELECT category_id FROM p_category WHERE category_name = '기타' AND parent_category_id IS NOT NULL));

-- '일식/중식' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), uuid_generate_v4(), '일식', (SELECT category_id FROM p_category WHERE category_name = '일식/중식' AND parent_category_id IS NULL)),
    (now(), now(), uuid_generate_v4(), '중식', (SELECT category_id FROM p_category WHERE category_name = '일식/중식' AND parent_category_id IS NULL)),
    (now(), now(), uuid_generate_v4(), '아시안', (SELECT category_id FROM p_category WHERE category_name = '일식/중식' AND parent_category_id IS NULL));

-- '일식' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), uuid_generate_v4(), '초밥/회', (SELECT category_id FROM p_category WHERE category_name = '일식' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '돈가스/카레', (SELECT category_id FROM p_category WHERE category_name = '일식' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '라멘/우동', (SELECT category_id FROM p_category WHERE category_name = '일식' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '덮밥 (규동, 오야꼬동 등)', (SELECT category_id FROM p_category WHERE category_name = '일식' AND parent_category_id IS NOT NULL));

-- '중식' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), uuid_generate_v4(), '짜장면/짬뽕', (SELECT category_id FROM p_category WHERE category_name = '중식' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '탕수육/요리류', (SELECT category_id FROM p_category WHERE category_name = '중식' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '마라탕/훠궈', (SELECT category_id FROM p_category WHERE category_name = '중식' AND parent_category_id IS NOT NULL));

-- '아시안' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), uuid_generate_v4(), '베트남 음식 (쌀국수, 분짜 등)', (SELECT category_id FROM p_category WHERE category_name = '아시안' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '태국 음식', (SELECT category_id FROM p_category WHERE category_name = '아시안' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '인도 음식 (카레, 난 등)', (SELECT category_id FROM p_category WHERE category_name = '아시안' AND parent_category_id IS NOT NULL));

-- '양식/패스트푸드' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), uuid_generate_v4(), '양식', (SELECT category_id FROM p_category WHERE category_name = '양식/패스트푸드' AND parent_category_id IS NULL)),
    (now(), now(), uuid_generate_v4(), '피자', (SELECT category_id FROM p_category WHERE category_name = '양식/패스트푸드' AND parent_category_id IS NULL)),
    (now(), now(), uuid_generate_v4(), '치킨', (SELECT category_id FROM p_category WHERE category_name = '양식/패스트푸드' AND parent_category_id IS NULL));

-- '양식' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), uuid_generate_v4(), '파스타/스테이크', (SELECT category_id FROM p_category WHERE category_name = '양식' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '샐러드', (SELECT category_id FROM p_category WHERE category_name = '양식' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '햄버거', (SELECT category_id FROM p_category WHERE category_name = '양식' AND parent_category_id IS NOT NULL));

-- '피자' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), uuid_generate_v4(), '브랜드 피자', (SELECT category_id FROM p_category WHERE category_name = '피자' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '수제 피자', (SELECT category_id FROM p_category WHERE category_name = '피자' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '피자/파스타 세트', (SELECT category_id FROM p_category WHERE category_name = '피자' AND parent_category_id IS NOT NULL));

-- '치킨' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), uuid_generate_v4(), '프라이드/양념 치킨', (SELECT category_id FROM p_category WHERE category_name = '치킨' AND parent_category_id IS NOT NULL)),
    (now(), now(), '201def94-33d8-450f-b330-5b6f14d73304', '브랜드 치킨', (SELECT category_id FROM p_category WHERE category_name = '치킨' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '찜닭/닭강정', (SELECT category_id FROM p_category WHERE category_name = '치킨' AND parent_category_id IS NOT NULL));

-- '카페/디저트' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), uuid_generate_v4(), '디저트', (SELECT category_id FROM p_category WHERE category_name = '카페/디저트' AND parent_category_id IS NULL)),
    (now(), now(), uuid_generate_v4(), '음료', (SELECT category_id FROM p_category WHERE category_name = '카페/디저트' AND parent_category_id IS NULL)),
    (now(), now(), uuid_generate_v4(), '간식', (SELECT category_id FROM p_category WHERE category_name = '카페/디저트' AND parent_category_id IS NULL));

-- '디저트' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), uuid_generate_v4(), '케이크/빵', (SELECT category_id FROM p_category WHERE category_name = '디저트' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '아이스크림/빙수', (SELECT category_id FROM p_category WHERE category_name = '디저트' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '마카롱/쿠키', (SELECT category_id FROM p_category WHERE category_name = '디저트' AND parent_category_id IS NOT NULL));

-- '음료' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), uuid_generate_v4(), '커피/차', (SELECT category_id FROM p_category WHERE category_name = '음료' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '생과일주스/에이드', (SELECT category_id FROM p_category WHERE category_name = '음료' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '스무디/쉐이크', (SELECT category_id FROM p_category WHERE category_name = '음료' AND parent_category_id IS NOT NULL));

-- '간식' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), uuid_generate_v4(), '토스트/샌드위치', (SELECT category_id FROM p_category WHERE category_name = '간식' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '와플/크로플', (SELECT category_id FROM p_category WHERE category_name = '간식' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '핫도그/버거', (SELECT category_id FROM p_category WHERE category_name = '간식' AND parent_category_id IS NOT NULL));

-- '야식' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), uuid_generate_v4(), '야식류', (SELECT category_id FROM p_category WHERE category_name = '야식' AND parent_category_id IS NULL)),
    (now(), now(), uuid_generate_v4(), '기타', (SELECT category_id FROM p_category WHERE category_name = '야식' AND parent_category_id IS NULL));

-- '야식류' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), uuid_generate_v4(), '족발/보쌈', (SELECT category_id FROM p_category WHERE category_name = '야식류' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '곱창/막창', (SELECT category_id FROM p_category WHERE category_name = '야식류' AND parent_category_id IS NOT NULL)),
    (now(), now(), uuid_generate_v4(), '술안주 (전, 튀김 등)', (SELECT category_id FROM p_category WHERE category_name = '야식류' AND parent_category_id IS NOT NULL));









-- 유저 추가
INSERT INTO p_user (created_at, created_by, updated_at, updated_by,
                    phone_number, user_role, nickname, real_name, username, email, password)
VALUES (now(), NULL, now(), NULL,
        '010-1111-2222', 'OWNER', 'OwnerKim', '김철수', 'owner_kim', 'owner.kim@example.com', 'hashed_pasㄴ');

INSERT INTO p_user (created_at, created_by, updated_at, updated_by,
                    phone_number, user_role, nickname, real_name, username, email, password)
VALUES (now(), NULL, now(), NULL,
        '010-3333-4444', 'CUSTOMER', 'CustomerLee', '이영희', 'customer_lee', 'customer.lee@example.com', 'hashed_pass');

-- 승인된 스토어 추가
INSERT INTO p_store (created_at, created_by, deleted_at, deleted_by, min_order_amount,
                     updated_at, updated_by, user_id, category_id, region_id,
                     store_id, phone_number, store_name, address, description, store_accept_status)
VALUES (now(), NULL, NULL, NULL, 5000,
        now(), NULL, 1, '201def94-33d8-450f-b330-5b6f14d73304',
        'abcdef01-2345-6789-abcd-ef0123456789',
        '87654321-fedc-ba98-7654-3210fedcba98', '010-1234-5678', '교촌치킨', '서울특별시 강남구 테헤란로 123',
        '매일 신선한 재료로 만드는 치킨 전문점입니다.', 'APPROVE');

INSERT INTO p_store (created_at, created_by, deleted_at, deleted_by, min_order_amount,
                     updated_at, updated_by, user_id, category_id, region_id,
                     store_id, phone_number, store_name, address, description, store_accept_status)
VALUES (now(), NULL, NULL, NULL, 5000,
        now(), NULL, 1, '4822f272-0547-492a-a345-d77acbdfa5c6',
        'abcdef01-2345-6789-abcd-ef0123456789',
        '87654321-fedc-ba98-7654-3210fedcba08', '010-1234-5978', 'BHC 치킨', '서울특별시 강남구 테헤란로 125',
        '매일 신선한 재료로 만드는 치킨 전문점입니다.', 'APPROVE');


-- 메뉴
INSERT INTO p_menu ("created_at", "updated_at", "menu_id", "store_id", "name", "description", "price", "is_hidden", "category_id")
VALUES (now(), now(), 'd56e1bb1-a709-4772-b7da-a1b2b88af9c1', '87654321-fedc-ba98-7654-3210fedcba98', '허니콤보',
        '꿀맛 허니 콤보',
        23000, FALSE, '4822f272-0547-492a-a345-d77acbdfa5c6');


-- 오더 생성
INSERT INTO p_orders("created_at", "updated_at", "is_refundable", "total_price", "orders_id", "store_id", "order_channel", "order_status", "receipt_method", "payment_method", "delivery_address", "order_history")
VALUES (now(), now(), 'false', 1, '87654321-fedc-ba98-7654-3210feabba98', '87654321-fedc-ba98-7654-3210fedcba98', 'ONLINE',
        'COMPLETED', 'DELIVERY', 'CREDIT_CARD', '서울특별시 강남구 테헤란로 125', 'sample text');
