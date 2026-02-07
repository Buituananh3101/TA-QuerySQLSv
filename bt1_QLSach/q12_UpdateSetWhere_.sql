--38. Giảm giá sách 10% cho các sách của NXB Giáo Dục 

--Kiểm tra dữ liệu
select 
    s.DonGiaBan 
from 
    tSach s 
    join tNhaXuatBan n on s.MaNXB = n.MaNXB
where 
    n.TenNXB = N'NXB Giáo Dục';

--Lệnh chạy
update 
    tSach
set 
    DonGiaBan = 0.9*DonGiaBan
where 
    MaNXB in (
        select MaNXB 
        from tNhaXuatBan 
        where TenNXB = N'NXB Giáo Dục'
    );


--45. Đổi tên "NXB Thăng Long" thành "NXB Văn học
update tNhaXuatBan
set TenNXB = N'NXB Văn học'
where TenNXB = N'NXB Thăng Long';

