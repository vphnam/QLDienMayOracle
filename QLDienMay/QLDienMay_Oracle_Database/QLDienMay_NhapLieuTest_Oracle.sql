------NhaCungCap------
INSERT INTO NhaCungCap(TenNCC,MaSoThue,DiaChi)
VALUES(N'Toshiba VietNam','0000000001',N'72 Nguyễn Thị Minh Khai, Phường 6, Quận 3, Thành phố Hồ Chí Minh');
INSERT INTO NhaCungCap(TenNCC,MaSoThue,DiaChi)
VALUES(N'SamSung VietNam','0000000002',N'Bitexco Financial Tower, 2 Hải Triều, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh');
INSERT INTO NhaCungCap(TenNCC,MaSoThue,DiaChi)
VALUES(N'Panasonic VietNam','0000000003',N'28 Nguyễn Thị Diệu, Phường 6, Quận 3, Thành phố Hồ Chí Minh');
INSERT INTO NhaCungCap(TenNCC,MaSoThue,DiaChi)
VALUES(N'LG Electronics VietNam','0000000004',N'233 Đồng Khởi, Quan 1, Quận 1, Thành phố Hồ Chí Minh');
INSERT INTO NhaCungCap(TenNCC,MaSoThue,DiaChi)
VALUES(N'Nhà phân phối Digiworld','0000000005',N'Số 201 – 203 Cách Mạng Tháng 8, Phường 4, Quận 3 Thành phố Hồ Chí Minh');
INSERT INTO NhaCungCap(TenNCC,MaSoThue,DiaChi)
VALUES(N'Sony VietNam','0000000006',N'93 Nguyễn Du');
GO
SELECT * FROM NhaCungCap;
------ThanhPho------
INSERT INTO ThanhPho(TenThanhPho)
VALUES(N'Tp. Hồ Chí Minh');
INSERT INTO ThanhPho(TenThanhPho)
VALUES(N'Hà Nội');
SELECT * FROM ThanhPho;

------KhuyenMai------
INSERT INTO KhuyenMai(TenKM,PhanTramKhuyenMai,NgayBatDau,NgayKetThuc,MoTa)
VALUES(N'Khuyến mãi năm 2021-2022',0.1,'1-JAN-2021','30-DEC-2021',N'Khuyến mãi năm 2021');
INSERT INTO KhuyenMai(TenKM,PhanTramKhuyenMai,NgayBatDau,NgayKetThuc,MoTa)
VALUES(N'Khuyến mãi tháng 12',0.2,'1-DEC-2021-','30-DEC-2021',N'Khuyến mãi 20% tháng 12 2021');
SELECT * FROM KHUYENMAI;

------DanhMuc------
INSERT INTO DanhMuc(TenDanhMuc)
VALUES(N'Tủ lạnh - Tủ mát - Tủ đông');
INSERT INTO DanhMuc(TenDanhMuc)
VALUES(N'Laptop - PC - Máy in - Phụ kiện');
INSERT INTO DanhMuc(TenDanhMuc)
VALUES(N'Tivi - loa - dàn âm thanh');
SELECT * FROM DanhMuc;

------Loai------
INSERT INTO LOAI(MaDanhMuc,TenLoai)
VALUES('DM001',N'Tủ lạnh');
INSERT INTO LOAI(MaDanhMuc,TenLoai)
VALUES('DM001',N'Tủ đông');
INSERT INTO LOAI(MaDanhMuc,TenLoai)
VALUES('DM001',N'Tủ mát');
INSERT INTO LOAI(MaDanhMuc,TenLoai)
VALUES('DM001',N'Side by side');
INSERT INTO LOAI(MaDanhMuc,TenLoai)
VALUES('DM001',N'Mini');
INSERT INTO LOAI(MaDanhMuc,TenLoai)
VALUES('DM001',N'Multi doors');
INSERT INTO LOAI(MaDanhMuc,TenLoai)
VALUES('DM001',N'Ngăn đá trên');
INSERT INTO LOAI(MaDanhMuc,TenLoai)
VALUES('DM001',N'Ngăn đá dưới');
INSERT INTO LOAI(MaDanhMuc,TenLoai)
VALUES('DM001',N'1 cửa');
INSERT INTO LOAI(MaDanhMuc,TenLoai)
VALUES('DM001',N'2 cửa');
INSERT INTO LOAI(MaDanhMuc,TenLoai)
VALUES('DM002',N'Đồ họa');
INSERT INTO LOAI(MaDanhMuc,TenLoai)
VALUES('DM002',N'Gaming');
INSERT INTO LOAI(MaDanhMuc,TenLoai)
VALUES('DM002',N'Văn phòng');
INSERT INTO LOAI(MaDanhMuc,TenLoai)
VALUES('DM002',N'Máy tính bàn');
INSERT INTO LOAI(MaDanhMuc,TenLoai)
VALUES('DM002',N'Máy in');
INSERT INTO LOAI(MaDanhMuc,TenLoai)
VALUES('DM002',N'Phụ kiện');
INSERT INTO LOAI(MaDanhMuc,TenLoai)
VALUES('DM002',N'Laptop');
SELECT * FROM Loai;

