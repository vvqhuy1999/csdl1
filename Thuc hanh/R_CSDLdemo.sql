create database quanlyduan
use quanlyduan
drop database quanlyduan
CREATE TABLE PHONGBAN
(
  mapb varchar(10) NOT NULL,
  tenpb varchar(100),
  PRIMARY KEY (mapb)
);

CREATE TABLE NHANVIEN
(
  manv varchar (10) NOT NULL,
  HOTENLOT VARCHAR(20),
  TEN VARCHAR(20),
  noisinh VARCHAR(100),
  gioitinh VARCHAR(10),
  dienthoai VARCHAR(10),
  luong DECIMAL,
  mapb varchar(10) NOT NULL,
  PRIMARY KEY (manv),
  FOREIGN KEY (mapb) REFERENCES PHONGBAN(mapb)
);
CREATE TABLE TRUONGPHONG
(
	MANV varchar(10) NOT NULL,
    MAPB varchar(10) NOT NULL,
    PRIMARY KEY(MANV,MAPB),
    FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV),
    FOREIGN KEY(MAPB)REFERENCES PHONGBAN(MAPB)
)
drop table truongphong
CREATE TABLE DUAN
(
  mada varchar(10) NOT NULL,
  tenda VARCHAR (20),
  mapb varchar(10)NOT NULL,
  NGAYBD DATE,
  NGAYKT DATE,
  PRIMARY KEY (mada),
  FOREIGN KEY (mapb) REFERENCES PHONGBAN(mapb)
);

