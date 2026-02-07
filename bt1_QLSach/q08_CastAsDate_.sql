
--29. Tính doanh thu bán hàng mỗi ngày.
select 
    cast(h.NgayBan as date) as Ngay,
    sum(c.SLBan*s.DonGiaBan) as DoanhThu
from 
    tHoaDonBan h  
    join tChiTietHDB c on h.SoHDB=c.SoHDB
    join tSach s on s.MaSach=c.MaSach
group by 
    cast(h.NgayBan as date) 
order by 
    Ngay asc

--30. Tính tổng số lượng của từng sách bán ra trong tháng 5/2014.
--> bảng(mã sách, số lượng sách bán ra) thỏa đk--> gộp theo mã sách

--c1
select 
    bang.MaSach,
    sum(bang.SLBan)
from 
    (
        select 
            c.MaSach,
            c.SLBan
        from 
            tChiTietHDB c 
            join tHoaDonBan h on c.SoHDB=h.SoHDB
        where
            month(h.NgayBan)=5
            and 
            year(h.NgayBan)=2014
    ) as bang
group by 
    bang.MaSach

--c2
select 
    c.MaSach,
    sum(c.SLBan) as TongSoLuong
from 
    tChiTietHDB c
    join tHoaDonBan h on c.SoHDB = h.SoHDB
where 
    month(h.NgayBan) = 5 
    and 
    year(h.NgayBan) = 2014
group by 
    c.MaSach;
