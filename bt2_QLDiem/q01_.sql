-- 1. Đưa ra danh sách sinh viên gồm mã sinh viên, họ và tên của lớp có tên “Công nghệ thông tin 2” khóa 61. 
-- 2. Đưa ra danh sách các học phần và kỳ học của chương trình đào tạo có tên “CHẤT LƯỢNG CAO CÔNG NGHỆ THÔNG TIN VIỆT ANH” cho khóa 62. 
select 
    hp.MaHocPhan,
    hp.TenHocPhan,
    ct_hp.KyHoc,
    hp.SoTinChi
from 
    ChuongTrinhDaoTao ctdt
    join CTDT_HocPhan ct_hp on ctdt.MaCTDT = ct_hp.MaCTDT
    join HocPhan hp on ct_hp.MaHocPhan = hp.MaHocPhan
where 
    ctdt.TenCTDT = N'CHẤT LƯỢNG CAO CÔNG NGHỆ THÔNG TIN VIỆT ANH'
    and ctdt.KhoaHocApDung = '62'
order by 
    ct_hp.KyHoc ASC;
-- 3. Đưa ra danh sách các bộ môn của    Khoa Công nghệ thông tin. 
-- 4. Đưa ra danh sách giảng viên của Khoa Công nghệ thông tin. 
-- 5. Đưa ra danh sách các lớp học phần của học phần Cơ sở dữ liệu trong năm học 2023-2024. 
-- 6. Đưa ra thông tin chi tiết của một sinh viên có mã sinh viên là '201200085'. 
-- 7. Đưa ra danh sách các giảng viên trong một bộ môn “Mạng và các hệ thống thông tin” 2 
-- 8. Đưa ra thông tin của các chương trình đào tạo của khoa Công nghệ thông tin 
-- 9. Đưa ra thông tin điểm số học phần cơ sở dữ liệu của sinh viên “Nguyễn Hoàng Lan”
select 
    s.MaSinhVien,
    (s.HoDem + ' ' + s.Ten) AS HoTen,
    hp.TenHocPhan,
    ls.DiemQuaTrinh,
    ls.DiemThiKTHP,
    ls.DiemTKHP,
    ls.DiemHeChu,
    ls.DiemHe4
from 
    SinhVien s
    join LopHocPhan_SinhVien ls on s.MaSinhVien = ls.MaSinhVien
    join LopHocPhan lhp on ls.MaLopHocPhan = lhp.MaLopHocPhan
    join HocPhan hp on lhp.MaHocPhan = hp.MaHocPhan
where 
    (s.HoDem + ' ' + s.Ten) = N'Nguyễn Hoàng Lan'
    AND hp.TenHocPhan = N'Cơ sở dữ liệu';
-- 10.  Đưa ra danh sách các lớp học phần của giảng viên “Nguyễn Kim Sao” đã giảng dạy trong học kỳ 2, 3 của năm học 2023-2024.