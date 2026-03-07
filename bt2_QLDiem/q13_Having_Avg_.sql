-- 29.  Liệt kê các sinh viên có điểm tích lũy < điểm tích lũy của lớp học phần có mã 
-- học phần ‘IT1.110.3’ mã lớp học phần ‘1-2-22-QT08’ 

select 
    sv.MaSinhVien, 
    sv.HoDem, 
    sv.Ten, 
    avg(ls.DiemTKHP) -- Điểm tích lũy là avg của điểm tổng kết của các học phần
from 
    SinhVien sv
    join LopHocPhan_SinhVien ls on sv.MaSinhVien = ls.MaSinhVien
group by 
    sv.MaSinhVien, 
    sv.HoDem, 
    sv.Ten
having avg(ls.DiemTKHP) < (
    -- Subquery : lấy điểm trung bình của lớp học phần cụ thể
    select avg(DiemTKHP) 
    from LopHocPhan_SinhVien 
    where MaHocPhan = 'IT1.110.3' and MaLopHocPhan = '1-2-22-QT08'
);

select * from LopHocPhan_SinhVien