CREATE TABLE quanlyduan
(
  mada varchar(10) NOT NULL,
  manv varchar(10) NOT NULL,
  NGAYTHAMGIA DATE,
  NGAYKT DATE,
  PRIMARY KEY (mada, manv),
  FOREIGN KEY (mada) REFERENCES DUAN(mada),
  FOREIGN KEY (manv) REFERENCES NHANVIEN(manv)
);
-- NHAP DU LIEU
select*from phongban
insert into phongban(mapb,tenpb)value
('pb01','cty bds hung thinh'),
('pb02','cty bds pham gia'),
('pb03','cty bds wincom'),
('pb04','cty bds diep phu gia'),
('pb05','cty bds winfat'),
('pb06','cty bds hung hoa'),
('pb07','cty bds pham gia'),
('pb08','cty bds hung '),
('pb09','cty bds land'),
('pb10','cty bds ide');
select *from nhanvien
insert into nhanvien(manv,hotenlot,ten,noisinh,gioitinh,dienthoai,luong,mapb)value
('nv01','tran thi','hoa','quan 1','nu','098765439',18000000,'pb01'),
('nv02','nguyen thi','ly','quan 3','nu','098765439',10000000,'pb01'),
('nv03','tran ngoc','hoa','quan 1','nu','098765439',15000000,'pb02'),
('nv04','tran ngoc','ha','quan 5','nam','098765439',8000000,'pb04'),
('nv05','huynh van','thi','quan 1','nam','098765439',20000000,'pb03'),
('nv06','le thi','hoa','quan 5','nu','098765439',18000000,'pb05'),
('nv07','ho thi','my','quan 3','nu','098765439',18000000,'pb07'),
('nv08','tran thi','manh','quan 1','nu','098765439',18000000,'pb03'),
('nv09','tran ngoc','nam','quan 1','nam','098765439',18000000,'pb05'),
('nv10','tran thi','hoa','quan 5','nu','098765439',18000000,'pb10');
select*from duan
insert into duan(mada,tenda,mapb,ngaybd,ngaykt)value
('da01','xay dung','pb01','2022/10/10','2023/1/1'),
('da02','san xuat','pb01','2000/1/10','2023/3/10'),
('da03','xay dung','pb02','2021/7/10','2023/5/12'),
('da04','thiet ke','pb03','2021/8/10','2023/1/1'),
('da05','lap rap','pb03','2022/10/10','2023/1/9'),
('da06','cau cong','pb06','2023/8/10','2023/1/5'),
('da07','nha o','pb07','2022/7/10','2023/1/12'),
('da08','xay dung','pb05','2000/10/10','2023/5/12'),
('da09','san xuat','pb08','2022/7/10','2023/3/12'),
('da10','xay dung','pb10','2022/10/10','2023/1/12');
select*from truongphong
insert into truongphong(manv,mapb)value
('nv01','pb01'),
('nv02','pb02'),
('nv03','pb03'),
('nv04','pb04'),
('nv05','pb05'),
('nv06','pb06'),
('nv07','pb07'),
('nv08','pb08'),
('nv09','pb09'),
('nv10','pb10');
select*from quanlyduan
insert into quanlyduan(mada,manv,ngaythamgia,ngaykt)value
('da01','nv01','2022/10/10','2023/1/12'),
('da02','nv02','2022/1/3','2023/4/12'),
('da03','nv03','2021/4/10','2023/4/10'),
('da04','nv04','2022/4/10','2023/5/1'),
('da05','nv05','2022/1/10','2023/5/2'),
('da06','nv06','2022/1/10','2023/1/12'),
('da07','nv07','2022/3/10','2023/7/10'),
('da08','nv08','2022/4/10','2023/7/11'),
('da09','nv09','2022/10/10','2023/6/12'),
('da10','nv10','2021/10/10','2023/1/1');
-- hien thi cac thong tin nhan vien trong nhan vien
select *
from nhanvien
-- Viết câu truy vấn hiển thị thông tin các cột:ma du an, tên dự án, ngày bắt đầu và ngày kết thúc dự ántrong bảng DU_AN
select mada,tenda,ngaybd,ngaykt
from duan
-- hien thi tac ca thong tin cua bang nhanvien co noi sinh quan 1
select*
from nhanvien
where noisinh="quan 1"
-- hien thi manv, hotenlot, ten thanh cot hovaten cua bang nhan vien
select manv,concat(hotenlot," ",ten) as hovaten 
from nhanvien
-- Hiển thị họ va tên nhân viên có lương trên 15000000
select concat(hotenlot," ",ten)as hovaten
from nhanvien
where luong>15000000
-- Hiển thị thông tin của nhân viên lấy ra 5 hàng đầu tiên trong bảng nhân viên
select*
from nhanvien
limit 5
-- hien thị thông tin có tên nhân viên bắt đầu chữ H
select*
from nhanvien
where ten like "h%"
-- Hiển thị manv,họ va tên nhân viên có lương nằm trong khoảng 10.000.000 đến 18.000.000
select manv,concat(hotenlot," ",ten)as "ho va ten",luong
from nhanvien
where luong>1000000 and luong<18000000
-- Hiển thị thông tin của các phòng ban có chứa chuỗi ‘wincom’
select*
from phongban
where tenpb like "%wincom"
-- Hiển thị thông tin họ va tên, lương của nhân viên có lương thấp hơn 18000000 và mã phòng ban là ‘PB02’
select concat(hotenlot," ",ten)as "ho va ten",luong
from nhanvien
where mapb="pb02"
-- Hiển thị danh sách các nhân viên,theo thứ tự tăng dần của trường TEN_NV
select*
from nhanvien
order by ten asc
-- Hiển thị tên dự án, ngày bắt đầu, ngày kết thúc,theo thứ giảm dần của trường ngày kết thúc
select tenda,ngaybd,ngaykt
from duan
order by ngaykt desc
-- Hiển thị mức lương trung bình của các nhân viên thuộc mã phòng ‘PB01 ’
select avg(luong)
from nhanvien
where mapb="pb01"
-- Hiển thị số lượng dự án có ngày kết thúc trước ngày 12/1/2023.
select count(mada)
from duan
where ngaykt="2023/1/12"
-- Tính lương trung bình của từng Phòng Ban
select mapb,avg(luong)
from nhanvien
group by mapb
-- Đếm số lượng nhân viên của từng Phòng
select mapb,count(manv)
from nhanvien
group by mapb
-- Tính tổng lương công ty phải trả cho mỗi phòng ban, chỉ hiển thị nhóm nào có tổng >18000000
select mapb,sum(luong)
from nhanvien
group by mapb
having sum(luong)>18000000
-- thong ke so luong nhanvien theo gioi tinh
select gioitinh,count(manv)
from nhanvien
group by gioitinh
TRUY VAN 2 BANG
-- Thực hiện truy vấn để hiển thị dữ liệu bảng nhan_vien,  và phong_ban gồm: id_nhanvien, ten_nv, ma_pb, ten_pb
select manv,ten,pb.mapb,tenpb
from nhanvien nv,phongban pb
where nv.mapb=pb.mapb
-- Thực hiện truy vấn để hiển thị dữ liệu gồm: ma_duan, ten_duan, ho_nv, ten_nv, ngay_tham_gia, ngay_ket_thuc
select da.mada,tenda,hotenlot, ten, ngaybd,da.ngaykt
from nhanvien nv inner join quanlyduan ql on nv.manv=ql.manv inner join duan da on ql.mada=da.mada
-- hiển thị thông tin gồm: họ và tên nhân viên, lương, tên phòng ban mà nhân viên thuộc về, tên dự án, ngày bắt đầu tham gia vào dự án.
select nv.manv,concat(hotenlot," ",ten)as "ho va ten",luong,tenpb,tenda,ngaybd,da.ngaykt
from phongban pb inner join nhanvien nv on nv.mapb=pb.mapb inner join quanlyduan ql on nv.manv=ql.manv inner join duan da on ql.mada=da.mada
-- Viết câu truy vấn hiển thị các thông tin bao gồm họ, tên, lương của nhân viên, tên dự án với điều kiện nhân viên thuộc phòng ban có tên ‘land’, tham gia vào các dự án có ngày  bắt đầu ‘1/1/2023’
select tenda,concat(hotenlot," ",ten)as "ho va ten",luong,tenpb,ngaybd
from phongban pb inner join nhanvien nv on nv.mapb=pb.mapb inner join quanlyduan ql on nv.manv=ql.manv inner join duan da on ql.mada=da.mada
where tenpb like "%winfat" and ngaybd = "2023/8/10"
-- Viết câu truy vấn hiển thị thông tin bao gồm: Mã, họ, tên nhân viên, và tên phòng ban mà nhân viên trực thuộc. Nếu nhân viên chưa được phân bổ vào phòng nào thì cột tên phòng để trống
select manv, concat(hotenlot," ",ten)as "ho va ten",tenpb,
-- Sử dụng câu truy vấn con để hiển thị thông tin các nhân viên có lương lớn hơn mức lương trung bình toàn công ty
select*
from nhanvien
where luong>(select avg(luong) from nhanvien)
-- Hiển thị danh sách nhân viên có lương lớn hơn lương thấp nhấp của phòng ‘PB002’ 
select*
from nhanvien
where luong>(select min(luong)from nhanvien where mapb="pb02")
LAB6
-- Hiển thị danh sách nhân viên có lương lớn hơn lương của tất cả các nhân viên phòng ‘PB002’ 
select *
from nhanvien
where luong>all(select luong from nhanvien where mapb="pb02")
-- Hiển thị danh sách các phòng ban chưa có nhân viên.
select *
from phongban
where mapb not in (select mapb from nhanvien)
-- Hiển thị danh sách các nhanvien không tham gia dự án.
select*
from nhanvien
where manv not in(select manv from quanlyduan)
-- Viết câu truy vấn để hiển thị thông tin gồm mã nhân viên, họ tên, lương của nhân viên đã tham gia nhiều hơn 5 dự án
select nv.manv,hotenlot,ten,luong
from nhanvien nv inner join quanlyduan ql on nv.manv=ql.manv
group by nv.manv
having count(mada)>=0
-- Cho biết lương cao nhất của mỗi phòngban, chỉ hiển thị các phòng có luong cao nhất>18000000
select pb.mapb, max(luong)
from nhanvien nv inner join phongban pb on nv.mapb=pb.mapb
group by pb.mapb
having max(luong)>18000000
-- Viết câu truy vấn hiển thị thông tin bao gồm: Mã, họ, tên nhân viên, và tên phòng ban mà nhân viên trực thuộc. Nếu phong ban chưa được phân bổ nhân viên  nào thì cột thông tin nhân viên để trống
-- Hiển thị thông tin của nhân viên có lương cao nhất
select manv,concat(hotenlot," ",ten)as "ho va ten",luong
from nhanvien
group by manv
order by luong desc
limit 1
-- cho biet phong ban co so luong nhan vien nhieu nhat
select mapb,count(manv)
from nhanvien
group by mapb
having count(manv)>=all(select count(manv)
						from nhanvien
						group by mapb)
