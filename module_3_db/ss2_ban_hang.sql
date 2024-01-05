create database if not exists ss2_ban_hang;
use ss2_ban_hang;
create table customer(
c_id int primary key auto_increment,
c_name varchar(55),
c_age int
);
create table `order`(
o_id int primary key auto_increment,
c_id int,
o_date date,
o_total_price float,
foreign key (c_id) references customer(c_id)
);
create table product(
p_id int primary key auto_increment,
p_name varchar(55),
p_price float
);
create table order_product_detail(
o_id int,
p_id int,
op_qty int,
primary key(o_id,p_id),
foreign key (o_id) references `order`(o_id),
foreign key(p_id) references product(p_id)
);