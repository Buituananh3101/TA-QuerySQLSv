-- 27.  Đưa ra thông tin về các sinh viên và giảng viên của khoa Công nghệ thông tin có 
-- sinh nhật trong tháng hiện tại. 

select 
    N'Sinh Viên' as VaiTro, 
    s.MaSinhVien as Ma, 
    s.HoDem, 
    s.Ten, 
    s.NgaySinh
from 
    SinhVien s
    join Lop l on s.MaLop = l.MaLop
    join Khoa k on l.MaKhoa = k.MaKhoa
where 
    k.TenKhoa = N'Công nghệ thông tin' 
    and month(s.NgaySinh) = month(getdate())
UNION ALL -- Lấy tất cả, kể cả khi 2 dòng trùng nhau, còn UNION ko thôi thì nó là UNION DISTINCT 
select 
    N'Giảng Viên' as VaiTro, 
    g.MaGiangVien as Ma, 
    g.HoDem, 
    g.Ten, 
    g.NgaySinh
from 
    GiangVien g
    join BoMon b on g.MaBoMon = b.MaBoMon
    join Khoa k on b.MaKhoa = k.MaKhoa
where 
    k.TenKhoa = N'Công nghệ thông tin' 
    and month(g.NgaySinh) = month(getdate())


