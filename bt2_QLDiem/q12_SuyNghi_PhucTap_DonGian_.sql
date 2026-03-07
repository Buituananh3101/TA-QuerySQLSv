-- 28.  Tính tổng số tín chỉ của các học phần đã hoàn thành bởi sinh viên có mã sinh viên 
-- là '212606016' dựa trên các học phần đã học có điểm tổng kết học phần từ 4 trở lên. 

-- Suy nghĩ phức tạp

select 
    ls.MaHocPhan
from 
    LopHocPhan_SinhVien ls
where 
    MaSinhVien = '212606016' 
    and DiemTKHP >= 4.0

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
            MaSinhVien = '212606016' 
            and DiemTKHP >= 4.0
    )

-- Suy nghĩ đơn giản

select 
    sum(h.SoTinChi)
from    
    LopHocPhan_SinhVien ls 
    join HocPhan h on ls.MaHocPhan = h.MaHocPhan
where
    ls.MaSinhVien = '212606016' 
    and
    ls.DiemTKHP >= 4.0