-- hien thi danh sach cac phong ban ko tham gia du an
select*
from phongban
where mapb not in (select mapb from duan)
LAB 7
-- Viết câu lệnh tạo 1 bảng mới có tên NHAN_VIEN_test, sao chép toàn bộ dữ liệu từ bảng NHAN_VIEN qua bảng mới
create table nhanvien_moi
select*
from nhanvien
-- Viết câu lệnh tạo ra 1 bảng mới có tên DUAN_2016 lấy dữ liệu từ bảng DUAN có ngày bắt đầu và ngày kết thúc trong năm 2016

-- Thêm một hàng mới vào bảng phong_ban không liệt kê danh sách các cột

-- Thêm nhiều hàng mới vào bảng phong_ban
-- Thêm vào cuối bảng nhan_vien_test toàn bộ nhân viên của bảng nhan_vien

-- Viết câu lệnh nhập dữ liệu vào cho các bảng NHAN_VIEN, DU_AN, QUANLY_DUAN
-- Đổi tên thành ‘Công nghệ 1’ cho phòng ban có mã là ‘PB01’

-- Viết câu lệnh cập nhật lương tăng lên 10% cho các nhân viên thuộc phòng ban ‘cong nghe 1’

-- Cập nhật lại lương cho các nhân viên có tham gia vào dự án có mã ‘DA01’ tăng thêm 1000000

-- Cập nhật lại cột mã trưởng phòng cho Phòng ban có tên “San xuat 2” với giá trị mới là mã nhân viên có tên “Le Hoang
-- xoa phongban =pb12
