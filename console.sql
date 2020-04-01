CREATE DATABASE view_index_procedure;
USE view_index_procedure;

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY ,
    product_code VARCHAR(50) NOT NULL UNIQUE ,
    product_name VARCHAR(100) NOT NULL ,
    product_price DOUBLE NOT NULL ,
    product_amount DOUBLE NOT NULL ,
    product_description VARCHAR(200),
    product_status VARCHAR(100)
);
# Tạo UNIQUE INDEX.
CREATE UNIQUE INDEX index_product_code ON products (product_code);

# Tạo composite INDEX.
CREATE INDEX index_product_name_price ON products (product_name, product_price);

EXPLAIN SELECT * FROM products WHERE product_code = 'KBH';
SELECT * FROM products WHERE product_code = 'KBH';

# Tạo View .
CREATE VIEW products_view AS SELECT
  product_code, product_name,product_price,product_status FROM products;

SELECT * FROM products_view;
# Sửa đổi View.
UPDATE products_view SET product_price = 30000 WHERE product_name = 'Keo Bac Ha';
SELECT * FROM products_view;

# Xoá View.
DROP VIEW products_view;

# Tạo store procedure để lấy tất cả thông tin của sản phẩm.
CREATE PROCEDURE procedure_products()
   BEGIN
       SELECT * FROM products;
   END;

CALL procedure_products();

# Tạo store procedure để thêm mới sản phẩm.
CREATE PROCEDURE insert_products()
   BEGIN
     INSERT INTO products VALUES (8, 'BPD', 'Banh Pizza', 80000, 4, 'Day la banh pizza', 'Con hang');
   END;

CALL insert_products();
SELECT * FROM products;

#Tạo store procedure sửa thông tin sản phẩm theo id.
CREATE PROCEDURE update_products()
   BEGIN
       UPDATE products SET product_status = 'Het hang' WHERE id = 2;
   END;

CALL update_products();
SELECT * FROM products;

#Tạo store procedure xoá sản phẩm theo id.
CREATE PROCEDURE delete_products()
   BEGIN
     DELETE FROM products WHERE id = 2;
   END;

CALL delete_products();
SELECT * FROM products;

