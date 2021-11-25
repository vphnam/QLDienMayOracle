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

---Proc tạo đơn hàng online---
CREATE OR REPLACE PROCEDURE Tao_Don_Hang_Online (ma_khach_hang IN CHAR, ma_voucher IN CHAR, tong_gia_tri_don IN DECIMAL, ma_don OUT CHAR) IS
check_kh NUMBER;
ngay_bd TIMESTAMP;
ngay_kt TIMESTAMP;
ma_cua_hang CHAR(5);
DEMDH NUMBER;
ID CHAR(10);
CHUOISOKHONG VARCHAR(8) := '0';
I NUMBER := 0;
DEMID NUMBER;
LENGTHID NUMBER;
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
        SELECT MaCuaHang INTO ma_cua_hang FROM CuaHang, KhachHang WHERE CuaHang.ThanhPho = KhachHang.ThanhPho AND MaKhachHang = ma_khach_hang fetch first 1 row only;
        SET TRANSACTION READ WRITE;
            SELECT COUNT(MaDonHang)INTO DEMDH FROM DonHang;
            DEMDH := DEMDH +  1;
            LENGTHID := (10 - ((LENGTH(DEMDH) + LENGTH('DH'))));
            WHILE(I < LENGTHID - 1)
            LOOP
                CHUOISOKHONG := CONCAT(CHUOISOKHONG,'0');
                I := I + 1;
            END LOOP;
            ID := CONCAT('DH',CHUOISOKHONG||DEMDH);
            SELECT COUNT(MaDonHang) INTO DEMID FROM DonHang WHERE MaDonHang = ID;
            WHILE(DEMID <> 0)
            LOOP
                DEMDH := DEMDH + 1;
                CHUOISOKHONG := '0';
                I := 0;
                LENGTHID := 10 - ((LENGTH(DEMDH) + LENGTH('DH')));
                WHILE (I < LENGTHID - 1)
                LOOP
                     CHUOISOKHONG := CONCAT(CHUOISOKHONG,'0');
                    I := I + 1;
                END LOOP;
                ID := CONCAT('DH',CHUOISOKHONG||DEMDH);
                SELECT COUNT(MaDonHang) INTO DEMID FROM DonHang WHERE MaDonHang = ID;
            END LOOP;
            INSERT INTO DonHang(MaDonHang,NhanVienPhuTrach,MaKhachHang,MaCuaHang,ThoiGianTao,MaVoucher,Loai,TinhTrangXacNhan,TinhTrangThanhToan,TinhTrangGiaoHang,TongGiaTri)
            VALUES(ID,null,ma_khach_hang,ma_cua_hang,CURRENT_DATE,ma_voucher,0,null,null,null,tong_gia_tri_don);
            ma_don := ID;
            COMMIT; 
   END IF;---end neu input not null
   EXCEPTION
        WHEN OTHERS THEN 
        ROLLBACK;
        DBMS_OUTPUT.put_line('Xay ra loi');
   END;


DECLARE
madh1 CHAR(10);
madh2 CHAR(10);
madh3 CHAR(10);
BEGIN
    Tao_Don_Hang_Online('KH00000001','HAPPY2021',38052000,madh1); 
    DBMS_OUTPUT.put_line(madh1);
    Tao_Don_Hang_Online('KH00000001',NULL,12990000,madh2);
    DBMS_OUTPUT.put_line(madh2);
    Tao_Don_Hang_Online('KH00000002',NULL,37990000,madh3); 
    DBMS_OUTPUT.put_line(madh3);
    INSERT INTO ChiTietDonHang(MaDonHang,MaSanPham,SoLuong,DonGia,ThanhTien)VALUES(madh1,'SP00000001',2,12990000.00,25980000);
    INSERT INTO ChiTietDonHang(MaDonHang,MaSanPham,SoLuong,DonGia,ThanhTien) VALUES(madh1,'SP00000004',1,16300000,16300000);
    INSERT INTO ChiTietDonHang(MaDonHang,MaSanPham,SoLuong,DonGia,ThanhTien) VALUES(madh2,'SP00000001',1,12990000,12990000);
    INSERT INTO ChiTietDonHang(MaDonHang,MaSanPham,SoLuong,DonGia,ThanhTien)VALUES(madh3,'SP00000002',1,37990000,37990000);
