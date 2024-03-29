create database QuanLyBenhNhan;
use QuanLyBenhNhan;
-- drop database QuanLyBenhNhan;
CREATE TABLE BenhNhan
(
  MaBN INT NOT NULL,
  HoTen NVARCHAR(100),
  DiaChi NVARCHAR(100),
  SDT NVARCHAR(15),
  SoBHYT NVARCHAR(50) ,
  PRIMARY KEY (MaBN)
);

CREATE TABLE PhongBenh
(
  MaPhongBenh NVARCHAR(100) NOT NULL,
  TenPhongBenh NVARCHAR(100),
  PRIMARY KEY (MaPhongBenh)
);

CREATE TABLE DanhMucThuoc
(
  MaDMT NVARCHAR(50) NOT NULL,
  TenThuoc NVARCHAR(100) ,
  GiaTien NVARCHAR(100) ,
  LoaiThuoc NVARCHAR(100),
  PRIMARY KEY (MaDMT)
);

CREATE TABLE Khoa
(
  MaKhoa NVARCHAR(50) NOT NULL,
  TenKhoa NVARCHAR(100),
  TruongKhoaMaKhoa nvarchar(50),
  PRIMARY KEY (MaKhoa)
);

CREATE TABLE HoaDon
(
  MaHD NVARCHAR(50) NOT NULL,
  TenHD NVARCHAR(100),
  TongTien INT,
  MaBN NVARCHAR(100),
  MaBenhAn NVARCHAR(50),
  PRIMARY KEY (MaHD)
);

CREATE TABLE ThanNhan
(
  TenTN NVARCHAR(50) NOT NULL,
  SDT NVARCHAR(15) ,
  CCCD NVARCHAR(15) ,
  MaBN INT,
  PRIMARY KEY (TenTN)
);


CREATE TABLE DieuDuong
(
  MaDD NVARCHAR(50) NOT NULL,
  HoTen NVARCHAR(50),
  SDT NVARCHAR(15) ,
  MaKhoa NVARCHAR(50),
  PRIMARY KEY (MaDD)
  
);


CREATE TABLE BacSi
(
  MaBS NVARCHAR(50) not null,
  HoTen NVARCHAR(50) NOT NULL,
  MaKhoa NVARCHAR(50),
  SDT NVARCHAR(15),
  PRIMARY KEY (MaBS)
  
);


CREATE TABLE BenhAn
(
  MaBenhAn NVARCHAR(50) NOT NULL,
  NuocTieu NVARCHAR(50),
  Mau NVARCHAR(50), 
  XQuang NVARCHAR(50),
  SieuAm NVARCHAR(50),
  MaBN INT,
  MaPhongBenh NVARCHAR(100),
  MaDD NVARCHAR(50),
  LoaiBenhNhan nvarchar(50),
  PRIMARY KEY (MaBenhAn)
);

CREATE TABLE ToaThuoc
(
  MaTT NVARCHAR(50) NOT NULL,
  TenTT NVARCHAR(50),
  SoLuong int,
  LoaiThuoc NVARCHAR(50),
  MaBenhAn NVARCHAR(50),
  PRIMARY KEY (MaTT)
  
);


CREATE TABLE Kham
(
  MaBS NVARCHAR(50) ,
  MaBenhAn NVARCHAR(50),
  NgayBD date,
  NgayKT date,
  PRIMARY KEY (MaBS, MaBenhAn)
);


CREATE TABLE ChiTietToaThuoc
(
  MaDMT NVARCHAR(50) NOT NULL,
  MaTT NVARCHAR(50),
  NgayXuat date,
  SoLuongXuat int,
  PRIMARY KEY (MaDMT, MaTT)
);


CREATE TABLE DanhMucBenh
(
  TrieuChung NVARCHAR(50),
  Tenbenh NVARCHAR(50),
  MaBenh NVARCHAR(50),
  MaBenhAn NVARCHAR(50),
  PRIMARY KEY (MaBenh)
  
);


INSERT INTO Kham (MaBS, MaBenhAn, NgayBD, NgayKT)
VALUES 
('BS01', 'BENHAN01', '2024-03-23', '2024-03-24'),
('BS02', 'BENHAN02', '2024-03-24', '2024-03-25'),
('BS03', 'BENHAN03', '2024-03-25', '2024-03-26'),
('BS04', 'BENHAN04', '2024-03-26', '2024-03-27'),
('BS05', 'BENHAN05', '2024-03-27', '2024-03-28'),
('BS01', 'BENHAN06', '2024-03-28', '2024-03-29'),
('BS02', 'BENHAN07', '2024-03-29', '2024-03-30'),
('BS03', 'BENHAN08', '2024-03-30', '2024-03-31'),
('BS04', 'BENHAN09', '2024-03-31', '2024-04-01'),
('BS05', 'BENHAN10', '2024-04-01', '2024-04-02');


 INSERT INTO ChiTietToaThuoc (MaDMT, MaTT, NgayXuat, SoLuongXuat)
