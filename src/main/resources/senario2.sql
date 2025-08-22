-- 지역 추가하기
INSERT INTO p_region ("created_at", "updated_at", "region_id", "region_code", "region_name", "is_active", "full_name",
                      "sido", "sigungu", "eupmyendong")
VALUES (now(), now(), 'abcdef01-2345-6789-abcd-ef0123456789', 'R8F8B4021', 'atque', FALSE, 'velit', 'eligendi', 'aut',
        'ducimus');


INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), 'abcdef01-2345-6789-abcd-ef0123456780', '양식/패스트푸드', NULL);

-- '양식/패스트푸드' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), 'abcdef01-2345-6789-abcd-ef0123456781', '치킨', (SELECT category_id FROM p_category WHERE category_name = '양식/패스트푸드' AND parent_category_id IS NULL));

-- '치킨' 하위 카테고리
INSERT INTO p_category ("created_at", "updated_at", "category_id", "category_name" , "parent_category_id")
VALUES
    (now(), now(), 'abcdef01-2345-6789-abcd-ef0123456782', '브랜드 치킨', (SELECT category_id FROM p_category WHERE category_name = '치킨' AND parent_category_id IS NOT NULL));


-- 유저 추가
INSERT INTO p_user (created_at, created_by, updated_at, updated_by,
                    phone_number, user_role, nickname, real_name, username, email, password)
VALUES (now(), NULL, now(), NULL,
        '010-1111-2222', 'OWNER', 'OwnerKim', '김철수', 'owner_kim', 'owner.kim@example.com', 'hashed_pass');

INSERT INTO p_user (created_at, created_by, updated_at, updated_by,
                    phone_number, user_role, nickname, real_name, username, email, password)
VALUES (now(), NULL, now(), NULL,
        '010-3333-4444', 'CUSTOMER', 'CustomerLee', '이영희', 'customer_lee', 'customer.lee@example.com', 'hashed_pass');

-- 승인된 스토어 추가
INSERT INTO p_store (created_at, created_by, deleted_at, deleted_by, min_order_amount,
                     updated_at, updated_by, user_id, category_id, region_id,
                     store_id, phone_number, store_name, address, description, store_accept_status)
VALUES (now(), NULL, NULL, NULL, 5000,
        now(), NULL, 1, 'abcdef01-2345-6789-abcd-ef0123456782',
        'abcdef01-2345-6789-abcd-ef0123456789',
        '87654321-fedc-ba98-7654-3210fedcba98', '010-1234-5678', '교촌치킨', '서울특별시 강남구 테헤란로 123',
        '매일 신선한 재료로 만드는 치킨 전문점입니다.', 'APPROVE');

INSERT INTO p_store (created_at, created_by, deleted_at, deleted_by, min_order_amount,
                     updated_at, updated_by, user_id, category_id, region_id,
                     store_id, phone_number, store_name, address, description, store_accept_status)
VALUES (now(), NULL, NULL, NULL, 5000,
        now(), NULL, 1, 'abcdef01-2345-6789-abcd-ef0123456782',
        'abcdef01-2345-6789-abcd-ef0123456789',
        '87654321-fedc-ba98-7654-3210fedcba08', '010-1234-5978', 'BHC 치킨', '서울특별시 강남구 테헤란로 125',
        '매일 신선한 재료로 만드는 치킨 전문점입니다.', 'APPROVE');

-- -- 재고 추가
-- INSERT INTO p_stock("created_at", "updated_at", "stock", "version", "menu_id", "stock_id")
-- VALUES (now(), now(), 100, 0, 'd56e1bb1-a709-4772-b7da-a1b2b88af9c1', 'd56e1bb1-a709-4772-b7da-a1b2b88af2c1');

-- 메뉴
INSERT INTO p_menu ("created_at", "updated_at", "menu_id", "store_id", "name", "description", "price", "is_hidden")
VALUES (now(), now(), 'd56e1bb1-a709-4772-b7da-a1b2b88af9c1', '87654321-fedc-ba98-7654-3210fedcba98', '허니콤보',
        '꿀맛 허니 콤보',
        23000, FALSE);

-- 재고 추가
INSERT INTO p_stock ("created_at", "updated_at", "stock_id", "menu_id", "stock", "version")
VALUES (now(), now(), 'f1e2d3c4-b5a6-7890-abcd-ef1234567890', 'd56e1bb1-a709-4772-b7da-a1b2b88af9c1', 100, 1);

-- SELECT c.category_id, c.category_name, c.parent_category_id,
--        p1.category_name AS parent_name,
--        p2.category_name AS grandparent_name
-- FROM p_category c
--          LEFT JOIN p_category p1 ON c.parent_category_id = p1.category_id
--          LEFT JOIN p_category p2 ON p1.parent_category_id = p2.category_id
-- WHERE c.category_name = '브랜드 치킨';