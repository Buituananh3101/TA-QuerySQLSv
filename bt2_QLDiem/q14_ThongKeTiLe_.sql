-- 30.  Đưa ra số phần trăm của các sinh viên có điểm trên 8,5; trên 7 và dưới 8,5; dưới 7 
-- và trên 5,5; dưới 5,5 và trên 4; dưới 4 của mỗi lớp học phần của Khoa Công nghệ thông 
-- tin của học kỳ 2 năm học 2023-2024.


-- Cách tính tổng rồi chia
select 
    l.MaLopHocPhan, 
    h.TenHocPhan,
    count(ls.MaSinhVien) as 'TongSinhVien',
    sum(case when ls.DiemTKHP >= 8.5 then 1.0 else 0 end) * 100 / count(*) as 'Tren8.5 (%)',
    sum(case when ls.DiemTKHP >= 7 and ls.DiemTKHP < 8.5 then 1.0 else 0 end) * 100 / count(*) as 'Tu7Den8.5 (%)',
    sum(case when ls.DiemTKHP >= 5.5 and ls.DiemTKHP < 7 then 1.0 else 0 end) * 100 / count(*) as 'Tu5.5Den7 (%)',
    sum(case when ls.DiemTKHP >= 4 and ls.DiemTKHP < 5.5 then 1.0 else 0 end) * 100 / count(*) as 'Tu4Den5.5 (%)',
    sum(case when ls.DiemTKHP < 4 then 1.0 else 0 end) * 100 / count(*) as 'Duoi4 (%)'
from 
    LopHocPhan l 
    join LopHocPhan_SinhVien ls on l.MaLopHocPhan = ls.MaLopHocPhan and l.MaHocPhan = ls.MaHocPhan
    join HocPhan h on l.MaHocPhan = h.MaHocPhan
    join BoMon b on h.MaBoMon = b.MaBoMon
    join Khoa k on b.MaKhoa = k.MaKhoa
where 
    k.TenKhoa = N'Công nghệ thông tin' 
    and 
    l.NamHoc = '2023-2024' 
    and 
    l.HocKy = 2
group by 
    l.MaLopHocPhan, 
    h.TenHocPhan;

-- Mẹo Dùng Avg

select 
    l.MaLopHocPhan, 
    h.TenHocPhan,
    count(ls.MaSinhVien) as TongSinhVien,
    
    -- Dùng AVG gọn hơn rất nhiều và không sợ lỗi chia cho 0 (Divide by zero)
    avg(case when ls.DiemTKHP >= 8.5 then 100 else 0.0 end) as '[8.5 - 10] (%)',
    avg(case when ls.DiemTKHP >= 7 and ls.DiemTKHP < 8.5 then 100 else 0.0 end) as '[7 - 8.5) (%)',
    avg(case when ls.DiemTKHP >= 5.5 and ls.DiemTKHP < 7 then 100 else 0.0 end) as '[5.5 - 7) (%)',
    avg(case when ls.DiemTKHP >= 4 and ls.DiemTKHP < 5.5 then 100 else 0.0 end) as '[4 - 5.5) (%)',
    avg(case when ls.DiemTKHP < 4 then 100 else 0.0 end) as '[0 - 4) (%)'

from 
    LopHocPhan l 
    join LopHocPhan_SinhVien ls on l.MaLopHocPhan = ls.MaLopHocPhan and l.MaHocPhan = ls.MaHocPhan
    join HocPhan h on l.MaHocPhan = h.MaHocPhan
    join BoMon b on h.MaBoMon = b.MaBoMon
    join Khoa k on b.MaKhoa = k.MaKhoa
where 
    k.TenKhoa = N'Công nghệ thông tin' 
    and l.NamHoc = '2023-2024' 
    and l.HocKy = 2
group by 
    l.MaLopHocPhan, 
    h.TenHocPhan;