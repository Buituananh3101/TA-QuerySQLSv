select 
    MaSach,TenSach
from 
    tSach s
    join tNhaXuatBan n on s.MaNXB=n.MaNXB
where 
    n.TenNXB= N'NXB Giáo Dục'