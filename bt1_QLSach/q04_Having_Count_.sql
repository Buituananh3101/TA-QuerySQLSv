--16. Tìm số hóa đơn đã mua tất cả các sách của NXB Giáo Dục.
--> hóa đơn có tổng mã sách = tổng mã sách NXB GD
select 
    c.SoHDB
from 
    tChiTietHDB c
    join tSach s on c.MaSach = s.MaSach
    join tNhaXuatBan n on s.MaNXB = n.MaNXB
where 
    n.TenNXB = N'NXB Giáo Dục'
group by 
    c.SoHDB
having 
    count(distinct c.MaSach) = (
        select count(s2.MaSach)
        from tSach s2
        join tNhaXuatBan n2 on s2.MaNXB = n2.MaNXB
        where n2.TenNXB = N'NXB Giáo Dục'
    )

--17. Có bao nhiêu đầu sách khác nhau được bán ra trong năm 2014.
select 
    count(distinct c.MaSach) as SoDauSach
from 
    tChiTietHDB c
    join tHoaDonBan h on h.SoHDB=c.SoHDB
where
    year(h.NgayBan)=2014

