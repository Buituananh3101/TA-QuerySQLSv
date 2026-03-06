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

-- 16.  Thêm một sinh viên mới cho bảng sinh viên. 

insert into SinhVien (MaSinhVien, HoDem, Ten, NgaySinh, GioiTinh, DiaChi, DienThoai, Email, MaLop)
values ('201200999', N'Nguyễn Văn', N'A', '2004-01-01', 1, N'Hà Nội', '0123456789', 'nva@email.com', 'CNTT1-K62')

-- 17.  Xóa những lớp học phần không có sinh viên. 

delete 
from 
    LopHocPhan
where 
    MaLopHocPhan not in (
        select distinct 
            MaLopHocPhan 
        from
            LopHocPhan_SinhVien
    )

select 
    MaLopHocPhan
from 
    LopHocPhan 
where 
    MaLopHocPhan not in (
        select distinct 
            MaLopHocPhan 
        from
            LopHocPhan_SinhVien
    )

-- 18.  Cập nhật địa chỉ và số điện thoại cho SV có mã ‘201200043’. 

update 
    s
set 
    s.DiaChi = N'abc',
    s.DienThoai = '132'
from 
    SinhVien s
where 
    s.MaSinhVien = '201200043'


select * from SinhVien where MaSinhVien = '201200043'