------SanPham------
INSERT INTO SanPham(TenSanPham,AnhMinhHoa,DonGia,MaKhuyenMai)
VALUES(N'Tủ lạnh Toshiba Inverter 312 lít GR-RT400WE-PMV(06)-MG',null,12990000,null);
INSERT INTO SanPham(TenSanPham,AnhMinhHoa,DonGia,MaKhuyenMai)
VALUES(N'Tủ lạnh Panasonic Inverter 550 lít NR-DZ600GXVN',null,37990000,null);
INSERT INTO SanPham(TenSanPham,AnhMinhHoa,DonGia,MaKhuyenMai)
VALUES(N'Tủ lạnh Toshiba Inverter 622 lít GR-RF690WE-PGV',null,35990000,'KM00000001');
INSERT INTO SanPham(TenSanPham,AnhMinhHoa,DonGia,MaKhuyenMai)
VALUES(N'Tủ mát Panasonic 460 lít SMR-PT450A',null,16300000,null);
INSERT INTO SanPham(TenSanPham,AnhMinhHoa,DonGia,MaKhuyenMai)
VALUES(N'Laptop Dell Inspiron 7306 i5-1135G7 13.3 inch N3I5202W',null,27890000,null);
SELECT * FROM SanPham;


------ChiTietLoai------
INSERT INTO ChiTietLoai(MaSanPham,MaLoai)
VALUES('SP00000001','L0001');
INSERT INTO ChiTietLoai(MaSanPham,MaLoai)
VALUES('SP00000001','L0007');
INSERT INTO ChiTietLoai(MaSanPham,MaLoai)
VALUES('SP00000002','L0001');
INSERT INTO ChiTietLoai(MaSanPham,MaLoai)
VALUES('SP00000002','L0006');
INSERT INTO ChiTietLoai(MaSanPham,MaLoai)
VALUES('SP00000003','L0001');
INSERT INTO ChiTietLoai(MaSanPham,MaLoai)
VALUES('SP00000003','L0006');
INSERT INTO ChiTietLoai(MaSanPham,MaLoai)
VALUES('SP00000004','L0003');
INSERT INTO ChiTietLoai(MaSanPham,MaLoai)
VALUES('SP00000004','L0009');
INSERT INTO ChiTietLoai(MaSanPham,MaLoai)
VALUES('SP00000005','L0017');

