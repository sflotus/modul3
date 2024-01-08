use ss2_ban_hang;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select  o_id,o_date,o_total_price from `order`;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
-- Hiển thị danh sách các khách hàng đã mua hàng
select c.c_id,c.c_name  from customer c
join  `order` o on  c.c_id = o.c_id
group by c.c_id;

-- danh sách sản phẩm được mua bởi các khách
select p.p_id, p.p_name from product p 
join order_product_detail opd on p.p_id = opd.p_id
group by p.p_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select * from customer c
left join  `order` o on o.c_id = c.c_id
where o.o_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o.o_id as `order id`,o.o_date as `order's date`, sum(opd.op_qty*p.p_price) as total from order_product_detail opd
join `order` o on o.o_id =opd.o_id
join  product p on p.p_id =opd.p_id
group  by o.o_id;
