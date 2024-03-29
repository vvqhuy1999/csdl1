use masv_quanlybh;
-- Bài tập 01: Dựa trên cơ sở dữ liệu cho sẵn, hãy thực hiện các câu truy vấn sau
-- Hiển thị tất cả thông tin trong bảng khách hàng
select * from khachhang;
-- Hiển thị 3 khách hàng đầu tiên trong bảng khách hàng bao gồm các cột: mã khách hàng, 
-- họ và tên, email, số điện thoại
select makh, concat(hovatenlot,' ', ten) as 'Ho va ten', email, dienthoai
from khachhang ;
-- Hiển thị danh sách khách hàng có tên bắt đầu bằng chữ ‘H’ trong đó cột ‘Họ
-- và Tên’ ghép từ 2 cột HoVaTenLot và Ten
select concat(hovatenlot,' ', ten) as 'Ho va ten' 
from khachhang 
where ten like 'H%';
-- Hiển thị thông tin các cột của bảng khách hàng có địa chỉ ở quận 1 hoặc quận 3
select * 
from khachhang
where diachi like 'Quận 1' or diachi like 'Quận 3';
-- Hiển thị thông tin các sản phẩm có số lượng trong khoảng từ 20 đến 30
select * 
from sanpham
where soluong >= 20 and soluong <= 30;
-- Hiển thị tất cả các hóa đơn của nhân viên có mã là ‘NV002’
select *
from hoadon
where manv like 'NV002';
-- Hiển thị mã hóa đơn, mã khách hàng, tổng tiền của các hóa đơn có tổng tiền > 20000000
select mahd,makh,tongtien
from hoadon
where tongtien > 20000000;
-- Bài tập 02: Dựa trên cơ sở dữ liệu cho sẵn, hãy thực hiện các câu truy vấn sau
-- Hiển thị sản phẩm có giá cao nhất
select masp, tensp, max(giasp) as 'gia Max'
from sanpham
group by masp,tensp
having max(giasp) >= all(
						select max(giasp)
						from sanpham
						group by masp,tensp
                        );
-- Hiển thị sản phẩm có giá thấp nhất
select masp, tensp, min(giasp) as 'gia Min'
from sanpham
group by masp,tensp
having min(giasp) <= all(
						select min(giasp)
						from sanpham
						group by masp,tensp
                        );
-- Hiển thị tổng số lượng sản phẩm trong bảng sản phẩm
select sum(soluong) as 'Tong so luong'
from sanpham;
-- Hiển thị tất cả thông tin hóa đơn và sắp xếp theo thứ tự giá giảm dần
select *
 from hoadon
 order by TongTien desc;
-- Hiển thị tất cả thông tin các sản phẩm theo giá tăng dần
select *
from sanpham
order by giasp asc;
-- Hiển thị tổng tiền của các hóa đơn và nhóm theo mã nhân viên
select manv, sum(tongtien) as 'Tong tien'
from hoadon
group by manv;
-- Hiển thị tổng tiển của các hóa đơn và nhóm theo mã khách hàng, chỉ lấy các
-- khách hàng có tổng tiền >50000000
select makh, sum(tongtien) as 'Tong tien'
from hoadon
group by makh
having sum(tongtien) >50000000;


-- select masp, tensp, max(giasp)
-- from sanpham
-- group by  masp, tensp
-- having max(giasp) >= all(select max(giasp)
-- from sanpham
-- group by  masp, tensp)