SELECT * FROM ChiTietLoai;
------TinhNang------
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000001',N'Thiết kế sang trọng, bề mặt hoàn thiện tỉ mỉ',N'Tủ lạnh Toshiba Inverter 312 lít GR-RT400WE-PMV(06)-MG sở hữu thiết kế sang trọng, các chi tiết được tinh giảm hết mức tạo nên điểm nhấn mới lạ cho không gian bếp. Điểm đặc biệt là bề mặt tủ được hoàn thiện tối ưu với 10 lớp vật liệu cao cấp xếp chồng mang đến vẻ ngoài tủ tinh tế, chống bám vân tay và hạn chế trầy xước.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000001',N'Công nghệ Origin inverter, tiết kiệm điện năng',N'Tủ lạnh Toshiba Inverter 312 lít GR-RT400WE-PMV(06)-MG sở hữu công nghệ Origin Inverter. Theo đó máy nén inverter và quạt inverter hoạt động đồng bộ với nhau, giúp tủ tiết kiệm điện tối đa, cực kỳ êm ái và duy trì nhiệt độ luôn ổn định. Chắc chắn sẽ là giải pháp tuyệt vời cho hội chị em vào cuối tháng không còn lo lắng tiền điện cuối tháng.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000001',N'Ngăn đá lớn',N'Tủ lạnh Toshiba Inverter 312 lít GR-RT400WE-PMV(06)-MG sở hữu ngăn đá lớn giúp cất trữ thật nhiều thực phẩm tươi sống hơn. Với không gian ngăn đá lớn như vậy, người dùng sẽ thoải mái tiệc tùng.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000001',N'Khí lạnh thác đổ Air Fall Cooling',N'Tủ lạnh Toshiba Inverter 312 lít GR-RT400WE-PMV(06)-MG bổ sung thêm luồng khí lạnh thổi xuống từ phía trước kết hợp luồng khí từ phía sau cho khí lạnh tỏa đều khắp tủ. Điều này giúp thực phẩm luôn tươi ngon dù bạn cất giữ ở vị trí nào trong tủ.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000001',N'Ngăn Cooling Zone',N'Tủ lạnh Toshiba trang bị Ngăn Cooling Zone giúp bảo quản thịt cá từ 1 đến 2 ngày mà không cần rã đông. Điều này giúp quá trình chế biến thuận tiện hơn và giữ nguyên hương vị và chất dinh dưỡng.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000001',N'Công nghệ khử mùi PureBio',N'Tủ lạnh sở hữu công nghệ khử mùi PureBio bằng Ceramic được nhúng tinh thể Bạc (Ag+) để khử mùi, diệt khuẩn cho tủ và giúp bảo vệ sức khỏe người dùng.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000001',N'Ngăn rau củ tùy chỉnh độ ẩm',N'Tủ lạnh Toshiba 312 lít có ngăn rau  quả có thể tùy chỉnh độ ẩm phù hợp nhất cho từng loại thực phẩm, giúp giữ nguyên chất dinh dưỡng.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000002',N'Sang trọng với 4 cửa và không gian lưu trữ lớn',N'Tủ lạnh Panasonic 550 lít NR-DZ600GXVN với thiết kế 4 cửa không chỉ tối ưu hóa không gian lưu trữ thực phẩm và tô điểm cho gian bếp của bạn một vẻ đẹp sang trọng và hiện đại.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000002',N'Công nghệ Inverter',N'Tủ lạnh Panasonic trang bị công nghệ Inverter vận hành bền bỉ, ổn định, êm ái và tiết kiệm đáng kể chi phí điện. Kết hợp cùng cảm biến Econavi tủ lạnh tự động điều chỉnh công suất hoạt động máy nén.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000002',N'Làm lạnh nhanh chóng',N'Tủ lạnh có công nghệ Panorama giúp thổi khí lạnh đến mọi góc của các ngăn tủ, nhanh chóng làm lạnh và giữ độ tươi ngon cho thực phẩm.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000002',N'Công nghệ Ag Clean',N'Công nghệ Ag Clean sử dụng các tinh thể bạc Ag+ sẽ loại bỏ mùi hôi cũng như vi khuẩn gây hại, trả lại không gian trong lành cho thực phẩm bên trong tủ.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000002',N'Ngăn cấp đông mềm',N'Ở nhiệt độ -3 độ C, ngăn cấp đông mềm sẽ giúp đông lạnh bề mặt thịt, cá, để chúng có thể giữ nguyên các dưỡng chất và không bị đóng băng. Ngăn rau quả giữ ẩm Fresh Safe kích thước lớn, bảo quản rau củ tươi ngon như mới vừa mua về.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000003',N'Tủ lạnh Toshiba Inverter 622 lít GR-RF690WE-PGV hiện đại',N'Tủ lạnh Toshiba Inverter 622 lít GR-RF690WE-PGV sở hữu thiết kế sang trọng và đẳng cấp với không gian lưu trữ rộng lớn hứa hẹn sẽ tạo điểm nhấn thêm cho không gian nội thất của gia đình.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000003',N'Tủ lạnh Toshiba Inverter 622 lít tiết kiệm điện hiệu quả',N'Sở hữu chiếc tủ lạnh Inverter này, các bà nội trợ sẽ giảm bớt nỗi lo hóa đơn tiền điện mỗi tháng nhờ công nghệ Dual Inverter hiện đại được trang bị trên tủ lạnh giúp tiết kiệm điện năng hiệu quả. Không chỉ vậy, công nghệ Inverter giảm tối đa tiếng ồn nhưng vẫn duy trì độ lạnh ổn định, giúp máy hoạt động êm ái và bền bỉ.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000003',N'Công nghệ 3 dàn lạnh độc lập',N'Với thiết kế 3 dàn lạnh độc lập, riêng biệt cho từng ngăn, tủ lạnh sẽ giúp cho thực phẩm nhanh chóng đồng thời ngăn chặn không cho hơi lạnh luân chuyển giữa các ngăn, đảm bảo thực phẩm không bị lẫn mùi vào nhau và được tươi ngon lâu hơn trong suốt quá trình bảo quản.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000003',N'Tủ lạnh Toshiba trang bị 26 ngăn chứa',N'Tủ lạnh Toshiba Inverter 622 lít trang bị 26 ngăn chứa mang đến không gian lưu trữ thực phẩm cực lớn cho bạn đừn được nhiều thực phẩm dùng cho cả tuần.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000003',N'Ngăn cấp đông mềm bảo quản thịt cá hiệu quả',N'Tủ lạnh được trang bị ngăn chuyển đổi thông minh Convert Zone cho phép người dùng thay đổi nhiệt độ từ -18 đến 7 độ C, từ ngăn đông thành ngăn mát hoặc ngăn đông mềm và ngược lại, tạo thêm cho bạn nhiều không gian lưu trữ linh hoạt theo nhu cầu sử dụng. Ngăn cấp đông mềm giúp bảo quản thịt cá với nhiệt độ đông mềm -5 độ C giúp thực phẩm không bị đông đá.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000003',N'Công nghệ khử mùi, diệt khuẩn Plasma + Pure',N'Tủ lạnh sủ dụng công nghệ khử mùi Plasma+ Pure với khả năng tạo ra ion âm và ion dương có tác dụng làm giảm hoạt động của vi khuẩn và hấp thụ mùi hôi giúp luồng khí lạnh luôn trong lành, giữ thực phẩm luôn tươi ngon.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000003',N'Màn hình cảm ứng trên tủ lạnh',N'Ngoài những tính năng nổi trội trên, tủ lạnh Toshiba còn trang bị màn hình cảm ứng trên cửa tủ cho bạn dễ dàng điều chỉnh nhiệt độ bên trong tủ lạnh bằng cách nhấn nút. Ngoài ra, hệ thống đèn LED giúp chiếu sáng khắp nội thất bên trong tủ giúp bạn dễ dàng quan sát bên trong tủ lạnh.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000004',N'Thiết kế gọn gàng',N'Tủ mát Panasonic SMR-PT450A có thiết kế hiện đại với 1 cửa đơn giản thuận tiện cho người dùng khi lấy các loại thức uống, giải khát được bảo quản bên trong tủ mát. Sản phẩm được thích hợp sử dụng cho các siêu thị, cửa hàng tiện lợi, bách hóa gia đình.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000004',N'Chất liệu cửa kính',N'Tủ mát có thiết kế cửa bằng chất liệu kính trong suốt dễ dàng cho người dùng có thể thấy và quan sát được loại thức uống đang cần để được ngay. Chất liệu kính trơn nhẵn rất dễ lau chùi và vệ sinh. Tủ mát Panasonic SMR-PT450A 460 lít sử dụng rất tốt và bền.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000004',N'Dung tích lớn 460 lít',N'Tủ mát Panasonic SMR-PT450A có dung tích lưu trữ khá lớn 460 lít với 5 tầng bảo quản cho phép người dùng có thể chứa được nhiều loại nước giải khát hơn. Dễ dàng đặt các loại chai có kích thước khác nhau vào trong tủ mát.',null);
INSERT INTO TinhNang(MaSanPham,TenTinhNang,MoTa,HinhAnh)
VALUES('SP00000004',N'Công suất hoạt động 200W',N'Tủ mát Panasonic SMR-PT450A 460 lít hoạt động tốt và bền bỉ cùng động cơ có công suất 200W giúp làm mát nhanh chóng hơn, các loại thức uống được làm lạnh hiệu quả đáp ứng tốt nhu cầu sử dụng cũng như kinh doanh.',null);
SELECT * FROM TinhNang;
------DacDiemNoiBat------
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000001',N'Tủ lạnh ngăn đá trên dung tích 312L thích hợp cho gia đình 5 - 6 người');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000001',N'Công nghệ Inverter giúp tủ lạnh vận hành êm ái, bền bỉ, tiết kiệm điện');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000001',N'Công nghệ Air Fall Cooling giúp bảo quản thực phẩm tươi ngon đồng đều');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000001',N'Ngăn Cooling Zone bảo quản thịt, cá tươi 1 - 2 ngày không cần rã đông');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000001',N'Ngăn rau quả chỉnh ẩm giúp rau quả tươi ngon, giữ nhiều chất dinh dưỡng');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000001',N'Hệ thống PureBio khử mùi diệt khuẩn giúp không khí trong tủ trong lành');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000002',N'Công nghệ Ag Clean, kháng khuẩn loại bỏ mùi hôi hiệu quả');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000002',N'Tiết kiệm điện với công nghệ Inverter, cảm biến Econavi');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000002',N'Dung tích 550 lít phù hợp với gia đình 4-5 người');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000002',N'Công nghệ đông chuẩn mềm Prime Fresh giữ đông thực phẩm tốt');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000002',N'Ngăn rau củ kép có nhiều không gian lưu trữ hơn');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000003',N'Thiết kế sang trọng hiện đại nân tầm không gian nội thất');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000003',N'Dung tích 622 lít phù hợp với gia đình trên 5 thành viên');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000003',N'Công nghệ Inverter bền bỉ, tiết kiệm điện năng hiệu quả');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000003',N'Công nghệ 3 dàn lạnh độc lập bảo quản thực phẩm tươi ngon');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000003',N'Công nghệ Plasma+ Pure kháng khuẩn, khử mùi hiệu quả');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000003',N'Ngăn chuyển đổi linh hoạt tối ưu không gian chưa thực phẩm');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000003',N'Thiết kế 26 ngăn chứa cho không gian lưu trữ thực phẩm lớn');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000003',N'Đèn LED giúp dễ dàng quan sát bên trong tủ lạnh');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000003',N'Điều chỉnh nhiệt độ bằng nút nhấn bên ngoài màn hình');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000003',N'Ngăn cấp đông mềm -5 độ C bảo quản thịt cá hiệu quả');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000004',N'Thiết kế 1 cửa đơn giản, tiện lợi, dễ dàng đóng/mở');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000004',N'Có 5 ngăn kệ, dễ dàng phân chia các loại nước giải khát');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000004',N'Công suất 200W mạnh mẽ, làm lạnh nhanh chóng');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000004',N'Cửa kính dày và trong suốt, bền bỉ, dễ dàng lau chùi');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000004',N'Trang bị đèn LED giúp chiếu sáng vào buổi tối tiện lợi');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000005',N'Laptop có trọng lượng nhẹ 1.37kg, bản lề có thể gập xoay linh hoạt 360 độ');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000005',N'Bộ xử lý i5-1135G7, 8GB RAM cho hiệu năng mạnh mẽ, đa nhiệt mượt mà');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000005',N'Ổ cứng SSD 512GB cho tốc độ phản hồi nhanh chóng, lưu trữ nhiều hơn');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000005',N'Màn hình 13.3 inch Full HD hiển thị hình ảnh sắc nét, màu sắc sống động');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000005',N'Bàn phím có đèn nền hỗ trợ người dùng trong điều kiện ánh sáng yếu');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000005',N'Laptop trang bị cảm biến vân tay giúp mở máy nhanh chóng chỉ với 1 chạm');
INSERT INTO DacDiemNoiBat(MaSanPham,TenDacDiem)
VALUES('SP00000005',N'Công nghệ Realtek High Definition Audio cho âm thanh chân thực trong trẻo');

