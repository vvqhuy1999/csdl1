use QuanLyBenhNhan;
-- Sau khi xây dựng thành công CSDL trên mySQL hoặc Server thì làm những câu truy vấn nhé
-- 1. Liệt kê tất cả các BN từng khám và chữa bệnh tại BV
select * from benhnhan ;


-- 2. Liệt kê danh sách tất cả bác sĩ
select* from bacsi;

-- 3. Liệt kê các BN điều trị ngoại trú và điều trị nội trú
select * from benhnhan bn 
inner join benhan ba on bn.mabn = ba.mabn 
where ba.loaibenhnhan = 'noi tru' or ba.loaibenhnhan = 'ngoai tru';

-- 4. Tính tổng tiền phải thanh toán của những bệnh nhân.
select bn.hoten , Sum(hd.tongtien) TongTien 
from  BenhNhan bn
join BenhAn ba on bn.mabn = ba.mabn
join hoadon hd on hd.MaBenhAn = ba.MaBenhAn
group by bn.mabn,bn.HoTen;

-- Các câu lệnh truy vấn 		
-- 5. Lấy ra thông tin liên hệ của toàn bộ bác sỹ.	
	select HoTen, sdt from bacsi ;
    
-- 6. Lấy ra tất cả các thông tin từ về hóa đơn, đơn thuốc.
	select hd.TenHD, tt.TenTT, tt.LoaiThuoc ,hd.TongTien   from  benhan ba
	inner join toathuoc tt on tt.mabenhan = ba.mabenhan
	inner join hoadon hd on hd.MaBenhAn = ba.MaBenhAn
	
-- 7. Lấy thông tin bệnh án, tên bệnh nhân và tên của bác sĩ phụ trách.
-- ba.mabenhan ,bn.hoten , bs.HoTen
	select  ba.mabenhan ,bn.hoten as 'Họ tên Bệnh Nhân', bs.HoTen as 'Họ Tên Bác Sĩ'
    from  benhnhan bn
	join  benhan ba  on bn.mabn = ba.mabn	
	join kham k on k.MaBenhAn = ba.MaBenhAn
	join bacsi bs on k.MaBS = bs.MaBS
	order by ba.mabenhan asc

