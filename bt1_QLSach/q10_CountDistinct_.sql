--32. Tìm hóa đơn có mua ít nhất 2 sản phẩm khác nhau.

select 
    c.SoHDB,
    count(distinct c.MaSach) 
from 
    tChiTietHDB c 
group by 
    c.SoHDB
having 
    count(distinct c.MaSach) >=2

--33. Tìm hóa đơn có mua 3 sách do NXB Giáo Dục xuất bản (3 sách khác nhau).
select 
    c.SoHDB,
    count(distinct c.MaSach) 
from 
    tChiTietHDB c 
    join tSach s on s.MaSach=c.MaSach
    join tNhaXuatBan n on n.MaNXB=s.MaNXB
where 
    n.TenNXB=N'NXB Giáo Dục'
group by 
    c.SoHDB
having 
    count(distinct c.MaSach) >=3

