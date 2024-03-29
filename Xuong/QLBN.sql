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
  TruongKhoaMaKhoa NVARCHAR(50),
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
  PRIMARY KEY (MaBenhAn)
);


CREATE TABLE ToaThuoc
(
  MaTT NVARCHAR(50) NOT NULL,
  TenTT NVARCHAR(50),
  SoLuong NVARCHAR(50),
  LoaiThuoc NVARCHAR(50),
  MaBenhAn NVARCHAR(50),
  PRIMARY KEY (MaTT)
  
);


CREATE TABLE Kham
(
  MaBS NVARCHAR(50) NOT NULL,
  MaBenhAn NVARCHAR(50) not null,
  PRIMARY KEY (MaBS, MaBenhAn)

  
);


CREATE TABLE Thuoc
(
  MaDMT NVARCHAR(50) NOT NULL,
  MaTT NVARCHAR(50),
  PRIMARY KEY (MaDMT, MaTT)
  
);


CREATE TABLE chi
(
  MaHD NVARCHAR(50) NOT NULL,
  MaBenhAn NVARCHAR(50),
  PRIMARY KEY (MaHD, MaBenhAn)
  
);

  

CREATE TABLE DanhMucBenh
(
  TrieuChung NVARCHAR(50),
  Tenbenh NVARCHAR(50),
  MaBenh NVARCHAR(50),
  MaBenhAn NVARCHAR(50),
  PRIMARY KEY (MaBenh)
  
);


SET FOREIGN_KEY_CHECKS=0;

insert into BenhNhan(MaBN, HoTen, DiaChi, SDT, SoBHYT) values
('01', 'Nguyen Thanh Son', 'Binh Duong', '0123456789','AS123'),
('02', 'Dang Diep Minh', 'Binh Thuan', '0987654321','AS124'),
('03', 'Nguyen Thanh Phuong', 'Dong Thap', '01593572468','AS125'),
('04', 'Vo Van Quang Huy', 'Hue', '09517538642','AS126'),
('05', 'Lam Chi Khanh', 'Thanh Pho Ho Chi Minh', '0147258369','AS127');

insert into PhongBenh (MaPhongBenh, TenPhongBenh) values
('A001','Phòng cấp cứu'),
('A002','Phòng hồi sức'),
('A003','Phòng phẫu thuật'),
('A004','Phòng khám nội'),
('A005','Phòng phòng khám ngoại');

insert into DanhMucThuoc(MaDMT,TenThuoc,GiaTien,LoaiThuoc) values
('A11','Nhóm Thuốc Cephalexin','100000','Thuốc kháng sinh Cephalosporin'), -- viêm, nhiễm trùng
('A22','Nhóm Thuốc lợi tiểu','150000','Thuốc điều trị huyết áp cao Indapamide'), -- trị huyết áp cao
('A33','Nhóm Thuốc Acetaminophen','200000','Thuốc giảm đau Panadol'), -- trị đau đầu
('A44','Nhóm Thuốc Antacid ','250000','Thuốc trị đau dạ dày Maalox'),
('A55','Nhóm Thuốc Bình Thần','300000','Thuốc trị mất ngủ Rotunda');

insert into Khoa(MaKhoa,TenKhoa,TruongKhoaMaKhoa) values
('KN01','Khoa Nội','TKN'),
('KN02', 'Khoa Ngoại' ,'TKNG'),
('KN03', 'Khoa Cấp Cứu','TKCC' ),
('KN04', 'Khoa Hồi Sức' ,'TKHS'),
('KN05', 'Khoa Tim Mạch','TKTM' );

insert into ThanNhan (TenTN, SDT, CCCD, MaBN) values
('Nguyễn Văn Hai','0123456789', '074204008945','01'),
('Nguyễn Thị Ba','0987654321', '074202008974','02'),
('Nguyễn Văn Bốn','0147258369', '074201004145','03'),
('Nguyễn Ngũ Năm','0963258741', '074200008995','04'),
('Nguyễn Lục Sáu','0564879231', '074298008966','05');

