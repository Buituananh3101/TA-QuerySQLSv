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

select -- Giống delete but use select để ko bị mất data
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

