--21. Tìm số hóa đơn có trị giá cao nhất trong năm 2014.
--> tạo bảng con (số hóa đơn + giá trị hóa đơn) --> truy vấn trên bảng đấy
--c1
select top 1
    bang.SoHD,
    bang.giatri
from
    (
        select 
            c.SoHDB as SoHD,
            sum(c.SLBan*s.DonGiaBan) as giatri
        from 
            tChiTietHDB c
            join tSach s on c.MaSach = s.MaSach
            join tHoaDonBan h on c.SoHDB = h.SoHDB
        where 
            year(h.NgayBan) = 2014
        group by 
            c.SoHDB
    ) as bang
order by 
    giatri desc

--c2
select top 1
    c.SoHDB as SoHD,
    sum(c.SLBan*s.DonGiaBan) as giatri
from 
    tHoaDonBan h  
    join tChiTietHDB c  on h.SoHDB=c.SoHDB
    join tSach s on c.MaSach=s.MaSach
where
    year(h.NgayBan)=2014
group by 
    c.SoHDB
order by
    giatri desc

--22. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2014.
--> Lấy bảng con (số hóa đơn + giá trị hóa đơn) --> tìm số hóa đơn max giá trị 
--> tìm khách có số hóa đơn đó

--c1
select 
    k.TenKH,
    bang.giatri
from 
    tHoaDonBan h  
    join tKhachHang k on h.MaKH=k.MaKH
    join(
        select top 1
            c.SoHDB as SoHD,
            sum(c.SLBan*s.DonGiaBan) as giatri
        from 
            tHoaDonBan h  
            join tChiTietHDB c  on h.SoHDB=c.SoHDB
            join tSach s on c.MaSach=s.MaSach
        where
            year(h.NgayBan)=2014
        group by 
            c.SoHDB
        order by
            giatri desc
    ) as bang on bang.SoHD=h.SoHDB

--c2
select 
    k.TenKH
from 
    tHoaDonBan h  
    join tKhachHang k on h.MaKH=k.MaKH
where 
    h.SoHDB = (
        select top 1
            c.SoHDB as SoHD
        from 
            tHoaDonBan h  
            join tChiTietHDB c  on h.SoHDB=c.SoHDB
            join tSach s on c.MaSach=s.MaSach
        where
            year(h.NgayBan)=2014
        group by 
            c.SoHDB
        order by
            sum(c.SLBan*s.DonGiaBan) desc
    )

--c3
select top 1 with ties
    k.TenKH,
    h.SoHDB,
    sum(c.SLBan*s.DonGiaBan) as giatri
from 
    tKhachHang k
    join tHoaDonBan h on k.MaKH = h.MaKH
    join tChiTietHDB c on h.SoHDB = c.SoHDB
    join tSach s on c.MaSach = s.MaSach
where  
    year(h.NgayBan)=2014
group by 
    k.TenKH,
    h.SoHDB
order by 
    giatri desc

--23. In ra danh sách 3 khách hàng (MaKH, TenKH) có doanh số cao nhất.
select top 3 with ties
    k.TenKH,
    sum(c.SLBan*s.DonGiaBan) as doanhso
from 
    tKhachHang k
    join tHoaDonBan h on k.MaKH = h.MaKH
    join tChiTietHDB c on h.SoHDB = c.SoHDB
    join tSach s on c.MaSach = s.MaSach
group by 
    k.TenKH
order by 
    doanhso desc

--24. In ra danh sách các sách có giá bán bằng 1 trong 3 mức giá cao nhất.
select  
    s.TenSach,
    s.DonGiaBan
from   
    tSach s
where 
    s.DonGiaBan in(
        select distinct top 3
            DonGiaBan
        from
            tSach
        order by 
            DonGiaBan desc
    )

--25. In ra danh sách các sách do NXB Giáo Dục sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
select  
    s.TenSach,
    s.DonGiaBan,
    n.TenNXB
from   
    tSach s
    join tNhaXuatBan n on s.MaNXB=n.MaNXB
where 
    s.DonGiaBan in(
        select distinct top 3
            DonGiaBan
        from
            tSach
        order by 
            DonGiaBan desc
    )
    and
    n.TenNXB=N'NXB Giáo Dục'