insert into DieuDuong (MaDD, HoTen, SDT, MaKhoa) values
('DD01','Trần Thị Oanh','0258741369','KN01'),
('DD02','Trần Văn Mộng','0147852369','KN02'),
('DD03','Nguyễn Hà Bá','0456789132','KN03'),
('DD04','Bành Văn Chướng','0758964203','KN04'),
('DD05','Vĩnh Thái Nguyên','0156879432','KN05');

insert into BacSi (MaBS, HoTen, MaKhoa, TruongKhoaMaKhoa, SDT) values 
('BS01','Ngô Văn Khánh,','KN01','TKN','0147896523'),
('BS02','Ngô Văn Hoàng,','KN02','TKNG','0859675498'),
('BS03','Kiều Đại Nghĩa,','KN03','TKCC','0874123568'),
('BS04','Trần Văn Anh,','KN04','TKHS','0258746935'),
('BS05','Thái Thị Thơ,','KN05','TKTM','0789532647');

insert into BenhAn (MaBenhAn, NuocTieu, Mau, XQuang, SieuAm, MaBN, MaPhongBenh, MaDD) values
('BENHAN01','','','','',1,'A001','DD01'),
('BENHAN02','','','','',2,'A002','DD02'),
('BENHAN03','','','','',3,'A003','DD03'),
('BENHAN04','','','','',4,'A004','DD04'),
('BENHAN05','','','','',5,'A005','DD05');

insert into ToaThuoc (MaTT, TenTT, SoLuong, LoaiThuoc, MaBenhAn) values 
('TT05','Thuốc Cephalexin','500','Thuốc kháng sinh Cephalosporin','BENHAN01'),
('TT06','Nhóm Thuốc lợi tiểu','600','Thuốc điều trị huyết áp cao Indapamide','BENHAN02'),
('TT07','Nhóm Thuốc Acetaminophen','700','Thuốc giảm đau Panadol','BENHAN03'),
('TT08','Nhóm Thuốc Antacid','800','Thuốc trị đau dạ dày Maalox','BENHAN04'),
('TT09','Nhóm Thuốc Bình Thần','900','Thuốc trị mất ngủ Rotunda','BENHAN05');


insert into DanhMucBenh (TrieuChung, TenBenh, MaBenh, MaBenhAn) values
('Ngứa ngáy khó chịu','Viêm Da','VD1','BENHAN01'),
('Khó thở','Cao Huyết Áp','CHA2','BENHAN02'),
('Mệt mỏi, nhức đầu','Đau đầu','DD3','BENHAN03'),
('Đau bụng không hết','Đau dạ dày','DDD4','BENHAN04'),
('ngủ không sâu giấc','Mất ngủ cấp tính','MNCT5','BENHAN05');

alter table ThanNhan -- row 46
add constraint FK_TN_BN FOREIGN KEY (MaBN) REFERENCES BenhNhan(MaBN);

alter table DieuDuong -- row 56
add constraint DK_DD_K FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa);

alter table BacSi -- row 67
add constraint FK_BS_K FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa);

alter table BacSi -- row 67  -- sai 
add constraint FK_TK_K  FOREIGN KEY (TruongKhoaMaKhoa) REFERENCES Khoa(MaKhoa);

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

alter table Thuoc -- 115
add constraint FK_T_DMT FOREIGN KEY (MaDMT) REFERENCES DanhMucThuoc(MaDMT);
alter table Thuoc 
add constraint FK_T_TT  FOREIGN KEY (MaTT) REFERENCES ToaThuoc(MaTT);

alter table chi -- 124
add constraint FK_C_HH FOREIGN KEY (MaHD) REFERENCES HoaDon(MaHD);

alter table chi
add constraint FK_C_BA FOREIGN KEY (MaBenhAn) REFERENCES BenhAn(MaBenhAn);

alter table DanhMucBenh -- 134
add constraint FK_DMB_BA FOREIGN KEY (MaBenhAn) REFERENCES BenhAn(MaBenhAn);