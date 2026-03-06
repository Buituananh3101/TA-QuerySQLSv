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
    hp.MaHocPhan,
    hp.TenHocPhan,
    lhp.MaLopHocPhan,
    ls.DiemQuaTrinh,
    ls.DiemThiKTHP,
    ls.DiemTKHP
from 
    LopHocPhan_SinhVien ls
    join LopHocPhan lhp on ls.MaLopHocPhan = lhp.MaLopHocPhan
    join HocPhan hp on lhp.MaHocPhan = hp.MaHocPhan
where 
    ls.MaSinhVien = '212606016'

-- 22.  Tính tổng số tín chỉ đã tích lũy của sinh viên viên có mã sinh viên là '212606016' 
-- dựa trên các học phần đã hoàn thành và điểm số. 

select 
    sum(hp.SoTinChi) 
from 
    (
        select distinct lhp.MaHocPhan
        from LopHocPhan_SinhVien ls
        join LopHocPhan lhp on ls.MaLopHocPhan = lhp.MaLopHocPhan
        where ls.MaSinhVien = '201200043' and ls.DiemTKHP >= 4.0
    ) as hpDaQua
    join HocPhan hp on hpDaQua.MaHocPhan = hp.MaHocPhan


select 
    sum(h.SoTinChi) 
from 
    SinhVien s
    join LopHocPhan_SinhVien ls on s.MaSinhVien =ls.MaSinhVien
    join LopHocPhan l on ls.MaLopHocPhan=l.MaLopHocPhan
    join HocPhan h on l.MaHocPhan=h.MaHocPhan
where 
    s.MaSinhVien='212606016'
    and 
    ls.DiemTKHP >=4.0


select * from LopHocPhan_SinhVien

-- 23.  Xác định xem sinh viên có mã sinh viên là '212606016' đã học các học phần tiên 
-- quyết của học phần có mã ‘IE3.003.3’ chưa. 

-- 24.  Đếm số lượng sinh viên đã đăng ký theo từng học phần trong năm học 2023-2024, 
-- học kỳ 2, sắp xếp theo số lượng sinh viên giảm dần. 



-- 25.  Tính điểm tích lũy tích lũy của các sinh viên khoa Công nghệ thông tin theo từng 
-- chương trình đào tạo. 
-- 26.  Đưa ra danh sách các học phần mà sinh viên có mã sinh viên là '212606016' chưa 
-- hoàn thành (có điểm dưới tổng kết học phần dưới 4 hoặc chưa đăng ký học) theo một 
-- chương trình đào tạo. 
-- 27.  Đưa ra thông tin về các sinh viên và giảng viên của khoa Công nghệ thông tin có 
-- sinh nhật trong tháng hiện tại. 
-- 28.  Tính tổng số tín chỉ của các học phần đã hoàn thành bởi sinh viên có mã sinh viên 
-- là '212606016' dựa trên các học phần đã học có điểm tổng kết học phần từ 4 trở lên. 
-- 29.  Liệt kê các sinh viên có điểm tích lũy dưới điểm tích lũy của lớp học phần có mã 
-- học phần ‘IT1.110.3’ mã lớp học phần ‘1-2-22-QT08’ 
-- 3 
-- 30.  Đưa ra số phần trăm của các sinh viên có điểm trên 8,5; trên 7 và dưới 8,5; dưới 7 
-- và trên 5,5; dưới 5,5 và trên 4; dưới 4 của mỗi lớp học phần của Khoa Công nghệ thông 
-- tin của học kỳ 2 năm học 2023-2024.