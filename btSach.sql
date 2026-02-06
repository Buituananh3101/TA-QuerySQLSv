--01 JOIN
SELECT tSach.MaSach, tSach.TenSach
FROM tSach
JOIN tNhaXuatBan ON tSach.MaNXB = tNhaXuatBan.MaNXB
WHERE tNhaXuatBan.TenNXB = N'NXB Giáo Dục';

--02 bắt đầu là “Ngày”.
SELECT *
FROM tSach
WHERE TenSach LIKE N'Ngày%';

--03 JOIN
SELECT tSach.MaSach, tSach.TenSach
FROM tSach
JOIN tNhaXuatBan ON tSach.MaNXB = tNhaXuatBan.MaNXB
WHERE tNhaXuatBan.TenNXB = N'NXB Giáo Dục'
 AND tSach.DonGiaBan BETWEEN 100000 AND 150000;

--04 
SELECT tSach.MaSach, tSach.TenSach
FROM tSach JOIN tNhaXuatBan ON tSach.MaNXB = tNhaXuatBan.MaNXB
WHERE tNhaXuatBan.TenNXB = N'NXB Giáo Dục' or tNhaXuatBan.TenNXB = N'NXB Trẻ'
 AND tSach.DonGiaBan BETWEEN 90000 AND 140000;

