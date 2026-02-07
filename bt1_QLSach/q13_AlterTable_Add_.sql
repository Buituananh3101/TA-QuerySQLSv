
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

--40. Giảm 10% trên tổng hóa đơn cho các hóa đơn có trị giá trên 500.000 trong tháng 9/2014

update tHoaDonBan
set TongTien = TongTien * 0.9
where 
    month(NgayBan) = 9            -- Sửa thành tháng 9
    and year(NgayBan) = 2014
    and TongTien > 500000;        -- Dùng luôn cột TongTien đã có, nhớ là dấu >




update tHoaDonBan
set TongTien = TongTien * 0.9
where 
    month(NgayBan) = 9            -- Sửa thành tháng 9
    and year(NgayBan) = 2014
    and TongTien > 500000;        -- Dùng luôn cột TongTien đã có, nhớ là dấu >