SELECT * FROM DacDiemNoiBat;
------ThongSoKiThuat------
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000001',N'Model',N'GR-RT400WE-PMV(06)-MG');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000001',N'Màu sắc',N'Cửa thép xám chống vân tay');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000001',N'Nhà sản xuất',N'Toshiba');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000001',N'Xuất xứ',N'Trung Quốc');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000001',N'Thời gian bảo hành',N'24 Tháng');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000001',N'Địa điểm bảo hành',N'Nguyễn Kim');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000001',N'Kiểu tủ lạnh',N'Ngăn đá trên');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000001',N'Số cửa tủ',N'2');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000001',N'Dung tích tủ lạnh',N'312');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000001',N'Dung tích ngăn đá',N'84');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000001',N'Dung tích ngăn lạnh',N'228');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000001',N'Chất liệu khay',N'Khay bằng kính chịu lực');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000001',N'Công nghệ làm lạnh',N'Air Fall Cooling');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000001',N'Kháng khuẩn / Khử mùi',N'Hệ thống khử mùi diệt khuẩn PureBio');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000001',N'Công nghệ Inverter',N'Công nghệ Origin Inverter');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000001',N'Khối lượng sản phẩm (kg)',N'58 kg');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000001',N'Kích thước sản phẩm',N'595 x 695 x 1620 mm');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000001',N'Kích thước thùng',N'655 x 735 x 1670 mm');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000001',N'Khối lượng thùng (kg)',N'64 kg');

INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Model',N'NR-DZ600GXVN');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Màu sắc',N'Đen');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Nhà sản xuất',N'Panasonic');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Xuất xứ',N'Thái Lan');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Năm ra mắt',N'2019');	
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Thời gian bảo hành',N'12 Tháng');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Địa điểm bảo hành',N'Nguyễn Kim');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Kiểu tủ lạnh',N'Multi doors');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Số cửa tủ',N'4 cửa');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Dung tích tủ lạnh',N'550');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Dung tích ngăn đá',N'156');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Dung tích ngăn lạnh',N'394');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Chất liệu khay',N'Khay bằng kính chịu lực');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Công nghệ làm lạnh',N'Econavi');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Kháng khuẩn / Khử mùi',N'Công nghệ kháng khuẩn Ag Clean với tinh thể bạc Ag+');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Công nghệ Inverter',N'Có');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Chất liệu bên ngoài',N'Mặt gương');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Làm đá tự động',N'Có');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Chuông báo cửa',N'Có');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Khối lượng sản phẩm (kg)',N'112 kg');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000002',N'Kích thước sản phẩm',N'1846 x 805 x 790 mm');

INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000003',N'Model',N'GR-RF690WE');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000003',N'Màu sắc',N'Gương xanh đen');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000003',N'Nhà sản xuất',N'Toshiba');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000003',N'Xuất xứ',N'Trung Quốc');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000003',N'Năm ra mắt',N'2019');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000003',N'Thời gian bảo hành',N'24 Tháng');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000003',N'Địa điểm bảo hành',N'Nguyễn Kim');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000003',N'Kiểu tủ lạnh',N'Multi doors');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000003',N'Số cửa tủ',N'4 cửa');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000003',N'Dung tích tủ lạnh',N'622');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000003',N'Dung tích ngăn đá',N'92');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000003',N'Dung tích ngăn lạnh',N'438 lít + 92 lít');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000003',N'Chất liệu khay',N'Khay bằng kính chịu lực');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000003',N'Công nghệ làm lạnh',N'Econavi');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000003',N'Kháng khuẩn / Khử mùi',N'Hệ thống khử mùi diệt khuẩn Plasma + Pure');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000003',N'Công nghệ Inverter',N'Có');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000003',N'Khối lượng sản phẩm (kg)',N'142 kg');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000003',N'Kích thước sản phẩm',N'905 x 775 x 1935 mm');

INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000004',N'Model',N'SMR-PT450A');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000004',N'Màu sắc',N'Trắng');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000004',N'Nhà sản xuất',N'Panasonic');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000004',N'Xuất xứ',N'Thái Lan');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000004',N'Thời gian bảo hành',N'12 Tháng');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000004',N'Địa điểm bảo hành',N'Nguyễn Kim');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000004',N'Loại tủ',N'Tủ đứng');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000004',N'Số cửa tủ',N'1 cửa');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000004',N'Dung tích',N'460 lít');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000004',N'Công suất',N'200 W');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000004',N'Nhiệt độ',N'0°C ~ 10°C');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000004',N'Loại gas',N'R-134a');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000004',N'Tiết kiệm điện',N'Có');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000004',N'Chất liệu cửa tủ',N'Kính');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000004',N'Kích thước thùng',N'670x642x1998 mm');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000004',N'Khối lượng thùng (kg)',N'110 kg');

INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Model',N'N3I5202W');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Màu sắc',N'Đen');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Nhà sản xuất',N'DELL');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Xuất xứ',N'Trung Quốc');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Thời gian bảo hành',N'12 Tháng');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Địa điểm bảo hành',N'Nguyễn Kim');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'CPU',N'i5-1135G7');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Tốc độ CPU',N'2.40 GHz');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Tốc độ CPU tối đa',N'Turbo Boost 4.2 GHz');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Loại RAM',N'LPDDR4X (On board)');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Dung lượng RAM',N'8 GB');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Loại ổ đĩa cứng',N'SSD 512GB NVMe PCIe');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Chipset card đồ họa',N'Intel Iris Xe Graphics');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Kích thước màn hình',N'13.3 inch');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Độ phân giải màn hình',N'FHD (1920 x 1080)');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Màn hình cảm ứng',N'Có');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Công nghệ âm thanh',N'Realtek High Definition Audio');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Chuẩn WiFi',N'Wi-Fi 6 AX201, Bluetooth v5.0');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Cổng USB',N'1 USB, 1 USB Type C, 1 Thunderbolt 4');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Cổng HDMI',N'Có');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Khe đọc thẻ nhớ',N'1 micro SD card reader');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Kết nối khác laptop',N'1 jack 3.5');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Camera',N'HD webcam');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Chất liệu vỏ',N'Vỏ kim loại nguyên khối');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Tính năng mở rộng',N'Bảo mật vân tay, Có đèn bàn phím');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'HĐH kèm theo máy',N'Win 10 Home');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Độ dày',N'16.74 mm');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Chiều dài',N'305.2 mm');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Chiều rộng',N'206.4 mm');
INSERT INTO ThongSoKiThuat(MaSanPham,TenThongSo,MoTa)
VALUES('SP00000005',N'Khối lượng sản phẩm (kg)',N'1.37 kg');

SELECT * FROM ThongSoKiThuat;
------ChucVu------
INSERT INTO ChucVu(TenChucVu)
VALUES(N'Cửa hàng trưởng');
INSERT INTO ChucVu(TenChucVu)
VALUES(N'Quản lý cửa hàng');
INSERT INTO ChucVu(TenChucVu)
VALUES(N'Kế toán cửa hàng');
INSERT INTO ChucVu(TenChucVu)
VALUES(N'Thu ngân');
INSERT INTO ChucVu(TenChucVu)
VALUES(N'Nhân viên');
INSERT INTO ChucVu(TenChucVu)
VALUES(N'Trưởng kho');

