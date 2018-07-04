CREATE OR REPLACE FUNCTION checkout(INTEGER)
  RETURNS DECIMAL(10, 2) AS
DECLARE products_in_cart CURSOR (cart_id_in INTEGER) IS SELECT product_id, amount FROM cart_item WHERE cart_id_in = cart_id;
$BODY$
BEGIN


END
$BODY$
LANGUAGE PGPSQL;

SELECT product_id, amount FROM cart_item WHERE cart_id = 2;
SELECT product_id, price, amount FROM price WHERE product_id IN (SELECT product_id FROM cart_item WHERE cart_id = 1) ORDER BY product_id ASC, amount DESC;