END;

SELECT * FROM DonHang;
SELECT * FROM ChiTietDonHang;
DELETE FROM ChiTietDonHang;
SELECT * FROM KhachHang;
DELETE FROM DonHang;
COMMIT;


---Proc xác nhận đơn hàng---
CREATE OR REPLACE PROCEDURE Xac_Nhan_Don_Hang (ma_don_hang IN CHAR, ma_nhan_vien IN CHAR, tinh_trang_xac_nhan IN NUMBER) IS
tinh_trang_hien_tai NUMBER(1);
   BEGIN
        SET TRANSACTION READ WRITE;
            ---kiem tra tinh trang hien tai
            SELECT TinhTrangXacNhan INTO tinh_trang_hien_tai FROM DonHang WHERE MaDonHang = ma_don_hang;
            ---neu tinh trang xac nhan input la true
            IF(tinh_trang_hien_tai IS NULL AND ma_don_hang IS NOT NULL AND ma_nhan_vien IS NOT NULL and tinh_trang_xac_nhan = 0) THEN
                UPDATE DonHang SET TinhTrangXacNhan = tinh_trang_xac_nhan, NhanVienPhuTrach = ma_nhan_vien WHERE MaDonHang = ma_don_hang;
                COMMIT;
                ---neu tinh trang xac nhan input la false
            ELSE IF(tinh_trang_hien_tai IS NULL AND ma_don_hang IS NOT NULL AND ma_nhan_vien IS NOT NULL and tinh_trang_xac_nhan = 1) THEN
                UPDATE DonHang SET TinhTrangXacNhan = tinh_trang_xac_nhan, TinhTrangThanhToan = tinh_trang_xac_nhan, 
                TinhTrangGiaoHang = tinh_trang_xac_nhan, NhanVienPhuTrach = ma_nhan_vien WHERE MaDonHang = ma_don_hang;
                COMMIT;
            ELSE
                raise_application_error(-20001,'Lỗi: Input sai, kiểm tra lại!');
                END IF;
            END IF;---end kiem tra
        EXCEPTION
            WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20001,'Lỗi: Input sai hoặc tình trạng đã được cập nhật, kiểm tra lại!');
   END;
EXECUTE Xac_Nhan_Don_Hang('DH00000001','NV00000001',0);
EXECUTE Xac_Nhan_Don_Hang('DH00000003','NV00000001',0);
SELECT * FROM DonHang WHERE MaDonHang = 'DH00000001';
UPDATE DonHang SET TinhTrangXacNhan = NULL, TinhTrangThanhToan = NULL, 
                    TinhTrangGiaoHang = NULL, NhanVienPhuTrach = NULL WHERE MaDonHang = 'DH00000001';

