-- 26.  Đưa ra danh sách các học phần mà sinh viên có mã sinh viên là '212606016' chưa 
-- hoàn thành (có điểm dưới tổng kết học phần dưới 4 hoặc chưa đăng ký học) theo một 
-- chương trình đào tạo. 


-- Mắc bẫy
select 
    h.MaHocPhan,
    h.TenHocPhan
from    
    SinhVien s
    join LopHocPhan_SinhVien ls on s.MaSinhVien = ls.MaSinhVien
    join HocPhan h on ls.MaHocPhan = h.MaHocPhan
where 
    s.MaSinhVien = '212606016'
    and 
    ls.DiemTKHP < 4.0

-- 1. Vấn đề "Chưa đăng ký học" (Quan trọng nhất)
-- Đề bài yêu cầu tìm môn chưa hoàn thành (điểm < 4 hoặc chưa đăng ký học).
-- Nếu bạn dùng DiemTKHP < 4: Bạn bắt buộc phải JOIN với bảng LopHocPhan_SinhVien. Nhưng bảng này chỉ lưu dữ liệu của những môn sinh viên đã đăng ký. Những môn thuộc chương trình đào tạo (CTDT) mà sinh viên chưa từng học sẽ không hề tồn tại trong bảng này, do đó chúng sẽ bị loại bỏ hoàn toàn khỏi kết quả.
-- Cách của Subquery: Chúng ta lấy Tập hợp A (Toàn bộ môn học bắt buộc trong CTDT) trừ đi Tập hợp B (Những môn sinh viên đã thi đậu với điểm >= 4). Kết quả còn sót lại chắc chắn sẽ bao gồm 2 nhóm: Môn đã học nhưng rớt (điểm < 4) + Môn chưa từng đăng ký.

-- 2. Vấn đề "Học lại môn" (Bẫy logic dữ liệu)
-- Giả sử sinh viên học môn Toán lần 1 được 3 điểm, sau đó đăng ký học lại lần 2 được 6 điểm. Trong bảng LopHocPhan_SinhVien lúc này sẽ có 2 dòng dữ liệu cho môn Toán của sinh viên đó.
-- Nếu bạn dùng JOIN và điều kiện DiemTKHP < 4: Hệ thống sẽ quét thấy dòng dữ liệu lần 1 (3 điểm) và lập tức kết luận: "À, sinh viên này chưa hoàn thành môn Toán", trong khi thực tế họ đã đậu ở lần học lại rồi.
-- Cách của Subquery (NOT IN): Hệ thống sẽ kiểm tra xem có bất kỳ lần học nào của môn Toán mà điểm >= 4 không. Vì lần 2 được 6 điểm, môn Toán được đưa vào danh sách "Đã đậu" và bị loại trừ hoàn toàn khỏi danh sách "Chưa hoàn thành". Rất an toàn và chuẩn xác!

-- Cách làm đúng

-- SubQuery : lấy các MaHocPhan sinh viên này done 
select 
    ls.MaHocPhan 
from 
    LopHocPhan_SinhVien ls
where 
    ls.MaSinhVien = '212606016' 
    and ls.DiemTKHP >= 4.0

-- Lấy tất cả MaHocPhan thuộc CTDT của sinh viên này
select 
    h.MaHocPhan, 
    h.TenHocPhan
from 
    CTDT_HocPhan ch
    join HocPhan h on ch.MaHocPhan = h.MaHocPhan
    join SinhVien s on ch.MaCTDT = s.MaCTDT
where 
    s.MaSinhVien = '212606016'
    and 
    h.MaHocPhan not in (
        -- Loại trừ những môn mà sinh viên đã thi đạt (>= 4.0)
        select 
            ls.MaHocPhan 
        from 
            LopHocPhan_SinhVien ls
        where 
            ls.MaSinhVien = '212606016' 
            and ls.DiemTKHP >= 4.0
    )

