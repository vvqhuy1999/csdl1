create database HT_BDS;

use HT_BDS;

create table VanPhong(
	MaVP int,
    DiaDiem varchar(255),
    primary key (MaVP)
);

create table NhanVien(
	MaNV int,
    TenNV varchar(50),
    MaVP int,
    primary key (MaNV),
    CONSTRAINT  FK_NV_VP foreign key (MaVP) REFERENCES  VanPhong(MaVP)
);

create table ThanNhan(
	MaTN int,
    TenThanNhan varchar(50),
    MoiQuanHe varchar(50),
    MaNV int,
    primary key (MaTN),
    CONSTRAINT FK_TN_NV foreign key (MaNV) references nhanvien(MaNV)
);

create table ChuSoHuu(
	MaChuSoHuu int,
    TenChuSoHuu varchar(50),
    SDT varchar(50),
    primary key (MaChuSoHuu)
);

create table BatDongSan(
	MaBDS int,
    DiaChi varchar(50),
    MaVP int,
    MaChuSoHuu int,
    primary key (MaBDS),
    CONSTRAINT FK_BDS_VP foreign key (MaVP) references vanphong(MaVP),
    CONSTRAINT FK_BDS_CSH foreign key (MaChuSoHuu) references ChuSoHuu(MaChuSoHuu)
);


-- Lab4 phan 2
-- Thêm cột SoCMND cho table NHANVIEN
alter table nhanvien 
add  SoCMND int;
-- Thêm ràng buộc Unique cho cột SoCMND trong table NHANVIEN
alter table nhanvien
add unique (SoCMND);
-- Đổi kiểu dữ liệu của cột MaNV thành varchar(7)
alter table ThanNhan
drop constraint FK_TN_NV;

alter table nhanvien
modify column SoCMND varchar(9);

alter table nhanvien
modify column manv varchar(7);

alter table ThanNhan
modify column manv varchar(7);

alter table thannhan
add constraint FK_TN_NV foreign key (manv) references nhanvien(manv);

-- Thêm cột GioiTinh cho table NHANVIEN
alter table nhanvien
add GioiTinh varchar(5);

-- Xóa ràng buộc khóa ngoại của table THANHNHAN với NHANVIEN
alter table ThanNhan
drop constraint FK_TN_NV;
-- Xóa table THANNHAN
drop table thannhan;
-- drop database ht_bds;

