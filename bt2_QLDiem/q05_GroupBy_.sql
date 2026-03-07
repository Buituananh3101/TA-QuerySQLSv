-- 19.  Đưa ra số học phần mà mỗi bộ môn của Khoa Công nghệ thông tin phụ trách. 

select 
    count(h.MaHocPhan),
    b.TenBoMon
from 
    Khoa k 
    join BoMon b on  k.MaKhoa =b.MaKhoa
    join HocPhan h on b.MaBoMon=h.MaBoMon
where 
    k.TenKhoa = N'Công nghệ thông tin'
group by 
    b.TenBoMon



-- 20.  Đưa ra danh sách các giảng viên và số lớp học phần giảng viên đang đảm nhiệm của 
-- học kỳ 2 năm học 2023-2024.

select 
    g.Ten,
    count(l.MaHocPhan) as 'SoLopHocPhan'
from 
    GiangVien g 
    join LopHocPhan l on g.MaGiangVien=l.MaGiangVien
where 
    l.NamHoc='2023-2024'
    and 
    l.HocKy=2
group by 
    g.Ten

-- 21.  Đưa ra thông tin chi tiết  về  các  lớp  học  phần  mà  sinh  viên  có  mã  sinh  viên  là 
-- '212606016' đang học, bao gồm cả điểm số của sinh viên đó (mã học phần, tên học phần, 
-- mã lớp học phần, điểm quá trình, điểm thi kết thúc học phần, điểm tổng kết học phần). 

select 
    h.MaHocPhan,
    h.TenHocPhan,
    l.MaLopHocPhan,
    ls.DiemQuaTrinh,
    ls.DiemThiKTHP,
    ls.DiemTKHP
from 
    LopHocPhan_SinhVien ls
    join LopHocPhan l on ls.MaLopHocPhan = l.MaLopHocPhan
    join HocPhan h on l.MaHocPhan = h.MaHocPhan
where 
    ls.MaSinhVien = '212606016'

