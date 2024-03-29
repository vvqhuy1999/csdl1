use masv_quanlybh;

-- Bai 1
CREATE UNIQUE INDEX uni_dienthoai_khachhang	ON khachhang(dienthoai);

CREATE UNIQUE INDEX uni_email_khachhang	ON khachhang(email);

-- Bai 2
-- Tao user
create user 'huy'@'localhost' IDENTIFIED BY '1231211ok';

-- Gan quyen
GRANT ALL PRIVILEGES on masv_quanlybh.* TO 'huy'@'localhost';

-- thu hoi quyen
REVOKE ALL PRIVILEGES on masv_quanlybh.* FROM 'huy'@'localhost';

-- xoa user
DROP USER 'huy'@'localhost';

-- thu hoi quyen delete
REVOKE delete on masv_quanlybh.* FROM  'huy'@'localhost';

-- Bai3

-- 1. Hiển thị danh sách các sản phẩm ‘Hàng xách tay’, có giá nhỏ hơn 5 mươi triệu. Thông tin gồm: Mã sp, tên sp, giá
select MaSP,TenSP,GiaSP
from sanpham
where MoTa ='Hang xach tay' and GiaSP <50000000;

-- 2. Cho biết số lượng hóa đơn chưa thanh toán của từng khách hàng. Thông tin gồm: Mã kh, tên kh, số lượng HD chưa TT
select hd.makh, kh.Ten, hd.TrangThai, count(hd.makh)
from khachhang kh, hoadon hd
where kh.MaKH=hd.MaKH and TrangThai like 'Chưa thanh toán'
group by hd.MaKH,kh.Ten, hd.TrangThai;


-- 3. Thêm 1 hóa đơn mới (thông tin tự cho).
insert into hoadon value
('HD030', '2018-01-29', 7000000,'Chưa thanh toán', 'NV001', 'KH002');

-- 4. Cập nhật trạng thái ‘Đã thanh toán’ và ngày lập HD là ngày hiện tại cho hóa đơn ‘HD002’ 
update hoadon
SET TrangThai = 'Đã thanh toán' , NgayLapHD =  curdate()
Where MaHD like 'HD002';
-- select * from hoadon;
-- 5. Cho biết thông tin các nhân viên đã bán hàng cho khách hàng ‘KH001’. Thông tin hiển thị: MaNV, Họ tên NV, Số ĐT 
select nv.MaNV, concat(nv.HoVaTenLot," ",nv.Ten)as 'Ho va Ten', nv.DienThoai
from nhanvien nv, hoadon hd, khachhang kh
where kh.MaKH=hd.MaKH and nv.MaNV=hd.MaNV and kh.MaKH = 'KH001';

-- 6. Danh sách các sản phẩm có trong nhiều hơn 2 hóa đơn. 
select sp.*, count(mahd) as 'So lan xuat hien trong hd'
from hoadonchitiet ct, sanpham sp
where ct.MaSP= sp.MaSP
group by ct.MaSP
having count(MaHD)>2