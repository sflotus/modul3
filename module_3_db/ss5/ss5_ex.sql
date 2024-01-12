create database if not exists Product;
use Product;
create table product(
id int primary key auto_increment,
productCode varchar(45),
productName varchar(45),
productPrice double, check(productPrice>0),
productAmount int, check(productAmount>0),
productDescription varchar(45),
--  status 0 = active
productStatus bit default 0
);
insert into product(productCode,productName,productPrice,productAmount,productDescription) value('A1','Xoai',10000,10,'Xoai VN ');
insert into product(productCode,productName,productPrice,productAmount,productDescription) value('A2','Chuoi',20000,20,'Chuoi VN');
insert into product(productCode,productName,productPrice,productAmount,productDescription) value('C1','Dao',20000,20,'Dao CN');
insert into product(productCode,productName,productPrice,productAmount,productDescription) value('C2','Dua',20000,20,'Dua CN');

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index i_productCode on product(productCode);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index i_name_price on product(productName,productPrice);
explain select  * from product where productCode like 'A%';
-- So sánh câu truy vấn trước và sau khi tạo index

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view view_product  as 
select productCode,productName,productPrice,productStatus from product;
select * from view_product;
-- Tiến hành sửa đổi view
create or replace view view_product as 
select productCode,productName,productPrice from product;
select * from view_product;

-- Tiến hành xoá view
drop view view_product;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER $$
create  procedure get_all_product()
begin
select  * from product;
end $$
DELIMITER ;
call get_all_product();

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER $$
create  procedure add_new_product(product_Code varchar(45),product_Name varchar(45),product_Price double,product_Amount int ,product_Description varchar(45))
begin
insert into product(productCode,productName,productPrice,productAmount,productDescription) value(product_Code,product_Name,product_Price,product_Amount,product_Description);
end $$
DELIMITER ;
call add_new_product('J1','Thanh long', 25000,20,'Thanh long japan');
call get_all_product();

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER $$
create  procedure edit_product_by_id(id int, code  varchar(45), name varchar(45),Price double,Amount int,Description varchar(45))
begin
update product p
set 
productCode =code,
productName =name,
productPrice  = Price,
productAmount = Amount,
productDescription = Description
where p.id = id;
end $$
DELIMITER ;
call edit_product_by_id(1,'J2','Mang cau',50000,50,'Mang cau Japan');
call get_all_product();

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER $$
create  procedure delete_product_by_id(id int)
begin
delete from product p 
where p.id = id;
end $$
DELIMITER ;
call delete_product_by_id(3);
call get_all_product();
