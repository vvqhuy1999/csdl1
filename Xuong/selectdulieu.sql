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
select bn.hoten , Sum(hd.tongtien) TongTien from  benhan ba
inner join benhnhan bn on bn.mabn = ba.mabn
inner join chi c on ba.mabenhan = c.mabenhan 
inner join hoadon hd on c.mahd = hd.mahd
group by bn.mabn;





-- Các câu lệnh truy vấn 		
-- 1. Lấy ra thông tin liên hệ của toàn bộ bác sỹ.	
	select HoTen, sdt from bacsi ;
    
-- 2. Lấy ra tất cả các thông tin từ về hóa đơn, đơn thuốc.
	select hd.TenHD, tt.TenTT, tt.LoaiThuoc ,hd.TongTien   from  benhan ba
	inner join toathuoc tt on tt.mabenhan = ba.mabenhan
	inner join chi c on ba.mabenhan = c.mabenhan 
	inner join hoadon hd on c.mahd = hd.mahd;

-- 3. Lấy tổng số tiền đã tạm ứng của mỗi bệnh nhân.	
	
-- 4. Lấy thông tin bệnh án, tên bệnh nhân và tên của bác sĩ phụ trách.
	select ba.mabenhan ,bn.hoten , bs.HoTen TongTien from  benhan ba
	inner join benhnhan bn on bn.mabn = ba.mabn	
    inner join kham k on ba.mabenhan = k.mabenhan
    inner join bacsi bs on k.MaBS = bs.MaBS;
    
   --  select * from kham
-- 5. Thống kê được một số căn bệnh mà Bộ Y Tế và nhà nước quan tâm.
		
-- 6. Giảng viên đưa thêm câu hỏi.

