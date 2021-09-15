use master
go
CREATE DATABASE [WEB_TIN_TUC]
 

CREATE TABLE tblNguoiDung (
IDNguoiDung int PRIMARY KEY,
TenNguoiDung nvarchar(50) NOT NULL,
Email nvarchar(50) NOT NULL,
MatKhau nvarchar(30) NOT NULL
)
GO

CREATE TABLE tblBienTapVien (
IDBienTapVien int PRIMARY KEY,
TenBienTapVien nvarchar(30) NOT NULL,
Email nvarchar(50) NOT NULL,
MatKhau nvarchar(30) NOT NULL
)
GO

CREATE TABLE tblPhongVien (
IDPhongVien int PRIMARY KEY,
TenPhongVien nvarchar(30) NOT NULL,
Email nvarchar(50) NOT NULL,
MatKhau nvarchar(30) NOT NULL,
IDBienTapVien int NOT NULL,
CONSTRAINT FK_IDBienTapVien FOREIGN KEY (IDBienTapVien)
REFERENCES tblBienTapVien(IDBienTapVien)
)
GO

CREATE TABLE tblChuyenMuc (
IDChuyenMuc int PRIMARY KEY,
TenChuyenMuc nvarchar(50) NOT NULL,
SoLuongTheLoai int
)
GO

CREATE TABLE tblTheLoai (
IDTheLoai int PRIMARY KEY,
TenTheLoai nvarchar(50) NOT NULL,
SoLuongTin int,
IDChuyenMuc int NOT NULL, 
CONSTRAINT FK_ChuyenMuc FOREIGN KEY (IDChuyenMuc)
REFERENCES tblChuyenMuc(IDChuyenMuc)
)
GO


CREATE TABLE tblBaiBao (
IDBaiBao int PRIMARY KEY,
TenBaiBao nvarchar(90) NOT NULL,
TomTat nvarchar(200),
NoiDung nvarchar(800),
NgayDang date NOT NULL,
CONSTRAINT CHECK_NgayDang check (NgayDang < getdate()),
TrangThai nvarchar(20) NOT NULL,
HinhAnh image,
SoLuotDoc int,
IDPhongVien int NOT NULL, 
CONSTRAINT FK_IDPhongVien FOREIGN KEY (IDPhongVien)
REFERENCES tblPhongVien(IDPhongVien),
IDBienTapVien int not null,
CONSTRAINT FK_BienTapVien FOREIGN KEY (IDBienTapVien)
REFERENCES tblBienTapVien(IDBienTapVien),
IDTheLoai int not null,
CONSTRAINT FK_IDTheLoai FOREIGN KEY (IDTheLoai)
REFERENCES tblTheLoai(IDTheLoai)
)
GO


CREATE TABLE tblBinhLuan (
IDBinhLuan int PRIMARY KEY,
NoiDungBinhLuan nvarchar(200) NOT NULL,
IDNguoiDung int NOT NULL,
CONSTRAINT FK_IDNguoiDung FOREIGN KEY (IDNguoiDung)
REFERENCES tblNguoiDung(IDNguoiDung),
IDBaiBao int,
CONSTRAINT FK_IDBaiBao FOREIGN KEY (IDBaiBao)
REFERENCES tblBaiBao(IDBaiBao),
)
GO


/*
Chèn giá trị vào các cột
*/
INSERT INTO [dbo].[tblNguoiDung] (IDNguoiDung, TenNguoiDung, Email, MatKhau)
VALUES (100,'ducminh','ducminh@gmail.com','12345678'),
(101,'hoangdung','hoangdung@gmail.com','965195003'),
(102,'hieunguyen','hieunguyen@gmail.com','371972330'),
(103,'minhha','minhha@outlook.com','77491208'),
(104,'hoangbach','hoangbach@gmail.com','88641209'),
(105,'binhnguyen','binhnguyen@gmail.com','99811210'),
(106,'huonggiang','huonggiang@outlook.com','22441021'),
(107,'thanhtran','thanhtran@gmail.com','349644593'),
(108,'tuanh','tuanh@gmail.com','44161023'),
(109,'longnguyen','longnguyen@gmail.com','55251024'),
(110,'hanhphuc','hanhphuc@gmail.com','66362025')
GO

INSERT INTO [dbo].[tblBienTapVien] ([IDBienTapVien],[TenBienTapVien],[Email],[MatKhau])
VALUES (30,'Duyvu','duyvu@gmail.com','3760889743'),
(31,'Minhanh','Minhanh@gmail.com','5729879778'),
(32,'Khoinguyen','Khoinguyen@outlook.com','8264765433'),
(33,'Hadung','Hadung@gmail.com','4821261319'),
(34,'Manhan','Manhan@gmail.com','4855232853'),
(35,'Tuduy','Tuduy@outlook.com','7694149789'),
(36,'Tienlinh','Tienlinh@gmail.com','2011438259'),
(37,'Duchuy','Duchuy@gmail.com','6011438259'),
(38,'Ducchinh','Ducchinh@gmail.com','6711438259'),
(39,'Ngochai','Ngochai@gmail.com','2511438259')
go

