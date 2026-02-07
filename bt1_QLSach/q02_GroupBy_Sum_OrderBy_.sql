--5. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2014 và ngày 31/12/2014.
select 
    h.SoHDB,
    sum(c.SLBan*s.DonGiaBan)
from 
    tHoaDonBan h
    join tChiTietHDB c on h.SoHDB = c.SoHDB
    join tSach       s on c.MaSach= s.MaSach
where 
    h.NgayBan in ('2014-05-14','2014-12-31')
group by 
    h.SoHDB

--6. In ra các số hóa đơn, trị giá hóa đơn trong tháng 4/2014, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
select 
    h.SoHDB,
    sum(c.SLBan*s.DonGiaBan)
from 
    tHoaDonBan h
    join tChiTietHDB c on h.SoHDB = c.SoHDB
    join tSach       s on c.MaSach= s.MaSach
where 
    month(h.NgayBan )=4 and year(h.NgayBan )=2014
group by 
    h.SoHDB, 
    h.NgayBan
order by 
    h.NgayBan asc,
    sum(c.SLBan*s.DonGiaBan) desc


--8. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Trần Huy” lập trong ngày “11/8/2014”
select 
    h.SoHDB,
    sum(c.SLBan*s.DonGiaBan)
from 
    tHoaDonBan h
    join tChiTietHDB c on h.SoHDB = c.SoHDB
    join tSach       s on c.MaSach= s.MaSach
    join tNhanVien   n on n.MaNV  = h.MaNV
where 
    n.TenNV = N'Trần Huy'
    and 
    h.NgayBan = '2014-08-11'
group by 
    h.SoHDB,
    h.NgayBan,
    n.TenNV

