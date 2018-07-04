CREATE TABLE IF NOT EXISTS product (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS price (
  id SERIAL PRIMARY KEY,
  amount INTEGER, CHECK (amount > 0),
  price DECIMAL(10, 2), CHECK (price > 0),
  product_id INTEGER REFERENCES product(id),
  UNIQUE (amount, price, product_id)
);

CREATE TABLE IF NOT EXISTS cart (
  id SERIAL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS cart_item (
  id SERIAL PRIMARY KEY,
  cart_id INTEGER REFERENCES cart(id),
  product_id INTEGER REFERENCES product(id),
  amount INTEGER,
  CHECK (amount > 0),
  UNIQUE (product_id)
);

CREATE OR REPLACE FUNCTION ensure_detail_price()
  RETURNS TRIGGER AS
$BODY$
BEGIN
IF NEW.amount > 1 AND NOT EXISTS(SELECT 1 FROM price WHERE product_id = NEW.product_id) THEN
  RAISE EXCEPTION 'Detail price of product with id % not exists in database', NEW.product_id;
END IF;
  RETURN NEW;
END
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER details BEFORE INSERT ON price
FOR EACH ROW
EXECUTE PROCEDURE ensure_detail_price();