SELECT * FROM ChucVu;
------CuaHang------
INSERT INTO CuaHang(DiaChi,ThanhPho,CuaHangTruong,NgayThanhLap)
VALUES(N'123 Trường Chinh','TP001',null,'6/Oct/2021');
INSERT INTO CuaHang(DiaChi,ThanhPho,CuaHangTruong,NgayThanhLap)
VALUES(N'500 CMT8','TP002',null,'15/Sep/2021');
SELECT * FROM CuaHang;

------NhanVien------
INSERT INTO NhanVien(TenNhanVien,NgaySinh,SDT,Email,DiaChi,GioiTinh,ChucVu,CuaHang,HinhThuc,TaiKhoan,MatKhau,TrangThai)
VALUES(N'Vũ Phạm Hoài Nam','24/Oct/2000','0912452117','hoainam11134@gmail.com',N'20 Đường số 5',0,'CV001','CH001',0,'hoainam11134','123456',0);
INSERT INTO NhanVien(TenNhanVien,NgaySinh,SDT,Email,DiaChi,GioiTinh,ChucVu,CuaHang,HinhThuc,TaiKhoan,MatKhau,TrangThai)
VALUES(N'Nguyễn Văn A','4/Jan/2000','0911445789','nhanvien1@gmail.com',N'20/34/3 CMT8',0,'CV003','CH001',0,'ketoan1','123456',0);
INSERT INTO NhanVien(TenNhanVien,NgaySinh,SDT,Email,DiaChi,GioiTinh,ChucVu,CuaHang,HinhThuc,TaiKhoan,MatKhau,TrangThai)
VALUES(N'Nguyễn Vũ Bảo Huy','12/May/2000','0919558991','huyvu123@gmail.com',N'25 Tên Lửa',0,'CV006','CH001',0,'huyvu11134','123456',0);
INSERT INTO NhanVien(TenNhanVien,NgaySinh,SDT,Email,DiaChi,GioiTinh,ChucVu,CuaHang,HinhThuc,TaiKhoan,MatKhau,TrangThai)
VALUES(N'Huỳnh Trấn Thành','30/Aug/2000','0911052111','huynhtranthanh@gmail.com',N'1 ĐBP',0,'CV001','CH002',0,'tranthanh11134','123456',0);
INSERT INTO NhanVien(TenNhanVien,NgaySinh,SDT,Email,DiaChi,GioiTinh,ChucVu,CuaHang,HinhThuc,TaiKhoan,MatKhau,TrangThai)
VALUES(N'Trần Văn B','8/Jan/2000','0912499117','tranvan123b@gmail.com',N'15 Đường CC1',0,'CV003','CH002',0,'ketoan2','123456',0);
INSERT INTO NhanVien(TenNhanVien,NgaySinh,SDT,Email,DiaChi,GioiTinh,ChucVu,CuaHang,HinhThuc,TaiKhoan,MatKhau,TrangThai)
VALUES(N'Trần Văn C','20/Nov/1996','0998554123','mrcvippro@gmail.com',N'57/13 Đường CC1',0,'CV006','CH002',0,'truongkho2','123456',0);

UPDATE CuaHang SET CuaHangTruong = 'NV00000001' WHERE MaCuaHang = 'CH001';
UPDATE CuaHang SET CuaHangTruong = 'NV00000004' WHERE MaCuaHang = 'CH002';

SELECT * FROM NhanVien;
SELECT MaCuaHang, CuaHangTruong FROM CuaHang, NhanVien WHERE CuaHang.CuaHangTruong = NhanVien.MaNhanVien;

------Kho------
INSERT INTO Kho(MaCuaHang,TruongKho,DiaChi)
VALUES('CH001','NV00000003',N'123 Trường Chinh');
INSERT INTO Kho(MaCuaHang,TruongKho,DiaChi)
VALUES('CH002','NV00000006',N'500 CMT8');
INSERT INTO Kho(MaCuaHang,TruongKho,DiaChi)
VALUES('CH001','NV00000003',N'600 ĐBP');
SELECT * FROM Kho;


