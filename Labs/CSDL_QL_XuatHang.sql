create database ql_xuathang;

use ql_xuathang;

create table Loai(
	maloai varchar(5),
    tenloai nvarchar(255),
    primary key (maloai)
);

alter table Loai
modify column maloai varchar(10);

create table CuaHang(
	mach varchar(10),
    tench nvarchar(255),
    diachi nvarchar(255),
    dienthoai varchar(15),
    email varchar(100),
    primary key (mach)
);

create table MatHang(
	mamh varchar(10),
    tenmh nvarchar(255),
    dvt varchar(10),
    gia double,
    maloai varchar(10),
    primary key (mamh),
    constraint FK_MH_L foreign key (maloai) references loai(maloai)
);

create table phieuxuat(
	mapx varchar(10),
    ngaylap date,
    ngayxuat date,
    mach varchar(10),
    primary key (mapx),
    constraint FK_PX_CH foreign key (mach) references CuaHang(mach)
);

create table chitietpx(
	mamh varchar(10),
    mapx varchar(10),
    soluong int,
    ghichu nvarchar(255),
    primary key (mapx,mamh),
    constraint FK_CTPX_MH foreign key (mamh) references MatHang(mamh),
    constraint FK_CTPX_PX foreign key (mapx) references phieuxuat(mapx)
);


-- nhap du lieu

insert into loai(maloai,tenloai)value
('l01','Thời trang Nam công sở'),
('l02','Thời trang Nữ công sở'),
('l03','Đồng phục học sinh'),
('l04','Thời trang Trẻ em'),
('l05','Thời trang trung niên'),
('l06','Phụ kiện thời trang');

-- select * from loai;

-- select * from cuahang;

insert into cuahang(mach,tench,diachi,dienthoai,email)value
	('ch01','Vân Thanh Fashion - Chi nhánh Quận 5','quan 5','0909099099','thanhtt@gmail.com'),
    ('ch02', 'Vân Thanh Fashion - TTTM AERON TÂN PHÚ', 'Quận Tân Phú', '0909099099', 'areontp@gmail.com'),
	('ch03', 'Vân Thanh Fashion – Chi nhánh Quận 3',' Quận 5','0862887733','huongnk@gmail.com'),
	('ch04', 'Vân Thanh Fashion - Chi nhánh Vũng Tàu',' Quận 5', '0909099099', 'thanhdt@gmail.com'),
	('ch05', 'Vân Thanh Fashion – Chi nhánh Hà Nội',' Quận 2','0909099099',null),
	('ch06', 'Vân Thanh Fashion – Chi nhánh Hà Nội', 'Quận 2','0909099099',null);
 
 -- Chua run can test.
-- insert into cuahang(mach,tench,diachi,dienthoai,email)value('06', 'Vân Thanh Fashion – Chi nhánh Hà Nội', 'Quận 2','0909099099',null);

-- select * from mathang;
insert into mathang(mamh,tenmh,dvt,gia,maloai)value
('01','Áo khoát Kaki nữ hàn Quốc', 'Cái',285000,'l01'),
('02','Áo khoát nữ dáng dài','cái',675000,'l02'),
('03','Áo sơ mi nam','Cái',315000,'l03'),
('04','Sơ mi ngắn tay cổ trụ','Cái',285088,'l04'),
('05','Đầm caro công sở', 'Cái',252000,'l05'),
('06','Đồng phục học sinh','Bộ',180000,'l06');

-- select * from phieuxuat;
insert into phieuxuat (mapx, ngaylap, ngayxuat, mach)value
('01', '2021-07-06', '2021-07-12', 'ch01'),
('02', '2021-07-12', '2021-07-20', 'ch01'),
('03', '2021-08-04', '2021-08-20', 'ch02'),
('04', '2021-08-09', '2021-08-20', 'ch04'),
('05', '2021-08-22', '2021-09-20', 'ch05'),
('06', '2021-09-06', '2021-09-20', 'ch06');
-- select * from chitietpx;
insert into chitietpx(mamh,mapx,soluong,ghichu)value
('01','01',20,'Đủ size'),
('02','02',20,null),
('03','03',30,''),
('04','04',10,'Nhiều màu'),
('05','05',100,'Áo + Váy'),
('06','06',30,null);

-- Truy vấn
-- 1. Hiển thị tất cả mặt hàng. Danh sách sắp xếp theo đơn giá tăng dần
select * from mathang order by gia asc;

