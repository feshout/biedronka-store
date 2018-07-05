CREATE OR REPLACE FUNCTION checkout(cart_id_to_check INTEGER) RETURNS DECIMAL(10, 2) AS $$
DECLARE
  cart_item_row cart_item%rowtype;
  price_row price%rowtype;

  result DECIMAL(10, 2) := 0;
  amount INTEGER;
  temp INTEGER;
BEGIN
  FOR cart_item_row IN SELECT * FROM
    cart_item WHERE cart_item.cart_id = cart_id_to_check ORDER BY cart_item.product_id
    LOOP
      amount := cart_item_row.amount;

      FOR price_row IN SELECT * FROM price
            ORDER BY price.product_id ASC, price.amount DESC
        LOOP
          IF cart_item_row.product_id = price_row.product_id THEN
              temp := amount / price_row.amount;
              amount := amount - (price_row.amount * temp);
              result := result + (temp * price_row.price);
          END IF;
        END LOOP;
  END LOOP;

  RETURN result;
END
$$ LANGUAGE plpgsql;

SELECT checkout(1);




