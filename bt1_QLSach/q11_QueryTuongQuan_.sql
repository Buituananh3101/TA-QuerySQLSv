--Correlated Subquery(Truy vấn con tương quan)

--37. Mỗi NXB, tìm sách (MaSach,TenSach) có giá bán cao nhất
 
select 
    s.MaNXB, 
    s.MaSach, 
    s.TenSach, 
    s.DonGiaBan
from 
    tSach s
where 
    s.DonGiaBan = (
        select max(DonGiaBan)
        from tSach s2
        where s2.MaNXB = s.MaNXB    
    );
