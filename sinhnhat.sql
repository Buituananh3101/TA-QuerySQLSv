-- 1. Bổ sung thêm cột MADV (Kiểu dữ liệu phải giống bên bảng DONVI)
ALTER TABLE NHANVIEN 
ADD MADV char(10)
GO

-- 2. Sửa cột DIACHI cho phép nhận giá trị NULL
-- (Lưu ý: nvarchar(100) là ví dụ, bạn chỉnh lại độ dài cho đúng với bảng cũ của bạn)
ALTER TABLE NHANVIEN 
ALTER COLUMN DIACHI nvarchar(100) NULL


-- 3. Xóa cột NgaySinh
ALTER TABLE NHANVIEN 
DROP COLUMN NgaySinh
GO

-- 4. Định nghĩa khóa chính cho cột MANV
-- (Điều kiện: Cột MANV phải được khai báo NOT NULL từ trước)
ALTER TABLE NHANVIEN 
ADD PRIMARY KEY (MANV)
GO

-- 5. Định nghĩa khóa ngoài liên kết sang bảng DONVI
ALTER TABLE NHANVIEN 
ADD CONSTRAINT fk_NHANVIEN_DONVI FOREIGN KEY (MADV) REFERENCES DONVI(MADV)
GO

ALTER TABLE DIEMTHI 
ADD FOREIGN KEY (MaMonHoc) 
REFERENCES MONHOC(MaMonHoc)

ALTER TABLE DIEMTHI 
ADD CONSTRAINT fk_DIEMTHI_MONHOC 
FOREIGN KEY (MaMonHoc) 
REFERENCES MONHOC(MaMonHoc)