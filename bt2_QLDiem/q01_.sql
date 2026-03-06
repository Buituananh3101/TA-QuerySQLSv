-- 1. Đưa ra danh sách sinh viên gồm mã sinh viên, họ và tên của lớp có tên “Công nghệ thông tin 2” khóa 61. 
select 
    s.MaSinhVien,
    s.HoDem,
    s.Ten,
    l.TenLop
from 
    SinhVien s 
    join Lop l on s.MaLop=l.MaLop
where 
    l.TenLop =N'CÔNG NGHỆ THÔNG TIN 2'
    and 
    l.KhoaHoc = 61
-- 2. Đưa ra danh sách các học phần và kỳ học của chương trình đào tạo có tên “CHẤT LƯỢNG CAO CÔNG NGHỆ THÔNG TIN VIỆT ANH” cho khóa 62. 
select 
    hp.TenHocPhan,
    cthp.KyHoc,
    hp.SoTinChi
from 
    ChuongTrinhDaoTao ctdt
    join CTDT_HocPhan cthp on ctdt.MaCTDT = cthp.MaCTDT
    join HocPhan hp on cthp.MaHocPhan = hp.MaHocPhan
where 
    ctdt.TenCTDT = N'CHẤT LƯỢNG CAO CÔNG NGHỆ THÔNG TIN VIỆT ANH'
    and ctdt.KhoaHocApDung = '62'

-- 3. Đưa ra danh sách các bộ môn của Khoa Công nghệ thông tin. 

select  
    b.TenBoMon
from 
    BoMon b 
    join Khoa k on b.MaKhoa=k.MaKhoa
where 
    k.TenKhoa=N'Công nghệ thông tin'

-- 4. Đưa ra danh sách giảng viên của Khoa Công nghệ thông tin. 

select  
    g.Ten
from 
    GiangVien g
    join BoMon b on g.MaBoMon=b.MaBoMon
    join Khoa k on b.MaKhoa=k.MaKhoa
where 
    k.TenKhoa=N'Công nghệ thông tin'

-- 5. Đưa ra danh sách các lớp học phần của học phần Cơ sở dữ liệu trong năm học 2023-2024. 

select 
    l.TenLopHocPhan
from 
    LopHocPhan l 
    join HocPhan h on l.MaHocPhan=h.MaHocPhan
where 
    h.TenHocPhan=N'Cơ sở dữ liệu'
    and 
    l.NamHoc = '2023-2024'

-- 6. Đưa ra thông tin chi tiết của một sinh viên có mã sinh viên là '201200085'. 

select 
    *
from 
    SinhVien s
where 
    s.MaSinhVien='201200085'

-- 7. Đưa ra danh sách các giảng viên trong một bộ môn “Mạng và các hệ thống thông tin” 

select 
    g.Ten
from 
    GiangVien g 
    join BoMon b on g.MaBoMon=b.MaBoMon
where 
    b.TenBoMon = N'Mạng và các hệ thống thông tin'

-- 8. Đưa ra thông tin của các chương trình đào tạo của khoa Công nghệ thông tin 

select 
    c.TenCTDT
from 
    ChuongTrinhDaoTao c 
    join Khoa k on c.MaKhoa=k.MaKhoa
where 
    k.TenKhoa=N'Công nghệ thông tin'

-- 9. Đưa ra thông tin điểm số học phần cơ sở dữ liệu của sinh viên “Nguyễn Hoàng Lan”
select 
    s.MaSinhVien,
    (s.HoDem + ' ' + s.Ten) AS HoTen,
    h.TenHocPhan,
    ls.DiemQuaTrinh,
    ls.DiemThiKTHP,
    ls.DiemTKHP,
    ls.DiemHeChu,
    ls.DiemHe4
from 
    SinhVien s
    join LopHocPhan_SinhVien ls on s.MaSinhVien = ls.MaSinhVien
    join LopHocPhan l on ls.MaLopHocPhan = l.MaLopHocPhan
    join HocPhan h on l.MaHocPhan = h.MaHocPhan
where 
    (s.HoDem + ' ' + s.Ten) = N'Nguyễn Hoàng Lan'
    and
    h.TenHocPhan = N'Cơ sở dữ liệu';

-- 10.  Đưa ra danh sách các lớp học phần của giảng viên “Nguyễn Kim Sao” đã giảng dạy trong học kỳ 2, 3 của năm học 2023-2024.

select 
    l.TenLopHocPhan
from 
    GiangVien g 
    join LopHocPhan l on g.MaGiangVien = l.MaGiangVien
where
    (g.HoDem +' '+ g.Ten) = N'Nguyễn Kim Sao'
    and
    l.NamHoc = '2023-2024'
    and 
    l.HocKy in (2,3)

-- 11.  Đưa ra danh sách mã sinh viên, họ tên, lớp, ngày sinh, điểm thành phần, điểm thi 
-- kết thúc học phần, điểm tổng kết học phần của các sinh viên đang theo học mã học phần 
-- ‘IT1.110.3’ mã lớp học phần ‘1-2-22-QT08’ 

select 
    s.Ten,
    ls.DiemHe4
from 
    SinhVien s 
    join LopHocPhan_SinhVien ls on s.MaSinhVien=ls.MaSinhVien
    join LopHocPhan l on ls.MaLopHocPhan = l.MaLopHocPhan
    join HocPhan h on l.MaHocPhan = h.MaHocPhan
where 
    h.MaHocPhan = 'IT1.110.3'
    and 
    l.MaLopHocPhan ='1-2-22-QT08'