INSERT INTO [dbo].[tblPhongVien] ([IDPhongVien],[TenPhongVien],[Email],[MatKhau],[IDBienTapVien])
VALUES (200,'nguyenbichthuy','nguyenbichthuy@gmail.com','70233042765',30),
(201,'nguyenduytung','nguyenduytung@gmail.com','61711473895',31),
(202,'tranmanhhung','tranmanhhung@outlook.com','63517372290',30),
(203,'tranquangha','tranquangha@gmail.com','65111595023',32),
(204,'tranduylinh','tranduylinh@gmail.com','27097925252',36),
(205,'trananhdung','trananhdung@outlook.com','31455790137',35),
(206,'nguyencongphuong','nguyencongphuong@gmail.com','15662524241',33),
(207,'havietanh','havietanh@gmail.com','82596469078',31),
(208,'maianhvu','maianhvu@gmail.com','16041543990',32),
(209,'vutuandung','vutuandung@gmail.com','81662112264',35),
(210,'dinhvietthang','dinhvietthang@outlook.com','50142867383',36)
go

INSERT INTO [dbo].[tblChuyenMuc] ([IDChuyenMuc],[TenChuyenMuc],[SoLuongTheLoai])
VALUES (500,'thoi su',2),
(501,'Bong da',3),
(502,'Ngoi sao',2),
(503,'Du lich',2),
(504,'Cong nghe',3),
(505,'Van hoa',null),
(506,'Khoa hoc',null),
(507,'Bon phuong',null),
(508,'Hoc tap',null),
(509,'Giai tri',null),
(510,'Thu gian',null)
GO


INSERT INTO [dbo].[tblTheLoai] ([IDTheLoai],[TenTheLoai],[SoLuongTin],[IDChuyenMuc])
VALUES (300,'thoi su trong nuoc',1,500),
(301,'thoi su quoc te',3,500),
(302,'VLeage',1,501),
(303,'Premierleage',0,501),
(304,'Championleage',0,501),
(305,'Showbiz Viet',1,502),
(306,'Showbiz the gioi',3,502),
(307,'Diem den',1,503),
(308,'Tu van',1,503),
(309,'O to',1,504),
(310,'Xe may',1,504),
(311,'Dien thoai',1,504),
(312,'Van hoa',1,505),
(313,'Loi song',1,505),
(314,'Toan canh',3,505)
GO


