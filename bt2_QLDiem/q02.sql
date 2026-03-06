-- 12.  Đưa ra thông tin của các giảng viên là trưởng bộ môn (chủ nhiệm bộ môn) cùng với 
-- thông tin về bộ môn mà họ quản lý. 

select 
    g.*
from
    GiangVien g 
    join BoMon b on g.MaGiangVien=b.TruongBoMon


-- 13.  Liệt kê các giảng viên chưa được phân công lớp học phần trong năm học 2023-2024, 
-- học kỳ 2. 

select 
    g.*
from 
    GiangVien g
where 
    g.MaGiangVien not in(
        select 
            g.MaGiangVien
        from 
            GiangVien g 
            left join LopHocPhan l on l.MaGiangVien = g.MaGiangVien
        where 
            l.NamHoc = '2023-2024'
            and 
            l.HocKy = 2
    )

