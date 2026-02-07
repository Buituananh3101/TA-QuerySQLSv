--31.Tính doanh thu bán hàng của từng tháng trong năm 2014 (kể cả những tháng không có 
--   doanh thu, VD: Tháng 1: 0; Tháng 2: 12000000; Tháng 3: 0; Tháng ….)

select 
    m.th,
    isnull(sum(c.SLBan*s.DonGiaBan),0)
from 
    (values(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12)) as m(th)
    left join tHoaDonBan h on month(h.NgayBan) = m.th and year(h.NgayBan)=2014
    left join tChiTietHDB c on h.SoHDB=c.SoHDB
    left join tSach s on s.MaSach=c.MaSach
group by 
    m.th

