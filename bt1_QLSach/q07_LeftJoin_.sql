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
SELECT 
    n.TenNXB,
    COUNT(s.MaSach) as TongSoDauSach -- COUNT bỏ qua NULL nên sẽ trả về 0, rất chuẩn
FROM 
    tNhaXuatBan n  -- Lấy bảng NXB làm gốc (bên trái)
    LEFT JOIN tSach s ON n.MaNXB = s.MaNXB -- Để không bị mất NXB chưa có sách
GROUP BY 
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