VALUES 
('A11', 'TT05', '2024-03-23', 10),
('A22', 'TT06', '2024-03-24', 20),
('A33', 'TT07', '2024-03-25', 30),
('A44', 'TT08', '2024-03-26', 40),
('A55', 'TT09', '2024-03-27', 50);


INSERT INTO HoaDon (MaHD, TenHD, TongTien, MaBN,MaBenhAn)
VALUES 
  ('HD01', N'Hóa đơn 01', 5000000, 'BN01','BENHAN01'), 
  ('HD02', N'Hóa đơn 02', 3000000, 'BN02','BENHAN02'), 
  ('HD03', N'Hóa đơn 03', 7000000, 'BN03','BENHAN03'),
  ('HD04', N'Hóa đơn 04', 2000000, 'BN04','BENHAN04'),
  ('HD05', N'Hóa đơn 05', 1000000, 'BN05','BENHAN05'),
	('HD06',N'Hóa đơn 06', 2500000, 'BN06','BENHAN06'), 
  ('HD07', N'Hóa đơn 07', 3500000, 'BN07','BENHAN07'), 
  ('HD08', N'Hóa đơn 08', 4500000, 'BN08','BENHAN08'),
  ('HD09', N'Hóa đơn 09', 5500000, 'BN09','BENHAN09'),
  ('HD10', N'Hóa đơn 10', 6500000, 'BN10','BENHAN10');
  
  
insert into BenhNhan(MaBN, HoTen, DiaChi, SDT, SoBHYT) values
('01', 'Nguyen Thanh Son', 'Binh Duong', '0123456789','AS123'),
('02', 'Dang Diep Minh', 'Binh Thuan', '0987654321','AS124'),
('03', 'Nguyen Thanh Phuong', 'Dong Thap', '01593572468','AS125'),
('04', 'Vo Van Quang Huy', 'Hue', '09517538642','AS126'),
('05', 'Lam Chi Khanh', 'Thanh Pho Ho Chi Minh', '0147258369','AS127');

insert into PhongBenh (MaPhongBenh, TenPhongBenh) values
('A001',N'Phòng cấp cứu'),
('A002',N'Phòng hồi sức'),
('A003',N'Phòng phẫu thuật'),
('A004',N'Phòng khám nội'),
('A005',N'Phòng phòng khám ngoại');

insert into DanhMucThuoc(MaDMT,TenThuoc,GiaTien,LoaiThuoc) values
('A11',N'Nhóm Thuốc Cephalexin','100000',N'Thuốc kháng sinh Cephalosporin'), -- viêm, nhiễm trùng
('A22',N'Nhóm Thuốc lợi tiểu','150000',N'Thuốc điều trị huyết áp cao Indapamide'), -- trị huyết áp cao
('A33',N'Nhóm Thuốc Acetaminophen','200000',N'Thuốc giảm đau Panadol'), -- trị đau đầu
('A44',N'Nhóm Thuốc Antacid ','250000',N'Thuốc trị đau dạ dày Maalox'),
('A55',N'Nhóm Thuốc Bình Thần','300000',N'Thuốc trị mất ngủ Rotunda');

insert into Khoa(MaKhoa,TenKhoa,TruongKhoaMaKhoa) values
('KN01',N'Khoa Nội','BS01'),
('KN02', N'Khoa Ngoại' ,'BS02'),
('KN03', N'Khoa Cấp Cứu','BS03' ),
('KN04', N'Khoa Hồi Sức' ,'BS04'),
('KN05', N'Khoa Tim Mạch','BS05' );

insert into ThanNhan (TenTN, SDT, CCCD, MaBN) values
(N'Nguyễn Văn Hai','0123456789', '074204008945','01'),
(N'Nguyễn Thị Ba','0987654321', '074202008974','02'),
(N'Nguyễn Văn Bốn','0147258369', '074201004145','03'),
(N'Nguyễn Ngũ Năm','0963258741', '074200008995','04'),
(N'Nguyễn Lục Sáu','0564879231', '074298008966','05');

insert into DieuDuong (MaDD, HoTen, SDT, MaKhoa) values
('DD01',N'Trần Thị Oanh','0258741369','KN01'),
('DD02',N'Trần Văn Mộng','0147852369','KN02'),
('DD03',N'Nguyễn Hà Bá','0456789132','KN03'),
('DD04',N'Bành Văn Chướng','0758964203','KN04'),
('DD05',N'Vĩnh Thái Nguyên','0156879432','KN05');

insert into BacSi (MaBS, HoTen, MaKhoa, SDT) values 
('BS01',N'Ngô Văn Khánh,','KN01','0147896523'),
('BS02',N'Ngô Văn Hoàng,','KN02','0859675498'),
('BS03',N'Kiều Đại Nghĩa,','KN03','0874123568'),
('BS04',N'Trần Văn Anh,','KN04','0258746935'),
('BS05',N'Thái Thị Thơ,','KN05','0789532647');