------ChiTietKho------
INSERT INTO ChiTietKho(MaKho,MaSanPham,SoLuong)
VALUES('K0001','SP00000001',10);
INSERT INTO ChiTietKho(MaKho,MaSanPham,SoLuong)
VALUES('K0001','SP00000002',10);
INSERT INTO ChiTietKho(MaKho,MaSanPham,SoLuong)
VALUES('K0001','SP00000003',10);
INSERT INTO ChiTietKho(MaKho,MaSanPham,SoLuong)
VALUES('K0001','SP00000004',10);
INSERT INTO ChiTietKho(MaKho,MaSanPham,SoLuong)
VALUES('K0001','SP00000005',10);

INSERT INTO ChiTietKho(MaKho,MaSanPham,SoLuong)
VALUES('K0002','SP00000001',20);
INSERT INTO ChiTietKho(MaKho,MaSanPham,SoLuong)
VALUES('K0002','SP00000002',20);
INSERT INTO ChiTietKho(MaKho,MaSanPham,SoLuong)
VALUES('K0002','SP00000003',20);
INSERT INTO ChiTietKho(MaKho,MaSanPham,SoLuong)
VALUES('K0002','SP00000004',20);
INSERT INTO ChiTietKho(MaKho,MaSanPham,SoLuong)
VALUES('K0002','SP00000005',20);


INSERT INTO ChiTietKho(MaKho,MaSanPham,SoLuong)
VALUES('K0003','SP00000001',10);
INSERT INTO ChiTietKho(MaKho,MaSanPham,SoLuong)
VALUES('K0003','SP00000002',0);
INSERT INTO ChiTietKho(MaKho,MaSanPham,SoLuong)
VALUES('K0003','SP00000003',0);
INSERT INTO ChiTietKho(MaKho,MaSanPham,SoLuong)
VALUES('K0003','SP00000004',10);
INSERT INTO ChiTietKho(MaKho,MaSanPham,SoLuong)
VALUES('K0003','SP00000005',0);
SELECT * FROM ChiTietKho;

------PhieuNhap------
INSERT INTO PhieuNhap(NhaCungCap,NhanVienTrucKho,MaKho,ThoiGianTao)
VALUES('CC001','NV00000002','K0001','10/OCT/2021 8:00:00');
SELECT * FROM PhieuNhap;

------ChiTietPhieuNhap------
INSERT INTO ChiTietPhieuNhap(MaPhieuNhap,MaSanPham,SoLuong,DonGiaNhap)
VALUES('PN00000001','SP00000001',5,5000000);
INSERT INTO ChiTietPhieuNhap(MaPhieuNhap,MaSanPham,SoLuong,DonGiaNhap)
VALUES('PN00000001','SP00000002',5,25000000);
INSERT INTO ChiTietPhieuNhap(MaPhieuNhap,MaSanPham,SoLuong,DonGiaNhap)
VALUES('PN00000001','SP00000003',5,20000000);
INSERT INTO ChiTietPhieuNhap(MaPhieuNhap,MaSanPham,SoLuong,DonGiaNhap)
VALUES('PN00000001','SP00000004',5,8000000);
INSERT INTO ChiTietPhieuNhap(MaPhieuNhap,MaSanPham,SoLuong,DonGiaNhap)
VALUES('PN00000001','SP00000005',5,15000000);
SELECT * FROM ChiTietPhieuNhap;
SELECT * FROM PhieuNhap;
SELECT * FROM ChiTietKho Where MaKho = 'K0001';
------KhachHang------
INSERT INTO KhachHang(TenKhachHang,SDT,DiaChi,ThanhPho,Email,TaiKhoan,MatKhau,TrangThai)
VALUES(N'Phan Hữu Đăng','0909119459',N'50 Thành Thái','TP001','phanhuudang@gmail.com','phanhuudang','123456',0);
INSERT INTO KhachHang(TenKhachHang,SDT,DiaChi,ThanhPho,Email,TaiKhoan,MatKhau,TrangThai)
VALUES(N'Trần Văn C','0999111454',N'54/23/4 Nguyễn Oanh','TP002','tranvanc@gmail.com','khachhang2','123456',0);

SELECT * FROM KhachHang;
------HangTIchDiem------
INSERT INTO HangTichDiem(TenHang)
VALUES(N'Đồng');
INSERT INTO HangTichDiem(TenHang)
VALUES(N'Bạc');
INSERT INTO HangTichDiem(TenHang)
VALUES(N'Vàng');
INSERT INTO HangTichDiem(TenHang)
VALUES(N'Kim Cương');

SELECT * FROM HangTichDiem;
------Voucher------
INSERT INTO Voucher(MaVoucher,TenVoucher,PhanTramKhuyenMai,NgayBatDau,NgayKetThuc,MoTa)
VALUES('HAPPY2021',N'Voucher 2021',0.1,'1/Jan/2021','30/Dec/2021',N'Voucher 10% áp dụng năm 2021');

SELECT * FROM Voucher;