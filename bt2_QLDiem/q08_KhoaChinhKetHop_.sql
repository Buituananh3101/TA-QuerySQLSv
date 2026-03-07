-- 24.  Đếm số lượng sinh viên đã đăng ký theo từng học phần trong năm học 2023-2024, 
-- học kỳ 2, sắp xếp theo số lượng sinh viên giảm dần. 

select 
    count(ls.MaSinhVien),
    l.MaHocPhan
from 
    LopHocPhan_SinhVien ls
    join LopHocPhan l on ls.MaHocPhan = l.MaHocPhan
where 
    l.NamHoc = '2023-2024'
    and 
    l.HocKy = 2
group by 
    l.MaHocPhan
order by 
    count(ls.MaSinhVien) desc

-- Phân tích vần đề: Tại sao phải join theo 2 mã

-- Chỉ JOIN theo MaHocPhan (ls.MaHocPhan = l.MaHocPhan)
--> Mà: 1 MaHocPhan có N MaLopHocPhan (ví dụ: Môn Toán Cao Cấp mã TOAN101 có 3 lớp là L01, L02, L03).
--> Hậu quả: Gs sv A đăng ký học môn Toán ở lớp L01. 
--           Nếu chỉ JOIN bằng MaHocPhan, 
--           hệ thống sẽ ghép dòng dữ liệu của sv A với cả 3 lớp (L01, L02, L03) của môn Toán trong bảng LopHocPhan. 
--           --> sv A bị tính thành 3 lần cho môn Toán đó --> Số lượng COUNT sẽ tăng vọt sai thực tế.

-- Chỉ JOIN theo MaLopHocPhan (ls.MaLopHocPhan = l.MaLopHocPhan)
--> Vấn đề: MaLopHocPhan có thể không phải là duy nhất 
--> Hậu quả: môn Toán có lớp mã 01, 
--           môn Lý cũng có lớp mã 01. 
--           Nếu sv A học môn Toán lớp 01, và bạn chỉ JOIN bằng MaLopHocPhan = '01', 
--           hệ thống sẽ ghép dòng của sinh viên A với cả lớp Toán 01 và lớp Lý 01 
--           --> Lại một lần nữa, dữ liệu bị nhân bản sai lệch.

