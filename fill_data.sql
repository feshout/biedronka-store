INSERT INTO product(name) VALUES ('Bułka Kajzerka');
INSERT INTO product(name) VALUES ('Parówka');
INSERT INTO product(name) VALUES ('Piwo Warka');
INSERT INTO product(name) VALUES ('Jajko');
INSERT INTO product(name) VALUES ('Papier Toaletowy');
INSERT INTO product(name) VALUES ('Kawa 300g');
INSERT INTO product(name) VALUES ('Sok Pomarańczowy 1L');

INSERT INTO price(amount, price, product_id) VALUES (1, 0.6, 1);
INSERT INTO price(amount, price, product_id) VALUES (1, 4, 2);
INSERT INTO price(amount, price, product_id) VALUES (2, 1.0, 1);
INSERT INTO price(amount, price, product_id) VALUES (3, 8.0, 2);
INSERT INTO price(amount, price, product_id) VALUES (4, 9.0, 2);
INSERT INTO price(amount, price, product_id) VALUES (1, 2.5, 3);
INSERT INTO price(amount, price, product_id) VALUES (4, 7.5, 3);
INSERT INTO price(amount, price, product_id) VALUES (1, 2.0, 5);
INSERT INTO price(amount, price, product_id) VALUES (8, 14.0, 5);
-- INSERT INTO price(amount, price, product_id) VALUES (8, 14.0, 7);

INSERT INTO cart(id) VALUES (1);
INSERT INTO cart(id) VALUES (2);

INSERT INTO cart_item(cart_id, product_id, amount) VALUES (1, 1, 5);
INSERT INTO cart_item(cart_id, product_id, amount) VALUES (1, 2, 12);
INSERT INTO cart_item(cart_id, product_id, amount) VALUES (2, 3, 6);