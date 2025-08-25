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

INSERT INTO p_orders("created_at", "updated_at", "is_refundable", "total_price", "orders_id", "store_id",
                     "order_channel", "order_status", "receipt_method", "payment_method", "delivery_address",
                     "order_history", "user_id")
VALUES (now(), now(), 'false', 1,
        '12344321-fedc-ba98-7654-3210feabba98',
        '87654321-fedc-ba98-7654-3210fedcba98', 'ONLINE',
        'COMPLETED', 'DELIVERY', 'CREDIT_CARD',
        '서울특별시 강남구 테헤란로 125', 'sample text', 1);

INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '스프 새면 어쩌나 걱정했는데 포장을 잘 해주셔서 국물이 하나도 안 샜어요');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '케이크가 하나도 안 무너지고 잘 포장되어 왔어요!! 덕분에 친구 생일 파티 성공햇어용!!!');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '포장재가 튼튼해서 깔끔해여~~');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '국물 요리인데도 포장이 완벽해서 하나도 안 샜어요');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '포장도 꼼꼼하고 위생적으로 왔습니다.');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '사장님이 문의 전화를 친절하게 받아주셨어요.');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '요청사항을 꼼꼼히 확인해 주셔서 만족했습니다.');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '응대가 따뜻하고 세심해서 기분이 좋았습니다.');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '사장님이 직접 전화 주셔서 친절히 안내해 주셨어요.');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '응대가 빠르고 친절하십니다~!');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '가격 대비 양이 많아 두 끼나 먹었어요ㅋㅋㅋ 주말마다 시켜 먹고 있어요');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '구성이 알차고 양이 넉넉합니다.');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '이 가격에 이런 퀄리티는 훌륭합니다.');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '양이 충분해서 가성비 최고입니다.');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '가격이 저렴한데 맛과 양 모두 만족이에요.');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '배달이 약속 시간보다 15분 늦었어요.');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '예상 시간보다 20분 이상 지연됐습니다');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '배차가 너무너무너무 느려요');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '도착 예정 시간보다 한참 늦게 왔어요ㅠ');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '배달이 지연되어 불편했습니다');
-- 온도 유지 불만
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '피자 치즈가 식어서 질겼어요.');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '다 식은 국밥이라니');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '튀김이 하나도 안 바삭하고 눅눅함');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '국물이 미지근해서 데워 먹으려고 했는데 용기가 전자레인지 불가라고 돼있어서 그냥 식은 채로 먹었네요');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '음식이 차가워져서 별로였어요.');

-- 포장 누락 불만
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '소스가 누락되어 왔습니다');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '김치와 단무지가 빠져 있었어요.');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '반찬이 하나도 오지 않았습니다...');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '음료가 배송되지 않았습니다.');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '추가 주문한 사이드가 빠졌어요...');

-- 랜덤 리뷰
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '국물이 한 방울도 안 샜고 포장이 깔끔했어요. 요청사항 반영이 안 돼서 전화드렸는데 직원분도 친절했습니다~');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '배달이 20분 늦었는데 다행히 치킨은 바삭하네요ㅎ');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '가격 대비 양이 많고 구성 알찼습니다. 가성비 최고!');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '삼겹살 세트에 쌈장이 누락돼서 전화드렸는데 알반지 사장인지 너무 불친절함');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '포장 뚜껑이 단단히 닫혀 있어 국물이 안 샜어요. 매우 만족');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '맛은 평범했지만 양은 괜찮았어요');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '직원 응대가 친절하고 요청사항을 잘 반영해줬습니다');
INSERT INTO p_review(created_at, updated_at, rating, user_id, b_order_id, review_id, store_id, content)
VALUES (now(), now(), 1, 1, '12344321-fedc-ba98-7654-3210feabba98', '6361abdd-067c-48b0-b2ec-e5eb54b4d3a6', 'd6ef0ad4-89fa-48f1-bd3d-906a461be8ce', '예정 시간보다 늦게 도착했고 음식이 차가워요ㅜㅜ');


INSERT INTO p_b_order_item (created_at, updated_at, order_item_id, orders_id, menu_name, price, quantity) VALUES (now(), now(), 'aafedb5f-f580-4327-898d-7b3c1eee1466', '12344321-fedc-ba98-7654-3210feabba98', '샐러드', 29000, 2);


-- SELECT c.category_id, c.category_name, c.parent_category_id,
--        p1.category_name AS parent_name,
--        p2.category_name AS grandparent_name
-- FROM p_category c
--          LEFT JOIN p_category p1 ON c.parent_category_id = p1.category_id
--          LEFT JOIN p_category p2 ON p1.parent_category_id = p2.category_id
-- WHERE c.category_name = '브랜드 치킨';