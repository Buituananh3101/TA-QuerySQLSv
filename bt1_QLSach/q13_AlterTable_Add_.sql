
--39. Thêm trưởng tổng tiền cho bảng tHoaDonBan rồi cập nhật tổng tiền của hóa đơn cho trường này.

--Thêm cột
alter table tHoaDonBan
add TongTien money; -- Hoặc DECIMAL(18,0) tùy định dạng tiền tệ bạn muốn

--Thêm dữ liệu cho cột
update tHoaDonBan -- Cập nhật dữ liệu cho bảng hóa đơn bán
set TongTien = ( -- Gán giá trị cho cột TongTien bằng kết quả của truy vấn con (Subquery)
    select 
        isnull(sum(c.SLBan * s.DonGiaBan), 0) -- Tính tổng (Số lượng * Đơn giá), nếu không có dữ liệu (NULL) thì trả về 0
    from 
        tChiTietHDB c -- Từ bảng chi tiết hóa đơn
        join tSach s on c.MaSach = s.MaSach -- Kết nối với bảng Sách để lấy đơn giá bán
    where 
        c.SoHDB = tHoaDonBan.SoHDB -- Truy vấn con tương quan: Chỉ tính tổng cho số hóa đơn tương ứng với dòng đang được cập nhật
);

--40. Giảm 10% trên tổng hóa đơn cho các hóa đơn có trị giá trên 500.000 trong tháng 9/2014 (mix 39)

update tHoaDonBan
set TongTien = TongTien * 0.9
where 
    month(NgayBan) = 4          -- Sửa thành tháng 9
    and year(NgayBan) = 2014
    and TongTien > 500000;        -- Dùng luôn cột TongTien đã có, nhớ là dấu >

--41. Tính tổng số lượng sách nhập trong năm 2014

select 
    year(h.NgayNhap),
    sum(c.SLNhap)
from 
    tHoaDonNhap h 
    join tChiTietHDN c on h.SoHDN=c.SoHDN
where 
    year(h.NgayNhap)=2014
group by 
    year(h.NgayNhap)

--42. Tính tổng số lượng sách bán trong năm 2014

select 
    sum(c.SLBan) as TongSoLuongBan
from 
    tHoaDonBan h 
    join tChiTietHDB c on h.SoHDB = c.SoHDB
where 
    year(h.NgayBan) = 2014;

--43. Tính tổng tiền đã nhập trong năm 2014
select 
    sum(c.SLNhap*s.DonGiaNhap) 
from 
    tHoaDonNhap h 
    join tChiTietHDN c on h.SoHDN = c.SoHDN
    join tSach s on c.MaSach=s.MaSach
where 
    year(h.NgayNhap) = 2014;