-- 2. Hiển thị tất cả các mặt hàng thuộc loại hàng “Thời trang”. Thông tin gồm: mã mặt hàng,
-- tên mặt hàng, đơn vị tính, đơn giá, tên loại hàng.
select mh.mamh, mh.tenmh,mh.dvt, mh.gia,l.tenloai from mathang mh
join loai l on mh.maloai = l.maloai
where l.tenloai like 'Thời trang %';

-- 3. Thống kê số mặt hàng theo loại hàng, thông tin gồm: mã loại hàng, tên loại hàng, tổng
-- số mặt hàng. Danh sách sắp xếp theo tổng số mặt hàng giảm dần.
select l.maloai, l.tenloai, count(mamh)
from loai l join mathang mh on l.maloai = mh.maloai
group by l.maloai, l.tenloai;

-- 4. Liệt kê số phiếu xuất, ngày xuất hàng, mã cửa hàng, tên mặt hàng, số lượng, đơn giá, thành tiền.
select px.mapx, ngayxuat,  (soluong*gia) as 'Thanh tien'
from phieuxuat px, mathang mh, chitietpx ct
where mh.mamh = ct.mamh
and px.mapx = ct.mapx;

-- 5. Thống kế tổng số lần xuất hàng theo từng tháng trong năm 2021, thông tin gồm: tháng/năm, số lần xuất hàng
select  month(ngayxuat), count(mapx) as 'So lan xuat'
from phieuxuat
where year(ngayxuat) = 2021
group by month(ngayxuat);

-- 6. Liệt kê 5 mặt hàng có số lượng xuất kho nhiều nhất.
select mh.mamh,tenmh,sum(soluong)
from mathang mh join chitietpx ct on mh.mamh = ct.mamh
group by mh.mamh, tenmh
order by sum(soluong) desc
limit 5;

-- 7. Thống kê số hàng nhập về cửa hàng “Chi nhánh quận 5”, thông tin hiển thị: Tên cửa hàng, số lần nhập hàng.
select tench, sum(soluong)
from cuahang ch 
join phieuxuat px on ch.mach = px.mach
join chitietpx ct on px.mapx = ct.mapx
where ch.tench like '%Chi nhanh Quận 5'
group by tench;

-- 8. Thống kê tổng tiền hàng xuất kho theo ngày, thông tin hiển thị: Ngày xuất hàng, tổng thành tiền.
select day(ngayxuat), sum(soluong*gia) as 'Tong thanh tien'
from mathang mh
join chitietpx ct on mh.mamh = ct.mamh
join phieuxuat px on px.mapx = ct.mapx
group by day(ngayxuat);

-- 9. Cập nhật ngày xuất hàng là ngày hiện hành cho các phiếu xuất chưa có ngày xuất
update phieuxuat 
set ngayxuat = curdate()
where ngayxuat is null;

-- 10. Cập nhật đơn giá của “Đồng phục học sinh” giảm 10% trên đơn giá hiện tại.
update mathang
set gia = gia * 0.9
where tenmh like 'dong phuc hoc sinh';

-- 11. Thực hiện xóa các cửa hàng chưa có thông tin xuất hàng.
delete from cuahang
where mach not in(select mach from phieuxuat);
-- 12. Liệt kê danh sách các mặt hàng có số lượng xuất hàng thấp nhất: Mã hàng, tên hàng, tổng số lượng xuất.
select * from mathang;
select * from chitietpx;

select mh.mamh, mh.tenmh, sum(soluong)
from  mathang mh join chitietpx ct on  mh.mamh = ct.mamh
group by mh.mamh, mh.tenmh
having sum(soluong) <= (select min(ailas.sl)
from( select sum(soluong) sl
from  mathang mh join chitietpx ct on  mh.mamh = ct.mamh
group by mh.mamh, mh.tenmh
order by sum(soluong) asc)ailas
);

-- 13 Liệt kê những mặt hàng chưa từng xuất cho các cửa hàng, thông tin gồm: Mã mặt hàng, tên mặt hàng, tên loại hàng
select * from mathang;
select * from loai;

select mh.mamh, mh.tenmh, l.tenloai
from mathang mh join loai l on mh.maloai = l.maloai
join chitietpx ct on ct.mamh = mh.mamh
where  mh.mamh not in (select mamh from chitietpx)


















