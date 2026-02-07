--26. Tính tổng số đầu sách do NXB Giáo Dục xuất bản.
select 
    count(s.MaSach) as TongSoDauSach
from 
    tSach s
    join tNhaXuatBan n on s.MaNXB = n.MaNXB
where 
    n.TenNXB = N'NXB Giáo Dục'

--27. Tính tổng số sách của từng NXB.

--c1
select 
    n.TenNXB,
    count(s.MaSach) as TongSoDauSach
from 
    tSach s
    join tNhaXuatBan n on s.MaNXB = n.MaNXB
group by 
    n.TenNXB

--c2
select 
    n.TenNXB,
    count(s.MaSach) as TongSoDauSach -- COUNT bỏ qua NULL nên sẽ trả về 0, rất chuẩn
from 
    tNhaXuatBan n  -- Lấy bảng NXB làm gốc (bên trái)
    left join tSach s on n.MaNXB = s.MaNXB -- Để không bị mất NXB chưa có sách
group by 
    n.TenNXB;

--28. Với từng NXB, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
select 
    n.TenNXB,
    min(s.DonGiaBan) as min,
    max(s.DonGiaBan) as max,
    avg(s.DonGiaBan) as avg
from 
    tNhaXuatBan n  -- Lấy bảng NXB làm gốc (bên trái)
    LEFT JOIN tSach s ON n.MaNXB = s.MaNXB -- Để không bị mất NXB chưa có sách
group by 
    n.TenNXB

--36. Tìm sách có tổng số lượng bán ra thấp nhất trong năm 2014.
--> Lấy bảng(mã sách, số lượng được bán) --> Lấy top 1

select top 1 with ties
    s.MaSach,
    s.TenSach,
    isnull(sum(ban.SLBan), 0) as TongSL
from 
    tSach s
    left join (
        -- Lọc riêng dữ liệu bán trong năm 2014 trước
        select 
            c.MaSach, 
            c.SLBan
        from 
            tChiTietHDB c 
            join tHoaDonBan h on c.SoHDB = h.SoHDB
        where 
            year(h.NgayBan) = 2014
    ) as ban on s.MaSach = ban.MaSach
group by 
    s.MaSach, 
    s.TenSach
order by 
    TongSL asc;

--46. Đưa ra thông tin toàn bộ sách, nếu sách được bán trong năm 2014 thì đưa ra SL bán
--> tạo cái bảng (mã sách, số lượng bán 2014) --> left join để lấy thông tin sách
select 
    s.*, 
    ban.TongSLBan
from 
    tSach s
    left join (
        select 
            c.MaSach, 
            sum(c.SLBan) as TongSLBan
        from 
            tChiTietHDB c
            join tHoaDonBan h on c.SoHDB = h.SoHDB
        where 
            year(h.NgayBan) = 2014
        group by 
            c.MaSach
    ) as ban on s.MaSach = ban.MaSach;