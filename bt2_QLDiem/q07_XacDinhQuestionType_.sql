-- 23.  Xác định xem sinh viên có mã sinh viên là '212606016' đã học các học phần tiên 
-- quyết của học phần có mã ‘IE3.003.3’ chưa. 

-- MaHocPhan mà sv này đã qua
select 
    ls.MaHocPhan
from 
    LopHocPhan_SinhVien ls
where 
    ls.MaSinhVien = '212606016' 
    and ls.DiemTKHP >= 4.0

-- Lấy list các MaHocPhanTienQuyet = IE3.003.3 mà sv CHƯA đạt (điểm < 4 hoặc chưa học)
select 
    ht.MaHocPhanTienQuyet,
    h.TenHocPhan
from 
    HocPhanTienQuyet ht
    join HocPhan h on ht.MaHocPhanTienQuyet = h.MaHocPhan
where 
    ht.MaHocPhan = 'IE3.003.3'
    and 
    ht.MaHocPhanTienQuyet not in (
        select 
            ls.MaHocPhan
        from 
            LopHocPhan_SinhVien ls
        where 
            ls.MaSinhVien = '212606016' 
            and ls.DiemTKHP >= 4.0
    )


