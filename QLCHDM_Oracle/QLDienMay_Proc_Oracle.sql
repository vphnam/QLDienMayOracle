---Proc tạo thẻ cho khách hàng---
CREATE OR REPLACE PROCEDURE Tao_The_Cho_Khach_Hang (ma_khach_hang CHAR) AS
check_kh NUMBER;
dem_the NUMBER;
   BEGIN
   SELECT COUNT(MaKhachHang) INTO check_kh FROM KhachHang WHERE MaKhachHang = ma_khach_hang;
   IF check_kh > 0 THEN
    SET TRANSACTION READ WRITE;
        SELECT COUNT(MaThe) INTO dem_the FROM TheTichDiem WHERE MaKhachHang = ma_khach_hang;
        IF dem_the > 0 THEN raise_application_error(-20002,'Lỗi: Khách hàng đã có thẻ tích điểm!');
        ELSE
            INSERT INTO TheTichDiem(MaThe,MaKhachHang,Hang,NgayTao,Diem,TrangThai) VALUES('1',ma_khach_hang,'H0001',CURRENT_DATE,0,0);
            COMMIT;
        END IF;
    ELSE
        raise_application_error(-20001,'Lỗi: Mã khách hàng không tồn tại!');
    END IF;
   END;

EXECUTE Tao_The_Cho_Khach_Hang('KH00000001');
SELECT * FROM TheTichDiem;

---Proc tạo thẻ cho khách hàng---
CREATE OR REPLACE PROCEDURE Tao_Don_Hang_Online (ma_khach_hang IN CHAR, ma_voucher IN CHAR, tong_gia_tri_don IN DECIMAL, ma_don OUT NUMBER) IS
check_kh NUMBER;
ngay_bd TIMESTAMP;
ngay_kt TIMESTAMP;
dem_the NUMBER;
ma_cua_hang CHAR(5);
   BEGIN
    ---if input is not null
    IF ma_khach_hang IS NOT NULL AND tong_gia_tri_don IS NOT NULL THEN
        ---check ma khach hang
        SELECT COUNT(MaKhachHang) INTO check_kh FROM KhachHang WHERE MaKhachHang = ma_khach_hang;
        ---neu ma khach hang khong ton tai
        IF(check_kh = 0) THEN
            raise_application_error(-20001,'Lỗi: Mã khách hàng không tồn tại!');
        END IF;
        ---neu co voucher
        IF ma_voucher IS NOT NULL THEN
            SELECT NgayBatDau INTO ngay_bd FROM VOUCHER WHERE MaVoucher = ma_voucher;
            SELECT NgayKetThuc INTO ngay_kt FROM VOUCHER WHERE MaVoucher = ma_voucher;
            ---kiem tra voucher con date khong
            IF (ngay_bd > CURRENT_DATE OR ngay_kt < CURRENT_DATE) THEN
                raise_application_error(-20001,'Lỗi: Thời gian đặt không nằm trong phạm vi của voucher(Voucher đã quá hạn hoặc chưa tới)!');
                END IF;---end check date voucher
        END IF;---end neu co voucher
        ---Lay cua hang gan khach nhat
        SELECT MaCuaHang INTO ma_cua_hang FROM CuaHang, KhachHang WHERE CuaHang.ThanhPho = KhachHang.ThanhPho AND MaKhachHang = ma_khach_hang;
        
   END IF;---end neu input not null
   END;
DECLARE 
M1 CHAR(5) := 'BB';
M2 CHAR(5) := 'HAPPY2021';
M3 DECIMAL := 40;
DECLARE 
ma NUMBER;
BEGIN
    Tao_Don_Hang_Online('KH00000001','HAPPY2021',40,ma);
END;

