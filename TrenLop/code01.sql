
----1 Đổi tên bảng mới và AND
--select 'Mã sách' = MaSach, TenSach 'Tên Sách' , TacGia as 'Tác Giả'
--from tSach 
--where TacGia = N'Mai Hương' AND DonGiaBan>= 100000 and DonGiaBan<=150000

----2 Cách dùng case
--select MaSach, TenSach, TacGia, DonGiaBan,
--	case
--		when DonGiaBan<90000 then N'Hàng giảm giá'
--		end as Sale
--from tSach

----3 Cách lấy tên kiểu H_ung và H[ ,...]ng
--select 'Mã sách' = MaSach, TenSach 'Tên Sách' , TacGia as 'Tác Giả'
--from tSach 
--where TacGia like N'%H_ng'

--select 'Mã sách' = MaSach, TenSach 'Tên Sách' , TacGia as 'Tác Giả'
--from tSach 
--where TacGia like N'%H[ư,ồ]ng'

--4 ORDER BY
select DonGiaBan, DonGiaNhap
from tSach 
order by DonGiaBan, DonGiaNhap desc