--44. Xóa những hóa đơn do nhân viên "Trần Huy" lập (lưu ý xóa chi tiết hóa đơn trước)

delete from tChiTietHDB
where SoHDB in (
    select h.SoHDB
    from tHoaDonBan h
    join tNhanVien n on h.MaNV = n.MaNV
    where n.TenNV = N'Trần Huy'
);

delete from tHoaDonBan
where MaNV in (
    select MaNV 
    from tNhanVien 
    where TenNV = N'Trần Huy'
);
