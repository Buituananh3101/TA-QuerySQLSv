--1. In ra danh sách các sách chỉ lấy (MaSach,TenSach) do Nhà xuất bản Giáo Dục xuất bản.
select 
    MaSach,TenSach
from 
    tSach s
    join tNhaXuatBan n on s.MaNXB=n.MaNXB
where 
    n.TenNXB= N'NXB Giáo Dục'

--2. In ra danh sách các sách có tên bắt đầu là “Ngày”.
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

--7. In ra danh sách các khách hàng (MaKH, TenKH) đã mua hàng trong ngày 2014-04-12
select 
    k.MaKH,
    k.TenKH
from 
    tKhachHang k 
    join tHoaDonBan h on k.MaKH=h.MaKH
where 
    h.NgayBan = '2014-04-12'

--9. In ra danh sách các sách (MaSach,TenSach) được khách hàng có tên “Nguyễn Đình Sơn” mua trong tháng 8/2014.

select 
    s.MaSach,
    s.TenSach
from 
    tSach s
    join tChiTietHDB c on s.MaSach = c.MaSach
    join tHoaDonBan h on c.SoHDB = h.SoHDB
    join tKhachHang k on h.MaKH = k.MaKH
where 
    k.TenKH = N'Nguyễn Đình Sơn'
    and month(h.NgayBan) = 8 and year(h.NgayBan) = 2014

--10. Tìm các số hóa đơn đã mua sách “Cấu trúc dữ liệu và giải thuật” 
select 
    h.SoHDB
from 
    tHoaDonBan h 
    join tChiTietHDB c on h.SoHDB = c.SoHDB
    join tSach s on c.MaSach = s.MaSach
where 
    s.TenSach = N'Cấu trúc dữ liệu và giải thuật'

--11. Tìm các số hóa đơn đã mua sản phẩm có mã số “S01” hoặc “S02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
select 
    h.SoHDB
from 
    tHoaDonBan h 
    join tChiTietHDB c on h.SoHDB = c.SoHDB
where 
    (c.MaSach = 'S01' or c.MaSach = 'S02')
    and 
    c.SLBan between 10 and 20

--12. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “S10” và “S11”, mỗi sản phẩm mua với số lượng từ 5 đến 10
--c1
select 
    c.SoHDB
from 
    tChiTietHDB c
where 
    c.MaSach = 'S10' and c.SLBan between 5 and 10
intersect
select 
    c.SoHDB
from 
    tChiTietHDB c
where 
    c.MaSach = 'S11' and c.SLBan between 5 and 10
--c2
select 
    h.SoHDB
from 
    tHoaDonBan h 
    join tChiTietHDB c on h.SoHDB = c.SoHDB
where 
    (c.MaSach = 'S01' and c.MaSach = 'S02')
    and 
    c.SLBan between 10 and 20