---Proc thanh toán đơn hàng---
CREATE OR REPLACE PROCEDURE Thanh_Toan_Don_Hang (ma_don_hang IN CHAR, ma_nhan_vien IN CHAR, tinh_trang_thanh_toan IN NUMBER) IS
tinh_trang_hien_tai NUMBER(1);
   BEGIN
        SET TRANSACTION READ WRITE;
            ---kiem tra tinh trang hien tai
            SELECT TinhTrangThanhToan INTO tinh_trang_hien_tai FROM DonHang WHERE MaDonHang = ma_don_hang;
            ---neu tinh trang xac nhan input la true
            IF(tinh_trang_hien_tai IS NULL AND ma_don_hang IS NOT NULL AND ma_nhan_vien IS NOT NULL and tinh_trang_thanh_toan = 0) THEN
                UPDATE DonHang SET TinhTrangThanhToan = tinh_trang_thanh_toan, NhanVienPhuTrach = ma_nhan_vien WHERE MaDonHang = ma_don_hang;
                COMMIT;
                ---neu tinh trang xac nhan input la false
            ELSE IF(tinh_trang_hien_tai IS NULL AND ma_don_hang IS NOT NULL AND ma_nhan_vien IS NOT NULL and tinh_trang_thanh_toan = 1) THEN
                UPDATE DonHang SET TinhTrangThanhToan = tinh_trang_thanh_toan, 
                TinhTrangGiaoHang = tinh_trang_thanh_toan, NhanVienPhuTrach = ma_nhan_vien WHERE MaDonHang = ma_don_hang;
                COMMIT;
            ELSE
                raise_application_error(-20001,'Lỗi: Input sai, kiểm tra lại!');
                END IF;
            END IF;---end kiem tra
        EXCEPTION
            WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20001,'Lỗi: Input sai hoặc tình trạng đã được cập nhật, kiểm tra lại!');
   END;
   
EXECUTE Thanh_Toan_Don_Hang('DH00000001','NV00000001',0);
EXECUTE Thanh_Toan_Don_Hang('DH00000003','NV00000001',0);
SELECT * FROM DonHang WHERE MaDonHang = 'DH00000001';
UPDATE DonHang SET TinhTrangThanhToan = NULL, TinhTrangGiaoHang = NULL, NhanVienPhuTrach = NULL WHERE MaDonHang = 'DH00000001';
COMMIT;

