--13. In ra danh sách các sách không bán được.
select 
    MaSach, TenSach
from 
    tSach
where 
    MaSach not in (
        select distinct MaSach 
        from tChiTietHDB
    )

--14. In ra danh sách các sách không bán được trong năm 2014.
select 
    MaSach, TenSach
from 
    tSach
where 
    MaSach not in (
        select distinct c.MaSach 
        from 
            tChiTietHDB c
            join tHoaDonBan h on c.SoHDB = h.SoHDB
        where year(h.NgayBan) = 2014
    )

--15. In ra danh sách các sách của NXB Giáo Dục không bán được trong năm 2014.
select 
    MaSach, TenSach
from 
    tSach s 
    join tNhaXuatBan n on s.MaNXB=n.MaNXB
where 
    MaSach not in (
        select distinct c.MaSach 
        from 
            tChiTietHDB c
            join tHoaDonBan h on c.SoHDB = h.SoHDB
        where year(h.NgayBan) = 2014
    )
    and 
    n.TenNXB=N'NXB Giáo Dục'
