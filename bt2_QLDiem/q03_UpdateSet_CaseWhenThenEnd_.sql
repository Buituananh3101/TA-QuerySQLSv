-- 14.  Cập nhật cột điểm tổng kết học phần cho bảng LopHocPhan_SinhVien. 

update 
    ls 
set 
    ls.DiemTKHP = (ls.DiemQuaTrinh * hp.TrongSoDiemQuaTrinh) + (ls.DiemThiKTHP * hp.TrongSoDiemThiKTHP)
from 
    LopHocPhan_SinhVien ls
    join LopHocPhan lhp on ls.MaLopHocPhan = lhp.MaLopHocPhan
    join HocPhan hp on lhp.MaHocPhan = hp.MaHocPhan

-- 15.  Cập nhật cột điểm hệ 4, điểm hệ chữ cho bảng LopHocPhan_SinhVien. 

update 
    ls
set 
    ls.DiemHe4 = case 
        when DiemTKHP >= 9.5 then 4.0
        when DiemTKHP >= 8.5 then 3.6
        when DiemTKHP >= 7.0 then 3.0
        when DiemTKHP >= 5.5 then 2.0
        when DiemTKHP >= 4.0 then 1.0
        else 0.0
    end,
    ls.DiemHeChu = case 
        when DiemTKHP >= 9.5 then 'A+'
        when DiemTKHP >= 8.5 then 'A'
        when DiemTKHP >= 7.0 then 'B'
        when DiemTKHP >= 5.5 then 'C'
        when DiemTKHP >= 4.0 then 'D'
        else 'F'
    end
from 
    LopHocPhan_SinhVien ls


select * from LopHocPhan_SinhVien