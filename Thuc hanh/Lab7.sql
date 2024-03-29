use masv_quanlybh;
-- select * from khachhang;
-- select * from nhanvien;
-- select * from sanpham;
 select * from hoadon;
 select * from hoadonchitiet;
-- select * from KhachHang_Q1;
-- 1. Thêm 1 khách hàng mới (thông tin tự cho).
insert into khachhang value('KH025','Võ Văn Quang','Huy','Tân Phú','','0123456789');
-- 2. Thêm 3 sản phẩm mới (search tìm thông tin sản phẩm)
insert into sanpham values 
		('SP007','IPHONE 11', '30000000',50,'Hàng chính hãng'),
        ('SP008','IPHONE 12', '35000000',30,'Hàng chính hãng'),
        ('SP009','BLACK SHARK 4', '20000000',40,'Hàng xách tay');
-- 3. Thêm 1 hóa đơn mới cho khách hàng mới thêm
insert into hoadon value ('HD030','2020-05-21',30000000,'Chưa thanh toán','NV001','KH025');
-- 4. Thêm hóa đơn chi tiết của hóa đơn vừa nhập mua 3 sản phẩm bất kỳ.
insert into hoadonchitiet value  ('HD030','SP007',1);
-- 5. Tạo 1 bảng có tên KhachHang_Q1 chứa thông tin tin đầy đủ về các khách hàng ở Quận 1
create table KhachHang_Q1 
select * from khachhang 
where diachi like 'Quận 1';
-- 6. Cập nhật lại thông tin số điện thoại của khách hàng có mã ‘KH002’ có giá trị mới là ‘16267788989’
update khachhang 
set dienthoai = '16267788989'
where makh = 'KH002';
-- 7. Tăng số lượng mặt hàng có mã ‘SP003’ lên thêm ‘200’ đơn vị
update sanpham
set soluong = soluong + 200
where masp = 'SP003';
-- 8. Giảm giá cho tất cả sản phẩm giảm 5%
update sanpham 
set giasp = giasp * 0.95;
-- 9. Tăng số lượng của mặt hàng bán chạy nhất trong tháng 2/2019 lên 100 đơn vị
update sanpham sp
set sp.soluong = sp.soluong + 100 
where sp.masp = ( select masp from (
		select masp , max(soluongban) over (partition by masp) from (
				select hdct.masp, sum(hdct.soluongmua) soluongban
				from hoadonchitiet hdct
				join hoadon hd on hd.mahd = hdct.mahd
				where month(ngaylaphd) =2 and year(ngaylaphd) = 2019
				group by hdct.masp
		) alias
	)aliass
    limit 1
);



-- 10. Giảm giá 10% cho 2 sản phẩm bán ít nhất trong năm 2019
update sanpham sp
set sp.giasp = sp.giasp * 0.9
where sp.masp = ( select masp from (
		select masp , min(soluongban) over (partition by masp) from (
				select hdct.masp, sum(hdct.soluongmua) soluongban
				from hoadonchitiet hdct
				join hoadon hd on hd.mahd = hdct.mahd
				where  year(ngaylaphd) = '2019'
				group by hdct.masp
		) alias
        order by soluongban asc
	)aliass
    limit 1
)
	or sp.masp = ( select masp from (
		select masp , min(soluongban) over (partition by masp) from (
				select hdct.masp, sum(hdct.soluongmua) soluongban
				from hoadonchitiet hdct
				join hoadon hd on hd.mahd = hdct.mahd
				where  year(ngaylaphd) = '2019'
				group by hdct.masp
		) alias
        order by soluongban asc
	)aliass
    limit 1 offset 2
);

-- 11. Cập nhật lại trạng thái “chưa thanh toán” cho hoá đơn có mã ‘HD001’
update hoadon
set trangthai = 'Chưa thanh toán'
where mahd = 'HD001';
-- 12. Xoá mặt hàng có mã sản phẩm là ‘SP001’ ra khỏi hoá đơn ‘HD001’ .
delete from hoadonchitiet 
where masp = 'SP001' and mahd = 'HD001';
-- 13. Xoá khách hàng chưa từng mua hàng kể từ ngày “1-1-2019”

-- delete from khachhang 
-- where makh = (
-- 				select kh.*, max(hd.ngaylaphd)
-- 				from khachhang kh 
-- 				left join hoadon hd on kh.makh = hd.makh
-- 				group by kh.makh,hd.ngaylaphd
-- 				having max(hd.ngaylaphd) >= '2019-01-01'
-- 				 );
                 
-- DELETE FROM MASV_quanlybh.khachhang
-- WHERE NOT EXISTS (
--     SELECT 1
--     FROM MASV_quanlybh.hoadon
--     WHERE hoadon.MaKH = khachhang.MaKH
--     AND hoadon.NgayLapHD >= '2019-01-01'
-- );            