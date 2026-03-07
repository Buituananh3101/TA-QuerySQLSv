-- 22.  Tính tổng số tín chỉ đã tích lũy của sinh viên viên có mã sinh viên là '212606016' 
-- dựa trên các học phần đã hoàn thành và điểm số. 

-- Lấy list các MaHocPhan duy nhất mà sinh viên đã vượt qua (điểm >= 4.0)
-- Ko care bao nhiêu điểm, chỉ care đến việc nó qua & bao nhiêu tín
select distinct 
    ls.MaHocPhan
from 
    LopHocPhan_SinhVien ls
    -- join LopHocPhan l on ls.MaLopHocPhan = l.MaLopHocPhan
where 
    ls.MaSinhVien = '201200043' and ls.DiemTKHP >= 4.0

-- Tính tổng
select 
    sum(h.SoTinChi) 
from 
    
    (
        select distinct 
            l.MaHocPhan
        from 
            LopHocPhan_SinhVien ls
            join LopHocPhan l on ls.MaLopHocPhan = l.MaLopHocPhan
        where 
            ls.MaSinhVien = '201200043' and ls.DiemTKHP >= 4.0

    ) as q
    join HocPhan h on q.MaHocPhan = h.MaHocPhan

-- Cách làm sai, bị lừa
select 
    sum(h.SoTinChi) 
from 
    SinhVien s
    join LopHocPhan_SinhVien ls on s.MaSinhVien =ls.MaSinhVien
    join LopHocPhan l on ls.MaLopHocPhan=l.MaLopHocPhan
    join HocPhan h on l.MaHocPhan=h.MaHocPhan
where 
    s.MaSinhVien='201200043'
    and 
    ls.DiemTKHP >=4.0

select * from LopHocPhan_SinhVien

-- Cách Tự làm
-- Lấy MaHocPhan đã qua
select 
    ls.MaHocPhan
from 
    LopHocPhan_SinhVien ls
where 
    ls.MaSinhVien = '201200043' and ls.DiemTKHP >= 4.0
-- Tính tổng
select 
    sum(h.SoTinChi)
from 
    HocPhan h 
where 
    h.MaHocPhan in (
        select 
            ls.MaHocPhan
        from 
            LopHocPhan_SinhVien ls
        where 
            ls.MaSinhVien = '201200043' and ls.DiemTKHP >= 4.0
    )



