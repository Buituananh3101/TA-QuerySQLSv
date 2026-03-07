-- 25.  Tính điểm tích lũy tích lũy của các sinh viên khoa Công nghệ thông tin theo từng 
-- chương trình đào tạo. 

-- Cách ko bắt lỗi
select 
    s.MaSinhVien,
    ct.TenCTDT,
    SUM(ls.DiemTKHP * h.SoTinChi) / SUM(h.SoTinChi) as DiemTichLuy
from 
    SinhVien s
    join ChuongTrinhDaoTao ct on s.MaCTDT = ct.MaCTDT
    join Khoa k on ct.MaKhoa = k.MaKhoa
    join LopHocPhan_SinhVien ls on s.MaSinhVien = ls.MaSinhVien
    join HocPhan h on ls.MaHocPhan = h.MaHocPhan
where 
    k.TenKhoa = N'Công nghệ thông tin'
group by 
    s.MaSinhVien, ct.TenCTDT

-- Cách có bắt lỗi : chuẩn chỉ
select 
    s.MaSinhVien,
    cd.TenCTDT,
    -- Dùng DiemHe4, làm tròn 2 số thập phân và dùng NULLIF tránh lỗi chia 0
    round(    sum(ls.DiemHe4 * h.SoTinChi) / nullif(sum(h.SoTinChi), 0)    ,2) as DiemTichLuy
from 
    SinhVien s
    join ChuongTrinhDaoTao cd on s.MaCTDT = cd.MaCTDT
    join Khoa k on cd.MaKhoa = k.MaKhoa
    join LopHocPhan_SinhVien ls on s.MaSinhVien = ls.MaSinhVien
    join HocPhan h on ls.MaHocPhan = h.MaHocPhan
where 
    k.TenKhoa = N'Công nghệ thông tin'
    and ls.DiemHe4 is not null -- Nên loại bỏ các môn chưa có điểm (đang học)
group by 
    s.MaSinhVien, cd.TenCTDT
    

