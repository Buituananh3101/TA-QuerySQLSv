--18. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu?

--Bài Sai
select 
    min(c.SLBan*s.DonGiaBan),
    max(c.SLBan*s.DonGiaBan)
from 
    tChiTietHDB c  
    join tSach s on c.MaSach=s.MaSach

--Bài đúng
select 
    min(TriGia) as ThapNhat,
    max(TriGia) as CaoNhat
from 
    (
        select 
            sum(c.SLBan * s.DonGiaBan) as TriGia
        from 
            tChiTietHDB c
            join tSach s on c.MaSach = s.MaSach
        group by 
            c.SoHDB

    ) as bangTam

--19. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2014 là bao nhiêu?
--> lấy giá của all mã sách năm 2014 --> tổng các mã trong 1 đơn --> tính trung bình

select 
    avg(bang.giatri)
from
    (
        select 
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

--20. Tính doanh thu bán hàng trong năm 2014.

select 
    sum(bang.giatri)
from
    (
        select 
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