INSERT INTO [dbo].[tblBaiBao] ([IDBaiBao],[TenBaiBao],[TomTat],[NoiDung],[NgayDang],[TrangThai],
[HinhAnh],[SoLuotDoc],[IDPhongVien],[IDBienTapVien],[IDTheLoai])
VALUES
(1, 'Covid 24h: Ca nhiễm ở TP HCM giảm, Bình Dương vượt 21.000 ca',N'TP HCM ghi nhận số ca nhiễm mới thấp nhất hai tuần qua, 
trong khi số ca Covid-19 ở Bình Dương trong đợt dịch thứ tư vượt 21.000',N'Người dân TP HCM đã trải qua ngày thứ 66 giãn cách xã 
hội theo nhiều cấp độ từ khi đợt dịch thứ tư bùng phát vào cuối tháng 5. Tỉnh Bình Dương hôm qua ghi nhận 2.143 ca nhiễm mới, 
nâng tổng số ca Covid-19 ở địa phương này trong đợt dịch thứ tư lên 21.556. Đây đang là vùng dịch lớn thứ hai cả nước, chỉ sau 
TP HCM.','2021-5-08','True','media/covid-19-101',232,200,30,300),

(2, N'Phó Cục thuế bị đình chỉ công tác vì chơi golf giữa dịch',N'Ông Nguyễn Công Thành, Phó Cục thuế Bình Định bị đình chỉ công 
tác 15 ngày do chơi golf trong thời gian giãn cách, tiếp xúc với nữ nhân viên nhiễm nCoV.',N'Do ông Thành và ông Dũng đánh golf 
trong thời gian chính quyền tỉnh, thành phố đã thông báo dừng hoạt động văn hóa, thể thao ở địa điểm công cộng để chống dịch, 
nên sự việc đang được các ngành chức năng tỉnh Bình Định làm rõ để xử lý.',
'2021-5-08','True',
'media/phocucthue-21-223',115,200,30,301),

(3, N'Mỹ siết quy định nhập cảnh đối với du khách nước ngoài',N'Chính quyền Tổng thống Joe Biden đang hoàn thiện kế hoạch yêu cầu 
hầu hết các du khách nước ngoài đến Mỹ phải được tiêm vaccine đầy đủ.',N'Hôm 4/8, Reuters dẫn nguồn tin từ quan chức Nhà Trắng 
cho biết, chính quyền Tổng thống Joe Biden đang chuẩn bị thiết lập "một hệ thống mới sẵn sàng cho thời điểm mở lại hoạt động du 
lịch".','2021-5-08','True', 'media/mycam-21-225',122,201,31,301),

(4, N'Chủ tịch VPF: ‘Chưa chốt lùi V-League’',N'Theo ông Trần Anh Tú, Công ty Cổ phần Bóng đá chuyên nghiệp Việt 
Nam mới đệ trình kế hoạch dời V-League sang năm 2022, còn quyền quyết định thuộc về VFF.',N'"Dựa trên diễn biến 
phức tạp của dịch Covid-19, Ban tổng giám đốc trình lên Hội đồng quản trị VPF phương án dời V-League sang tháng 2/2022. 
Trên cơ sở đó, chúng tôi sẽ trình lên Liên đoàn Bóng đá Việt Nam. Hiện, chưa có gì chắc chắn. Khi nào có quyết định từ VFF, 
chúng tôi sẽ thông báo đến các CLB", ông Trần Anh Tú chia sẻ với VnExpress trưa 18/7.','2021-5-08','True',
'media/vleage-21-226',523,203,32,302),

(5, N'Rihanna trở thành tỷ phú USD',N'Rihanna vượt mốc tài sản một tỷ USD và trở thành nữ ca sĩ giàu nhất thế giới, theo Forbes.',
N'Dù nổi tiếng với nghề ca sĩ, Rihanna chủ yếu kiếm tiền nhờ kinh doanh. 1,4 tỷ USD tài sản của cô có được nhờ thương hiệu làm 
đẹp Fenty Beauty. Ca sĩ thành lập công ty này năm 2017 và hiện sở hữu khoảng 50% cổ phần. Thương hiệu đồ lót Savage x Fenty của 
Rihanna cũng giúp cô kiếm khoảng 270 triệu USD. Phần tài sản còn lại đến từ cát-xê và lợi nhuận của các dự án âm nhạc, phim ảnh.',
'2021-5-08','True','media/rihanna-21-227',326,203,32,306),

(6, N'Khánh Thi, Phan Hiển dạy điệu nhảy hiện đại',N'Vợ chồng Khánh Thi, Phan Hiển hướng dẫn mọi người các động tác nhảy hiện đại 
dễ thực hiện trên nền nhạc', N'Là huấn luyện viên dancesport, Khánh Thi theo sát sự nghiệp vận động viên của chồng khi anh 16 
tuổi. Cô giúp anh rèn luyện, khắc phục những điểm yếu và phát huy thế mạnh ở bộ môn khiêu vũ thể thao. Phan Hiển tích cực tập 
luyện để chờ những cơ hội mới. Anh giúp bà xã dạy khiêu vũ cho các em nhỏ tại trung tâm của gia đình. Khi Sài Gòn thực hiện giãn 
cách xã hội theo chỉ thị 16, cả hai chuyển sang dạy nhảy và bán hàng online','2021-5-08','True',
'media/khanhthi-21-228',326,203,32,306),

(7, N'Anh nêu lý do điều tàu sân bay đến Biển Đông', N'Anh điều tàu Queen Elizabeth tới Biển Đông để thể hiện cam kết với an ninh
khu vực, nhưng không nhằm gây căng thẳng ở Ấn Độ Dương - Thái Bình Dương.', N'"Một phần trong hành trình của Nhóm tác chiến 
Tàu sân bay 21 (CSG-21) là đi qua Biển Đông và tổ chức loạt diễn tập trên biển, thăm cảng và gặp gỡ trực tuyến với các nước 
ASEAN, bao gồm Singapore, Brunei, Malaysia và Thái Lan", đại sứ quán Anh tại Việt Nam ngày 5/8 trả lời VnExpress về mục đích 
chuyến đi tới Biển Đông của tàu sân bay HMS Queen Elizabeth và các chiến hạm hộ tống.','2021-08-05','TRUE','media/quansu-21-250'
,594,206,36,301),

(8, N'Bãi biển Nhật Bản có cát hình ngôi sao', N'Thay vì cát thông thường, bãi biển Hoshizuna-no-Hama có những hạt cát hình sao 
5-6 cánh.', N'Nằm trên đảo Irimote lớn thứ hai của tỉnh Okinawa, Hoshizuna-no-Hama bình thường như hàng trăm bãi biển khác khắp 
đất nước, ít nhất là từ cái nhìn đầu tiên. Nhưng nếu thăm kỹ hơn, đặc biệt là đi chân trần trên cát hay dùng tay nghịch cát ở nơi
này, bạn sẽ nhìn thấy một điều kỳ lạ. Đó là nhiều "hạt cát" có hình ngôi sao 5-6 cánh.','2021-6-22','True',
'media/nhatban-21-229',333,205,35,305),

(9, N'Phở vịt quay xứ Lạng lạ mà ngon', N'Phở ở Lạng Sơn có nước dùng béo, thơm mùi móc mật, ăn cùng vịt quay chặt miếng da 
vàng óng và măng ngâm chua cay.', N'Nhắc đến phở, người ta thường nghĩ tới phở bò hay phở gà, ăn cùng quẩy ở Hà Nội, Nam Định. 
Nhưng ở Lạng Sơn, tỉnh cách thủ đô hơn 150 km lại có món phở lạ, gắn với đặc sản nức tiếng vịt quay.','2021-3-21','True',
'media/pholangson-21-230',255,205,35,308),

(10, N'Những mẫu ôtô tí hon có giá khổng lồ tại Việt Nam', N'Fiat 500c Abarth, Toyota iQ, Volkswagen Beetle Dune, 
Suzuki Jimny hay Smart ForTwo là những mẫu xe nhỏ có giá nhiều tỷ đồng.', N'Người tiêu dùng Việt thường biết đến 
các mẫu xe cỡ A là nhỏ nhất tại Việt Nam như Morning, i10, Fadil... với giá khoảng gần 400 triệu đồng. 
Tuy vậy, vẫn có những mẫu xe lạ được nhập về nước có kích thước tương đương, thậm chí nhỏ hơn cỡ A nhưng với 
giá đắt gầm 3-4 lần, đều trên 1 tỷ đồng','2021-7-12','True','media/oto-21-231',255,206,35,309),

(11, N'Harley-Davidson Sporter S giá 589 triệu đồng', N'Mẫu cruiser thế hệ mới của hãng xe Mỹ nhập khẩu từ Thái Lan dự kiến 
về Việt Nam cuối quý III/2021.', N'Sporter S là thế hệ mới nhất dòng cruiser khai sinh năm 1957 của Harley-Davidson (HD). 
Đây cũng là sản phẩm đầu tiên từ 1986 của dòng Sporter có động cơ mới. Xe chia sẻ động cơ Revolution Max 1250T V-twin cùng 
Pan America, mẫu Adventure Touring đầu tiên của thương hiệu môtô trụ sở tại thành phố Milwaukee, bang Wisconsin, Mỹ.',
'2021-6-16','True','media/xemay-21-232',228,206,33,310),

(12, N'Điện thoại chụp ảnh đẹp nhất thế giới', N'Huawei, Xiaomi có nhiều điện thoại nhất trong top 10 của trang DxoMark,
Apple chiếm hai vị trí cuối, trong khi Samsung không có đại diện nào.', N'10. iPhone 12 Pro (128 điểm camera sau, 98 điểm camera
trước) iPhone 12 Pro ra mắt tháng 10/2020 là model đứng ở vị trí thứ 10 trong bảng xếp hạng của DxOMark - chuyên trang nổi tiếng
về camera, có đánh giá, thử nghiệm tính năng chụp hình trên điện thoại dựa trên điều kiện sử dụng thực tế và cả trong phòng thí 
nghiệm.','2021-02-16','True','media/dienthoai-21-233',219,208,32,311),

(13, N'Vùng xanh hy vọng', N'Những ngày ở nhà, bạn bè tôi chia sẻ hàng trăm cách để vui, nhưng “bí kíp chống chán” ấy không 
dành cho mọi người.', N'Doanh nghiệp cô đã phải đóng cửa nhưng cô không chọn cách tuyên bố phá sản bởi 20 nhân viên ấy đã đi 
cùng cô từ ngày đầu khởi nghiệp. Cô bán xe để có tiền hỗ trợ họ khi Hà Nội giãn cách, để tất cả yên tâm ở nhà. Hay như Minh, 
chủ doanh nghiệp khác cũng đăng tin bán mảnh đất bố mẹ cho để có thêm tiền nuôi doanh nghiệp qua cơn dịch giã.',
'2021-7-16','True','media/vungxanh-21-234',120,208,32,312),

(14, N'Làm việc tại gia', N'“Làm việc ở nhà sướng như tiên”, tôi từng nghĩ. Nhưng đời tiên không kéo dài bao lâu.', N'"Đời tiên"
của tôi bắt đầu từ năm 2019, khi chuyển sang làm tư vấn độc lập. Sau khi con trai lớn đi học xa nhà, tôi cải tạo phòng học thành
nơi làm việc. Ngoài laptop, tôi trang bị thêm một máy in, một màn hình lớn và bàn phím rời.',
'2021-02-10','True','media/lamviec-21-235',120,208,32,313),

(15, N'Huy chương Olympic có giá bao nhiêu?', N'Một tấm huy chương bạc môn bắn súng từ Olympic Paris năm 1900 có giá 1.283 USD, 
nhưng tấm huy chương bạc từ Olympic năm 1896 có giá 180.000 USD.', N'RR Auction, nhà đấu giá có trụ sở tại Boston, cho biết 
điểm đặc biệt của chiếc huy chương bạc 180.000 USD là nó xuất phát từ kỳ Olympic hiện đại đầu tiên ở Athens năm 1896 và nó 
thực chất là phần thưởng cao nhất vì thời đó chưa có huy chương vàng (nhà vô địch được trao huy chương bạc, á quân được trao 
huy chương đồng, không có huy chương cho hạng ba).','2021-5-07','True','media/huychuong-21-236',222,209,35,314),

(16, N'Jennifer Lopez đeo vòng cổ có tên Ben Affleck', N'Ca sĩ Jennifer Lopez đeo vòng cổ mang tên Ben Affleck khi du lịch 
một mình ở Portofino hôm 1/8.', N'Theo People, chiếc vòng cổ do Affleck tặng, Lopez đeo khi xa bạn trai để nhớ đến anh.
Beth Bugdaycay - giám đốc công ty sản xuất chiếc vòng - tiết lộ Affleck trực tiếp tham gia quá trình thiết kế món trang sức.',
'2021-5-07','True','media/jennifer-21-237',329,210,36,306),

(17, N'Cách để chợ, siêu thị không lặp lại kịch bản như TP HCM', N'Theo chuyên gia, khi chợ đầu mối, dân sinh đóng cửa, 
những điểm tập kết trung chuyển hàng hoá và "chợ dã chiến" có thể là lời giải để giữ chuỗi cung ứng đứng vững.', N'Hà Nội, 
chuỗi cung ứng hàng hoá cho hơn 10 triệu người dân Hà Nội cũng nguy cơ "lung lay" khi đến ngày 4/8, 20 chợ đầu mối và chợ 
dân sinh dừng hoạt động. Các chợ đầu mối đang tạm đóng cửa như phía Nam, Minh Khai, chợ Long Biên... đều là những nơi trung 
chuyển, tập kết phần lớn hàng hoá nông sản, thực phẩm cho thủ đô.','2021-08-05','FALSE','media/dicho-21-238',504,208,32,314),

(18, N'Olympic 2020 thể hiện vị thế công nghệ Nhật Bản', N'Với vị thế là cường quốc công nghệ, Nhật Bản tận dụng Thế vận hội 
Tokyo để thể hiện năng lực nghiên cứu và sản xuất công nghệ mới của đất nước.', N'Tại Lễ khai mạc Olympic 2020, nước chủ nhà 
Nhật Bản gây ấn tượng mạnh với màn biểu diễn xếp hình của hàng nghìn máy bay không người lái trên bầu trời. Ban tổ chức đã sử 
dụng 1.824 drone để xếp thành hình biểu tượng Thế vận hội Tokyo, sau đó được thay đổi thành hình Trái Đất, trên bầu trời phía 
trên Sân vận động quốc gia Tokyo.','2021-08-05','TRUE','media/tokyo-21-239',635,208,32,314)
go	


INSERT INTO [dbo].[tblBinhLuan] ([IDBinhLuan],[NoiDungBinhLuan] ,[IDNguoiDung] ,[IDBaiBao])
VALUES (834, N'Dịch bệnh này nguy hiểm quá',110,1),
(863, N'Chủng delta này quá nguy hiểm ',109,1),
(804, N'Cán bộ mà không gương mẫu gì cả',107,2),
(860, N'Chơi golf mùa dịch bệnh nữa cơ',104,2),
(802, N'Vleage giờ sôi động ghê',106,4),
(829, N'Muốn được xem trực tiếp các trận bóng mà dịch ghê quá',107,4),
(877, N'Hi vọng đội bóng đá hay nhất sẽ vô địch',102,4),
(827, N'Phở lạng sơn ngon lắm đó',108,9),
(815, N'Uh, mình ăn rồi, ngon lắm mọi người ạ',100,9),
(830, N'Nhật bản đúng là đất nước công nghệ cao',105,17),
(855, N'Xem thật là đã mắt',103,17),
(821, N'Họ luôn đi đầu trong lĩnh vực này',107,17),
(819, N'Làm việc tại nhà cũng nhàn hơn',100,13),
(811, N'Chênh lệch tuổi tác quá nhỉ',107,15),
(853, N'Xứng đôi đấy chứ nhỉ',106,15),
(831, N'Đi chợ cũng nhiều nguy hiểm ghê',109,16),
(807, N'Điện thoại đẹp quá',101,11)
go


/*
TRIGGER được khởi tạo trên tblBaiBao để kiểm tra dữ liệu nhập vào bằng cách khởi tạo biến @Phongvien, @BienTapVien, @TheLoai nhận 
giá trị từ IDPhongVien, IDBienTapVien, IDTheLoai được thêm vào, rồi dùng câu điều kiện để kiểm tra sự tồn tại của giá trị này 
trong bảng tblPhongVien, tblBienTapVien, tblTheLoai .Kiểm tra IDPhongVien (references IDPhongVien), IDBienTapVien 
(references IDBienTapVien), IDTheLoai (references IDTheLoai) được thêm vào có tồn tại trong bảng tblPhongVien, tblBienTapVien hoặc
tblTheLoai nếu không thì hiển thị lỗi và rollback toàn bộ. */

CREATE TRIGGER trg_PvBtvTl ON [dbo].[tblBaiBao]
	AFTER INSERT
	AS
	BEGIN
		SET NOCOUNT ON
		DECLARE @Phongvien INT
		DECLARE @BienTapVien INT
		DECLARE @TheLoai INT
		SELECT @Phongvien = IDPhongVien from inserted
		IF NOT EXISTS (SELECT * FROM tblPhongVien WHERE IDPhongVien = @Phongvien)
		SELECT @BienTapVien = IDBienTapVien from inserted
		IF NOT EXISTS (SELECT * FROM tblBienTapVien WHERE IDBienTapVien = @BienTapVien)
		SELECT @TheLoai = IDTheLoai from inserted
		IF NOT EXISTS (SELECT * FROM tblTheLoai WHERE IDTheLoai = @TheLoai)
		BEGIN
			RAISERROR('Lỗi nhập không đúng',15,0)
			ROLLBACK
		END
	END
GO

-- Kiểm tra trigger trên
begin tran
INSERT INTO [dbo].[tblBaiBao] ([IDBaiBao],[TenBaiBao],[TomTat],[NoiDung],[NgayDang],[TrangThai],
[HinhAnh],[SoLuotDoc],[IDPhongVien],[IDBienTapVien],[IDTheLoai])
VALUES
(22, N'Covid 24h: Ca nhiễm ở TP HCM giảm, Bình Dương vượt 21.000 ca',N'TP HCM ghi nhận số ca nhiễm mới thấp nhất hai tuần qua, 
trong khi số ca Covid-19 ở Bình Dương trong đợt dịch thứ tư vượt 21.000',N'Người dân TP HCM đã trải qua ngày thứ 66 giãn cách xã 
hội theo nhiều cấp độ từ khi đợt dịch thứ tư bùng phát vào cuối tháng 5. 
Tỉnh Bình Dương hôm qua ghi nhận 2.143 ca nhiễm mới, nâng tổng số ca Covid-19 ở địa phương này trong đợt dịch thứ tư lên 21.556. 
Đây đang là vùng dịch lớn thứ hai cả nước, chỉ sau TP HCM.','2021-5-08','True','media/covid-19-101',888,200,35,300)
select * from tblBaiBao
rollback tran
GO


/*
 STORED PROCEDURE: Nhận một tham số là @IDTheLoai và trả về danh sách bài viết thuộc thể loại này, được sắp xếp theo thứ tự 
 mới nhất đến cũ nhất. Mục đích để lấy ra danh sách các bài viết trong thể loại và hiển thị cho phía người đọc khi nhận được 
 yêu cầu xem các bài viết trong cùng thể loại.
*/

IF OBJECT_ID('proc_BaiBaoTrongDanhMuc','P') IS NOT NULL
DROP PROC proc_BaiBaoTrongDanhMuc
go

CREATE PROC proc_BaiBaoTrongDanhMuc (@IDTheLoai int)
	AS
	BEGIN
		SELECT * FROM tblBaiBao WHERE IDTheLoai IN 
		(SELECT IDTheLoai FROM tblBaiBao WHERE IDTheLoai = @IDTheLoai) AND TrangThai = 'True'
		ORDER BY NgayDang DESC
	END
go
-- Kiểm tra
begin tran
	exec proc_BaiBaoTrongDanhMuc 306
rollback tran
GO

-- SCALAR FUNCTION: fc_SoLuongTin trả về tổng số bài viết có trong một thể loại
-- Function nhận vào một tham số là IDTheLoai có kiểu INT và trả về dữ liệu kiểu INT là tổng số bài báo có trong thể loại đó
-- giúp người quản trị nắm được tổng số bài trong từng thể loại.

IF EXISTS (SELECT * FROM sys.all_objects WHERE name = 'fc_SoLuongTin')
DROP FUNCTION fc_SoLuongTin
GO

CREATE FUNCTION fc_SoLuongTin (@IDTheLoai int)
RETURNS INT
AS
BEGIN
	DECLARE @SoLuongTin INT
	SELECT @SoLuongTin = COUNT(*) FROM tblBaiBao WHERE IDTheLoai = @IDTheLoai
    RETURN @SoLuongTin
END
GO

-- Test Function fc_SoLuongTin hiển thị số lượng bài báo theo thể loại
BEGIN TRAN
	SELECT  IDTheloai, dbo.fc_SoLuongTin(IDTheLoai) AS SoLuongTIn FROM tblBaiBao
	group by IDTheloai
	ROLLBACK TRAN
GO

/*
INDEX: filtered index trên cột NgayDang của bảng tblBaiBao. Để cải thiện hiệu xuất tìm kiếm bài viết theo khoảng ngày.
Ở đây, index đã được lọc dựa theo TrangThai, thể hiện đối tượng là những bài viết tin tức đã được hiển thị trên website.
Bỏ qua các đối tượng là các bài viết chưa được đăng (TrangThai = 'False').
*/

CREATE NONCLUSTERED INDEX idx_tblBaiBao_NgayDang
    ON [dbo].[tblBaiBao]([NgayDang])
	INCLUDE (TenBaiBao, TomTat)
	WHERE TrangThai = 'True' 
GO

/*
TRANSACTION: Thêm column vào bảng tblBaiBao thể hiện bài báo có cho phép thêm bình luận hay không, kiểu dữ liệu bit với 2 giá trị
0 (không cho phép) và 1 (cho phép). Cột mới được thêm một constraint default để các giá trị mới thêm vào đều có dữ liệu 
(0: không cho phép). Sau đó, ta cần cập nhật lại cột ChoPhepBinhLuan có IDBaiBao xuất hiện trong bảng tblBinhLuan thành các 
giá trị (1: cho phép) để hợp lý với những dữ liệu có sẵn trong tblBinhLuan (đã được phép bình luận trên các bài báo) 
*/

/*
ALTER TABLE [dbo].[tblBaiBao]
drop constraint default_ChoPhep


ALTER TABLE [dbo].[tblBaiBao]
drop column ChoPhepBinhLuan
*/
BEGIN TRANSACTION tran_BaiBao WITH MARK N'Them cot vao tblBaiBao'
	ALTER TABLE [dbo].[tblBaiBao]
	ADD ChoPhepBinhLuan bit NOT NULL CONSTRAINT default_ChoPhep default 0
	GO

	UPDATE [dbo].[tblBaiBao] SET ChoPhepBinhLuan = 1 WHERE IDBaiBao IN (SELECT IDBaiBao from tblBinhLuan)
	select * from tblBaiBao
COMMIT TRAN
GO

CREATE TRIGGER tg_chophepbl ON [dbo].[tblBinhLuan]
	AFTER INSERT, UPDATE
	AS
	BEGIN
		DECLARE @BaiBao INT, @ChoPhepBL bit
		SELECT @BaiBao = IDBaiBao from inserted
		SELECT @ChoPhepBL = ChoPhepBinhLuan FROM tblBaiBao WHERE IDBaiBao = @BaiBao
		IF @ChoPhepBL = 0
		BEGIN
			RAISERROR('Không cho phép bình luận',15,0)
			ROLLBACK
		END
	END
GO

--drop trigger tg_chophepbl
-- Test Transaction 'tran_BaiBao'
BEGIN TRAN
	INSERT INTO [dbo].[tblBinhLuan] ([IDBinhLuan],[NoiDungBinhLuan],[IDNguoiDung],[IDBaiBao])
	VALUES (895, N'Làm việc tại nhà cũng nhàn hơn',100,10)

	select *from tblBinhLuan
		select *from tblBaiBao

ROLLBACK TRAN
GO

-- Truy vấn dữ liệu trên một bảng
-- Trích xuất dữ liệu trong tblBaiBao trả về dữ liệu các cột IDBaiBao, TenBaiBao và NgayDang
SELECT IDBaiBao, TenBaiBao, NgayDang FROM tblBaiBao
GO

-- Truy vấn có sử dụng Order by. Trích xuất dữ liệu trong tblBaiBao và sắp xếp theo ngày giảm dần
--  để hiển thị các bài viết theo thứ tự mới nhất đến cũ nhất trên trang chủ
SELECT IDBaiBao, TenBaiBao, TomTat, NgayDang FROM tblBaiBao ORDER BY NgayDang DESC
GO


-- Truy vấn có sử dụng so sánh xâu ký tự
-- Trích xuất dữ liệu trong tblBaiBao có TenBaiBao chứa từ 'Covid' nằm bất cứ vị trí nào trong TenBaiBao
-- Mục đích để hiện thị những bài viết theo từ khóa tìm kiếm của người dùng, ở đây chứa từ Covid.
SELECT IDBaiBao, TenBaiBao, TomTat, NgayDang FROM tblBaiBao WHERE TenBaiBao like '%Covid%'
GO

-- Truy vấn có điều kiện thời gian
-- Trích xuất dữ liệu trong tblBaiBao là các bài viết được đăng trong tháng 5 năm 2021
-- Mục đích để hiển thị các bài viết đã đăng trong khoảng ngày được chọn bởi người xem
SELECT IDBaiBao, TenBaiBao, TomTat, NgayDang FROM tblBaiBao 
WHERE NgayDang BETWEEN '2021-05-01' AND '2021-05-31'
GO

-- Truy vấn từ nhiều bảng sử dụng inner join
-- Khớp dữ liệu từ bảng tblTheLoai và tblBaiBao thông qua bảng tblTheLoaiPOST để xuất ra các dữ liệu là Post trong các category
-- Mục đích để hiển thị các bài viết theo nhóm danh mục (category) ngoại trừ các nhóm danh mục chưa có bài viết nào thì không được hiển thị
SELECT TenTheLoai, TenBaiBao, TomTat FROM tblTheLoai
INNER JOIN tblBaiBao ON tblBaiBao.IDTheLoai = tblTheLoai.IDTheLoai
GO

/*
Truy vấn từ nhiều bảng sử dụng outter join Khớp toàn bộ các dòng dữ liệu từ bảng tblBaiBao với tblBinhLuan. Mục đích để hiển thị 
số lượng comment trong mỗi bài viết, thể hiện tính tương tác của các bài viết cho người xem.
*/
SELECT TenBaiBao, COUNT(IDBinhLuan) AS LuongBinhLuan FROM tblBaiBao
LEFT JOIN tblBinhLuan ON tblBaiBao.IDBaiBao = tblBinhLuan.IDBaiBao
GROUP BY TenBaiBao
GO

-- Truy vấn sử dụng except Trích xuất dữ liệu từ bảng tblBaiBao có những IDBaiBao không xuất hiện trong bảng tblBinhLuan
-- Mục đích để lọc ra các bài viết có tương tác kém (chưa có comment nào) để có hướng cải thiện nội dung cho phóng viên

SELECT IDBaiBao, TenBaiBao, SoLuotDoc  FROM tblBaiBao 
WHERE IDBaiBao IN (SELECT IDBaiBao FROM tblBaiBao
EXCEPT
SELECT IDBaiBao FROM tblBinhLuan)
GO

-- Truy vấn sử dụng truy vấn con (trong WHERE)tìm số lượng tin tức của thể loại

SELECT * FROM tblBaiBao WHERE IDTheloai in (SELECT IDTheloai FROM tblTheLoai WHERE SoLuongTin >2)
go

-- Truy vấn sử dụng WITH
-- Tìm sớ lượt bình luận với mỗi thể loại để tìm thể loại bài viết nào được độc giả quan tâm nhất
WITH SoLuotBL(IDBaiBao, tongBinhLuan) AS
	(SELECT IDBaiBao, COUNT(IDBinhLuan) AS tongBinhLuan FROM tblBinhLuan group by IDBaiBao),
	SoLuongTinTrongTheLoai(TenTheLoai, IDBaiBao) AS 
	(SELECT TenTheLoai,IDBaiBao FROM tblTheLoai LEFT JOIN tblBaiBao ON tblBaiBao.IDTheLoai = tblTheLoai.IDTheLoai)

SELECT TenTheLoai,sum(tongBinhLuan) 
AS tongBinhLuan FROM SoLuongTinTrongTheLoai INNER JOIN SoLuotBL ON SoLuongTinTrongTheLoai.IDBaiBao = SoLuotBL.IDBaiBao 
GROUP BY TenTheLoai
GO


-- Truy vấn sử dụng GROUP BY và HAVING
-- Thêm điều kiện HAVING để trả về các TenTheLoai có tổng số bình luận > 2
WITH SoLuotBL(IDBaiBao, tongBinhLuan) AS
	(SELECT IDBaiBao, COUNT(IDBinhLuan) AS tongBinhLuan FROM tblBinhLuan group by IDBaiBao),
	SoLuongTinTrongTheLoai(TenTheLoai, IDBaiBao) AS 
	(SELECT TenTheLoai,IDBaiBao FROM tblTheLoai LEFT JOIN tblBaiBao ON tblBaiBao.IDTheLoai = tblTheLoai.IDTheLoai)
SELECT TenTheLoai,sum(tongBinhLuan) 
AS tongBinhLuan FROM SoLuongTinTrongTheLoai INNER JOIN SoLuotBL ON SoLuongTinTrongTheLoai.IDBaiBao = SoLuotBL.IDBaiBao
GROUP BY TenTheLoai
having sum(tongBinhLuan)>2
GO


-- Truy vấn sử dụng function đã tạo tìm số lượng tin trong thể loại
SELECT *, [dbo].[fc_SoLuongTin](IDTheLoai) AS TotalPost FROM tblTheLoai

