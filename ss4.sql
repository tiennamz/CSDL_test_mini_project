-- Tạo CSDL có tên là ShopManager.
CREATE DATABASE ShopManager;
USE ShopManager;

-- Tạo bảng Categories
CREATE TABLE Categories(
	category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL

);

-- Tạo bảng Products
CREATE TABLE Products(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price BIGINT CHECK(price>0),
    stock INT CHECK(stock>0),
	category_id INT,
    FOREIGN KEY (category_id) REFERENCES  Categories(category_id)
    
);


--  Thêm dữ liệu
INSERT INTO Categories
VALUES (NULL, 'Điện tử '),
	   (NULL, 'Thời trang ');

INSERT INTO Products
VALUES  (NULL, 'iPhone 15', 25000000, 10, 1),
		(NULL, 'Samsung S23', 20000000, 5, 1),
        (NULL, 'Áo sơ mi nam', 500000, 50, 2),
        (NULL, 'Giày thể thao', 1200000, 20, 2);
        
        
        

SET sql_safe_updates =0;        
-- Cập nhật giá của sản phẩm "iPhone 15" lên thành 26,000,000

UPDATE Products
SET price = 26000000
WHERE product_name = 'iPhone 15';


-- Tăng số lượng tồn kho (stock) thêm 10 đơn vị cho tất cả các sản phẩm thuộc danh mục "Điện tử" 
UPDATE Products
SET stock = stock + 10
WHERE category_id = 1;
        
-- Xóa sản phẩm có product_id = 4. 
DELETE FROM Products
WHERE  product_id = 4;


-- Xóa tất cả các sản phẩm có giá nhỏ hơn 1,000,000. 
DELETE FROM Products
WHERE price<1000000;
        
-- Lấy ra tất cả sản phẩm có trong bảng Products. 
SELECT product_id, product_name, price, stock, category_id
FROM Products;

-- Lấy ra danh sách sản phẩm có số lượng trong kho lớn hơn 15.
SELECT product_id, product_name, price, stock, category_id 
FROM Products
WHERE stock > 15;
        
-- Lấy ra danh sách các sản phẩm có giá nằm trong khoảng từ 1,000,000 đến 25,000,000. 
SELECT product_id, product_name, price, stock, category_id 
FROM Products
WHERE price > 1000000 AND price < 25000000;


-- Lấy ra những sản phẩm mà tên không phải là "iPhone 15" và vẫn còn hàng trong kho (stock > 0). 
SELECT product_id, product_name, price, stock, category_id 
FROM Products
WHERE product_name <> 'iPhone 15' AND stock > 0;

-- Lấy ra các sản phẩm không thuộc danh mục 1 và có giá lớn hơn 500,000. 
SELECT product_id, product_name, price, stock, category_id 
FROM Products
WHERE category_id <> 1 AND price > 500000;


        