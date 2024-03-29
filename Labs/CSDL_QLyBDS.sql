
CREATE DATABASE QLyBatDongSan;
USE QLyBatDongSan;

CREATE TABLE vanphong (
  maVP int NOT NULL,
  DiaDiem varchar(255) DEFAULT NULL,
  nv_tp int DEFAULT NULL,
  PRIMARY KEY (maVP)
 ) 
 
CREATE TABLE nhanvien (
  maNV int NOT NULL,
  tenNV varchar(255) DEFAULT NULL,
  maVP int DEFAULT NULL,
  PRIMARY KEY (maNV),
  CONSTRAINT fk_nv_vp FOREIGN KEY (maVP) REFERENCES vanphong (maVP)
) 

CREATE TABLE chusohuu (
  maCSH int NOT NULL,
  TenCSH varchar(50) DEFAULT NULL,
  SDT varchar(50) DEFAULT NULL,
  PRIMARY KEY (maCSH)
)

CREATE TABLE batdongsan (
  maBDS int NOT NULL,
  DiaChi varchar(255) DEFAULT NULL,
  maVP int DEFAULT NULL,
  maCSH int DEFAULT NULL,
  PRIMARY KEY (maBDS),
  CONSTRAINT fk_bds_vp FOREIGN KEY (maVP) REFERENCES vanphong (maVP),
  CONSTRAINT pk_bds_csh FOREIGN KEY (maCSH) REFERENCES chusohuu (maCSH) ON UPDATE CASCADE
) 

CREATE TABLE thannhan (
  maTN int NOT NULL,
  tenTN varchar(50) DEFAULT NULL,
  moiQH varchar(50) DEFAULT NULL,
  maNV int DEFAULT NULL,
  PRIMARY KEY (maTN),
  CONSTRAINT fk_tn_nv FOREIGN KEY (maNV) REFERENCES nhanvien (maNV)
) 