---Proc xuất kho---
CREATE OR REPLACE PROCEDURE Xuat_Phieu_Xuat (nhan_vien_tao_phieu IN CHAR, ma_don_hang IN CHAR) IS
---declare bien kiem tra
check_phieu NUMBER := 0;
ma_cua_hang CHAR(5);
count_kho NUMBER;
---declare flag
flag_stop_cursor NUMBER := 0;
flag_commit NUMBER;
---declare bien tam chi tiet kho
dem NUMBER;
dem_px NUMBER := -1;
ma_sp CHAR(10);
sl NUMBER;
check_sl NUMBER;
---declare bien tam kho
ma_kho CHAR(5);
truong_kho CHAR(10);
ma_px CHAR(10);
---declare cursor
c_dh_sp CHAR(10); 
c_dh_sl NUMBER; 
c_dh_dongia DECIMAL;
CURSOR c_ctdh is SELECT MaSanPham, SoLuong, DonGia FROM ChiTietDonHang WHERE MaDonHang = ma_don_hang;
   BEGIN
        SET TRANSACTION READ WRITE;
            ---kiem tra don hang xuat kho chua
            if nhan_vien_tao_phieu IS NOT NULL or ma_don_hang is not null then 
                SELECT COUNT (MaPhieuXuat) INTO check_phieu FROM PhieuXuat where MaDonHang = ma_don_hang;
                if check_phieu > 0 then 
                    raise_application_error(-20001,'Lỗi: Đơn hàng đã được xuất kho!'); 
                else       
                    ---chua xuat phieu thi:
                    ---lay ma cua hang
                    SELECT MaCuaHang INTO ma_cua_hang FROM DonHang WHERE MaDonHang = ma_don_hang;
                    ---dem xem cua hang co may kho:
                    SELECT COUNT(MaKho) INTO count_kho FROM Kho WHERE MaCuaHang = ma_cua_hang;
                    ---mo cursor duyet tung san pham trong don hang
                    OPEN c_ctdh; 
                    LOOP 
                    FETCH c_ctdh into c_dh_sp, c_dh_sl, c_dh_dongia; 
                        EXIT WHEN c_ctdh%notfound OR flag_stop_cursor = 1;                  
                        ---voi moi san pham trong don hang
                        ---neu cua hang chi co mot kho
                        dem := 1;
                            WHILE dem <= count_kho
                            LOOP        
                                SELECT MaKho INTO ma_kho FROM (SELECT ROWNUM AS STT, k.MaKho FROM Kho k WHERE k.MaCuaHang = ma_cua_hang) WHERE STT = dem;
                                SELECT COUNT(SoLuong) INTO check_sl FROM ChiTietKho WHERE MaKho = ma_kho AND MaSanPham = c_dh_sp;
                                IF check_sl = 0 THEN
                                    --khong lam gi ca, kiem tra kho tiep theo
                                    dem := dem + 1;
                                    ELSE--- neu so luong > 0(kho nay co san pham do)
                                    ---lay so luong ra kiem tra
                                    SELECT SoLuong INTO sl FROM ChiTietKho WHERE MaKho = ma_kho AND MaSanPham = c_dh_sp;
                                    IF(c_dh_sl <= sl) THEN---neu so luong trong kho du thi
                                        ---kiem tra xem co phieu xuat cho kho nay o don hang nay chua
                                        SELECT COUNT (MaPhieuXuat) INTO check_phieu FROM PhieuXuat where MaDonHang = ma_don_hang and MaKho = ma_kho;
                                        SELECT TruongKho INTO truong_kho FROM Kho WHERE MaKho = ma_kho;
                                        IF check_phieu = 0 THEN---chua co phieu thi 
                                            ---dem px
                                            IF dem_px = -1 THEN SELECT COUNT(MaPhieuXuat) + 1 INTO dem_px FROM PhieuXuat;
                                            ELSE
                                                dem_px := dem_px + 1;
                                            END IF;---end dem px
                                            INSERT INTO PhieuXuat(MaPhieuXuat,NhanVienTaoPhieu,NhanVienTruongKho,MaKho,MaDonHang,ThoiGianTao,TongGiaTri,TrangThai) 
                                            VALUES(TO_CHAR(dem_px),nhan_vien_tao_phieu,truong_kho,ma_kho,ma_don_hang,CURRENT_DATE,0,0);
                                            UPDATE ChiTietKho SET SoLuong = SoLuong - c_dh_sl WHERE MaKho = ma_kho AND MaSanPham = c_dh_sp;                                  
                                            SELECT MaPhieuXuat INTO ma_px FROM PhieuXuat WHERE MaDonHang = ma_don_hang AND MaKho = ma_kho;
                                            INSERT INTO ChiTietPhieuXuat(MaPhieuXuat,MaSanPham,SoLuong)VALUES(ma_px,c_dh_sp,c_dh_sl);
                                            UPDATE PhieuXuat SET TongGiaTri = TongGiaTri + (c_dh_sl * c_dh_dongia) WHERE MaPhieuXuat = ma_px;
                                            c_dh_sl := 0;
                                        ELSE
                                            SELECT MaPhieuXuat INTO ma_px FROM PhieuXuat WHERE MaDonHang = ma_don_hang AND MaKho = ma_kho;
                                            UPDATE ChiTietKho SET SoLuong = SoLuong - c_dh_sl WHERE MaKho = ma_kho AND MaSanPham = c_dh_sp;    
                                            INSERT INTO ChiTietPhieuXuat(MaPhieuXuat,MaSanPham,SoLuong)VALUES(ma_px,c_dh_sp,c_dh_sl);
                                            UPDATE PhieuXuat SET TongGiaTri = TongGiaTri + (c_dh_sl * c_dh_dongia) WHERE MaPhieuXuat = ma_px;
                                            c_dh_sl := 0;
                                        END IF; ---end check phieu
                                        dem := count_kho;
                                    ELSE---neu so luong trong kho khong du thi
                                        ---van kiem tra nhu tren
                                        ---kiem tra xem co phieu xuat cho kho nay o don hang nay chua
                                        SELECT COUNT (MaPhieuXuat) INTO check_phieu FROM PhieuXuat where MaDonHang = ma_don_hang and MaKho = ma_kho;
                                        SELECT TruongKho INTO truong_kho FROM Kho WHERE MaKho = ma_kho;
                                        IF check_phieu = 0 THEN---chua co phieu thi 
                                            IF dem_px = -1 THEN SELECT COUNT(MaPhieuXuat) + 1 INTO dem_px FROM PhieuXuat;
                                            ELSE
                                                dem_px := dem_px + 1;
                                            END IF;---end dem px
                                            INSERT INTO PhieuXuat(MaPhieuXuat,NhanVienTaoPhieu,NhanVienTruongKho,MaKho,MaDonHang,ThoiGianTao,TongGiaTri,TrangThai) 
                                            VALUES(TO_CHAR(dem_px),nhan_vien_tao_phieu,truong_kho,ma_kho,ma_don_hang,CURRENT_DATE,0,0);
                                            ---Cap nhat lai so luong con thieu
                                            c_dh_sl := c_dh_sl - sl;
                                            ---Cap nhat lai so luong kho = 0
                                            UPDATE ChiTietKho SET SoLuong = 0 WHERE MaKho = ma_kho AND MaSanPham = c_dh_sp;                                      
                                            SELECT MaPhieuXuat INTO ma_px FROM PhieuXuat WHERE MaDonHang = ma_don_hang AND MaKho = ma_kho;
                                            INSERT INTO ChiTietPhieuXuat(MaPhieuXuat,MaSanPham,SoLuong)VALUES(ma_px,c_dh_sp,sl);
                                            UPDATE PhieuXuat SET TongGiaTri = TongGiaTri + (sl * c_dh_dongia) WHERE MaPhieuXuat = ma_px;
                                        ELSE
                                            SELECT MaPhieuXuat INTO ma_px FROM PhieuXuat WHERE MaDonHang = ma_don_hang AND MaKho = ma_kho;
                                            ---Cap nhat lai so luong con thieu
                                            c_dh_sl := c_dh_sl - sl;
                                            UPDATE ChiTietKho SET SoLuong = 0 WHERE MaKho = ma_kho AND MaSanPham = c_dh_sp;  
                                            INSERT INTO ChiTietPhieuXuat(MaPhieuXuat,MaSanPham,SoLuong)VALUES(ma_px,c_dh_sp,sl);
                                            UPDATE PhieuXuat SET TongGiaTri = TongGiaTri + (sl * c_dh_dongia) WHERE MaPhieuXuat = ma_px;
                                        END IF; ---end check phieu
                                    END IF;---end kiem tra so luong kho
                                END IF;---end so luong is null       
                                IF (c_dh_sl > 0 and dem = count_kho) THEN
                                    flag_stop_cursor := 1;
                                    flag_commit := 0;
                                ELSE IF (c_dh_sl > 0 and dem < count_kho) THEN 
                                    dem := dem + 1;
                                ELSE    
                                    dem := count_kho + 1;
                                    END IF;
                                END IF;
                            END LOOP;           
                    END LOOP; 
                    CLOSE c_ctdh;
                    IF flag_stop_cursor = 1 THEN
                        ROLLBACK;
                        raise_application_error(-20001,'Lỗi: Kho thuộc cửa hàng không đủ hàng để xuất!');
                    ELSE 
                        COMMIT;
                    END IF;
                end if;---end check phieu
            else
                raise_application_error(-20001,'Lỗi: Input sai!'); 
            END IF;---end kiem tra xuat kho   
   END;
set serveroutput on format wrapped;
EXECUTE Xuat_Phieu_Xuat('NV00000001','DH00000001')
EXECUTE Xuat_Phieu_Xuat('NV00000001','DH00000003')
DELETE FROM PHIEUXUAT;
DELETE FROM CHITIETPHIEUXUAT;
SELECT * FROM CHITIETDONHANG;
SELECT * FROM CHITIETKHO;
SELECT * FROM PHIEUXUAT;
SELECT * FROM CHITIETPHIEUXUAT;
UPDATE CHITIETKHO SET SoLuong = 1 WHERE MaKho = 'K0001' AND MaSanPham = 'SP00000001';

dbms_output.put_line('Bat dau');




           