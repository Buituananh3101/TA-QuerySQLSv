-- 1. In ra danh sách các sách chỉ lấy (MaSach,TenSach) do Nhà xuất bản Giáo Dục xuất bản.
select 
    MaSach,TenSach
from 
    tSach s
    join tNhaXuatBan n on s.MaNXB=n.MaNXB
where 
    n.TenNXB= N'NXB Giáo Dục'

-- 2. In ra danh sách các sách có tên bắt đầu là “Ngày”.
select 
    s.TenSach
from 
    tSach s
where
    s.TenSach like N'Ngày%'

--3. In ra danh sách các sách (MaSach,TenSach) do Nhà xuất bản Giáo Dục có giá từ 50.000 đến 150.000.
select 
    MaSach,TenSach
from 
    tSach s
    join tNhaXuatBan n on s.MaNXB=n.MaNXB
where 
    n.TenNXB= N'NXB Giáo Dục'
    and
    s.DonGiaBan between 50000 and 150000

--4. In ra danh sách các các sách (MaSach,TenSach) do NXB Giáo Dục hoặc NXB Trẻ sản xuất có giá từ 90.000 đến 140.000
select 
    MaSach,TenSach
from 
    tSach s
    join tNhaXuatBan n on s.MaNXB=n.MaNXB
where 
    n.TenNXB= N'NXB Giáo Dục'
    or
    n.TenNXB= N'NXB Trẻ'
    and
    s.DonGiaBan between 50000 and 150000

