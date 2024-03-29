use masv_quanlybh;
-- select * from khachhang;
-- select * from hoadon;
-- select * from nhanvien;
-- select * from sanpham;
-- select * from hoadonchitiet;
-- Bài tập: Dựa trên cơ sở dữ liệu Quản lý bán hàng đã có, hãy thực
-- hiện các câu truy vấn sau
-- 1. Hiển thị các cột thông tin (mã hóa đơn, ngày lập, tổng tiền, tên khách hàng)
select hd.mahd, hd.ngaylaphd, hd.tongtien, kh.ten
from hoadon hd ,khachhang kh
where hd.MaKH = kh.MaKH;
-- 2. Hiển thị các cột thông tin (mã hóa đơn, ngày lập, tổng tiền, tên nhân viên)
select hd.mahd, hd.ngaylaphd, hd.tongtien, nv.ten
from hoadon hd ,nhanvien nv
where hd.manv = nv.manv;
-- 3. Hiển thị các cột thông tin (mã hóa đơn, ngày lập, tổng tiền, tên nhân viên, tên khách hàng)
select hd.mahd, hd.ngaylaphd, hd.tongtien, nv.ten as 'Ten Nhan vien', kh.Ten as 'Ten Khach hang'
from hoadon hd ,nhanvien nv, khachhang kh
where hd.manv = nv.manv and hd.MaKH = kh.MaKH;
-- 4. Đếm tổng số khách hàng theo quận
select kh.diachi, count(diachi) as 'Đếm khách hàng theo quận'
from khachhang kh
group by diachi;
-- 5. Hiển thị tất cả thông tin trong bảng khách hàng, mã hóa đơn, ngày lập, 
-- lưu ý: Lấy tất cả khách hàng (có hóa đơn và không có hóa đơn).
select kh.makh, concat(hovatenlot, ' ' , Ten) as 'Ho va ten' , kh.diachi, kh.email, kh.dienthoai, hd.mahd,  hd.ngaylaphd
from khachhang kh 
left join hoadon hd
on kh.makh = hd.makh ;
-- 6. Hiển thị các thông tin (mã hóa đơn, ngày lập, tên khách hàng, số điện thoại), 
-- chỉ hiển thị các thông tin mà trạng thái là “chưa thanh toán”
select hd.mahd,  hd.ngaylaphd, concat(kh.hovatenlot, ' ' , kh.Ten) as 'Ho va ten', kh.dienthoai , hd.trangthai
from khachhang kh 
right join hoadon hd
on kh.makh = hd.makh 
having hd.trangthai like 'Chưa thanh toán';
-- 7. Hiển thị các thông tin (Mã hóa đơn, ngày lập, số lượng mua, tổng
-- tiền, tên sản phẩm) của các hóa đơn trong tháng 7
select hd.mahd, ct.soluongmua, hd.tongtien, hd.ngaylaphd, month(hd.ngaylaphd) as 'Thang'
from hoadon hd
join hoadonchitiet ct on hd.mahd = ct.mahd
where month(hd.ngaylaphd) = 7;
select * from hoadon;
-- 8. Hiển thị các thông tin (mã hóa đơn, ngày lập, tổng tiền, tên khách
-- hàng), điều kiện là chỉ hiển thị thông tin của khách hàng ở quận 1
select hd.mahd, hd.ngaylaphd, hd.tongtien, kh.ten
from hoadon hd
join khachhang kh on hd.makh = kh.makh
where kh.diachi like 'Quận 1';
-- 9. Hiển thị thông tin (mã hóa đơn, ngày lập hóa đơn, tổng tiền hóa đơn, số lượng mua, 
-- mã sản phẩm, tên sản phẩm) với điều kiện chỉ hiển thị các sản phẩm có giá >10 triệu
select hd.mahd, hd.ngaylaphd, hd.tongtien, ct.soluongmua, ct.masp, sp.tensp
from hoadon hd
join hoadonchitiet ct on hd.mahd = ct.mahd
join sanpham sp on ct.masp = sp.masp
where sp.giasp > 10000000;
-- 10. Hiển thị thông tin (mã hóa đơn, ngày lập hóa đơn, tổng tiền hóa đơn, số lượng mua,
--  mã sản phẩm, tên sản phẩm, giá sản phẩm, tên khách hàng), điều kiện khách hàng tên Khoa
select hd.mahd, hd.ngaylaphd, hd.tongtien, ct.soluongmua, ct.masp, sp.tensp, sp.giasp, kh.ten
from hoadon hd
join khachhang kh on hd.makh = kh.makh
join hoadonchitiet ct on hd.mahd = ct.mahd
join sanpham sp on ct.masp = sp.masp
where kh.ten like 'Khoa';
-- 11. Hiển thị maHoaDon, ngàyMuahang, tổng số tiền đã mua trong từng hoá đơn. 
-- Chỉ hiển thị những hóa đơn có tổng số tiền >=500.000 và sắp xếp theo thứ tự giảm dần của cột tổng tiền.

select hd.mahd, hd.ngaylaphd, hd.tongtien
from hoadon hd
where hd.tongtien >= 500000
order by hd.tongtien desc;
-- 12. Hiển thị danh sách các khách hàng chưa mua hàng lần nào
-- select * 
select kh.makh, concat(kh.hovatenlot,' ',kh.ten) as 'Họ và tên', kh.diachi, kh.email, kh.dienthoai
from khachhang kh 
left join hoadon hd on hd.makh = kh.makh
where hd.mahd is null;
-- 13. Hiển thị danh sách các khách hàng chưa mua hàng lần nào kể từ tháng 1/1/2019

select * from khachhang where makh not in (
select makh from hoadon where ngaylaphd > '2019-01-01'
);

select kh.*, max(hd.ngaylaphd)
from khachhang kh join hoadon hd on hd.makh = kh.makh
group by kh.makh
having max(hd.ngaylaphd) < '2019-01-01';

-- 14. Hiển thị mã sản phẩm, tên sản phẩm bán chạy nhất 
select ct.masp, sp.tensp, sum(soluongmua) as 'Tổng số lượng'
from sanpham sp join hoadonchitiet ct on sp.masp = ct.masp
group by ct.masp
order by sum(soluongmua) desc;

-- select * from hoadonchitiet;
-- 15. Hiển thị 5 khách hàng có tổng số tiền mua hàng nhiều nhất trong năm 2016
-- select * from hoadon;
select kh.makh, concat(kh.hovatenlot,' ' ,kh.ten) as 'Họ và tên', sum(hd.TongTien) as 'Tong tien'
from khachhang kh
join hoadon hd on kh.makh = hd.makh
where year(hd.ngaylaphd) like '2018'
group by kh.makh
order by sum(hd.TongTien) desc
limit 5;

-- 16. Hiển thị tên sản phẩm có lượt đặt mua nhỏ hơn lượt mua trung bình các các sản phẩm
select sanpham.tensp, count(HoaDonChiTiet.masp) from sanpham
join hoadonchitiet on HoaDonChiTiet.masp=sanpham.masp
group by HoaDonChiTiet.masp
having count(HoaDonChiTiet.masp) < all (
	select avg(SoLuongMua) from (
		select masp, count(masp) SoLuongMua
        from HoaDonChiTiet
        group by masp
		)alias
)