insert into BenhAn (MaBenhAn, NuocTieu, Mau, XQuang, SieuAm, MaBN, MaPhongBenh, MaDD, LoaiBenhnhan) values 
('BENHAN06','','','','',1,'A001','DD01','Noi tru'),
('BENHAN07','','','','',2,'A002','DD02','Noi tru'),
('BENHAN08','','','','',3,'A003','DD03','Ngoai tru'),
('BENHAN09','','','','',4,'A004','DD04','Noi tru'),
('BENHAN10','','','','',5,'A005','DD05','Ngoai tru');
insert into BenhAn (MaBenhAn, NuocTieu, Mau, XQuang, SieuAm, MaBN, MaPhongBenh, MaDD,LoaiBenhnhan) values
('BENHAN01','','','','',1,'A001','DD01',null),
('BENHAN02','','','','',2,'A002','DD02',null),
('BENHAN03','','','','',3,'A003','DD03',null),
('BENHAN04','','','','',4,'A004','DD04',null),
('BENHAN05','','','','',5,'A005','DD05',null);

insert into ToaThuoc (MaTT, TenTT, SoLuong, LoaiThuoc, MaBenhAn) values 
('TT05',N'Thuốc Cephalexin',500,N'Thuốc kháng sinh Cephalosporin','BENHAN01'),
('TT06',N'Nhóm Thuốc lợi tiểu',600,N'Thuốc điều trị huyết áp cao Indapamide','BENHAN02'),
('TT07',N'Nhóm Thuốc Acetaminophen',700,N'Thuốc giảm đau Panadol','BENHAN03'),
('TT08',N'Nhóm Thuốc Antacid',800,N'Thuốc trị đau dạ dày Maalox','BENHAN04'),
('TT09',N'Nhóm Thuốc Bình Thần',900,N'Thuốc trị mất ngủ Rotunda','BENHAN05');


insert into DanhMucBenh (TrieuChung, TenBenh, MaBenh, MaBenhAn) values
(N'Ngứa ngáy khó chịu',N'Viêm Da','VD1','BENHAN01'),
(N'Khó thở',N'Cao Huyết Áp','CHA2','BENHAN02'),
(N'Mệt mỏi, nhức đầu',N'Đau đầu','DD3','BENHAN03'),
(N'Đau bụng không hết',N'Đau dạ dày','DDD4','BENHAN04'),
(N'ngủ không sâu giấc',N'Mất ngủ cấp tính','MNCT5','BENHAN05');

alter table ThanNhan -- row 46
add constraint FK_TN_BN FOREIGN KEY (MaBN) REFERENCES BenhNhan(MaBN);

alter table DieuDuong -- row 56
add constraint DK_DD_K FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa);

alter table BacSi -- row 67
add constraint FK_BS_K FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa);

alter table khoa -- row 67  -- sai 
add constraint FK_k_bs_TK  FOREIGN KEY (TruongKhoaMaKhoa) REFERENCES bacsi(MaBS);

alter table BenhAn -- row 79
add constraint FK_BA_BN FOREIGN KEY (MaBN) REFERENCES BenhNhan(MaBN);
alter table BenhAn
add constraint FK_BA_PB  FOREIGN KEY (MaPhongBenh) REFERENCES PhongBenh(MaPhongBenh);
alter table BenhAn
add constraint FK_BA_DD FOREIGN KEY (MaDD) REFERENCES DieuDuong(MaDD);

alter table ToaThuoc --  93
add constraint FK_TT_BA FOREIGN KEY (MaBenhAn) REFERENCES BenhAn(MaBenhAn);

alter table Kham -- 105
add constraint FK_K_MBA FOREIGN KEY (MaBenhAn) REFERENCES BenhAn(MaBenhAn);

 alter table Kham -- 105
add constraint FK_K_BS FOREIGN KEY (MaBS) REFERENCES BacSi(MaBS);

alter table ChiTietToaThuoc -- 115
add constraint FK_CTTT_DMT FOREIGN KEY (MaDMT) REFERENCES DanhMucThuoc(MaDMT);
alter table ChiTietToaThuoc 
add constraint FK_CTTT_TT  FOREIGN KEY (MaTT) REFERENCES ToaThuoc(MaTT);

alter table hoadon
add constraint FK_HH_BA FOREIGN KEY (MaBenhAn) REFERENCES BenhAn(MaBenhAn)

alter table DanhMucBenh -- 134
add constraint FK_DMB_BA FOREIGN KEY (MaBenhAn) REFERENCES BenhAn(MaBenhAn);


-- check 
alter table HoaDon
add constraint chk_TT check(tongtien >=0);

alter table ToaThuoc
add constraint chk_SL check(soluong >=0 or soluong <= 42);

/*
select * from ThanNhan;
select * from BenhNhan;
select * from ChiTietToaThuoc;
select * from DanhMucThuoc;

select * from phongbenh;
select * from benhan;
select * from toathuoc;

select * from kham;
select * from bacsi;
select * from khoa;
select * from dieuduong;
select * from danhmucbenh;
select * from hoadon;
*/
