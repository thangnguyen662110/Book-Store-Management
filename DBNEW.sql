-- username and password in application.properties
--     username: sa
--     password: songlong

CREATE DATABASE SEMICOLONS_BOOKS_STORE
GO

USE SEMICOLONS_BOOKS_STORE
GO

CREATE TABLE CATEGORIES (
	MALOAI INT PRIMARY KEY IDENTITY(1,1),
    TENLOAI NVARCHAR(100) UNIQUE,
    MOTA NVARCHAR(255)
);

CREATE TABLE BOOKS (
	MASACH INT PRIMARY KEY IDENTITY(1,1),
    TENSACH NVARCHAR(100),
    HINH NVARCHAR(200),
    SOLUONG INT,
    MALOAI INT,
    TACGIA NVARCHAR(100),
    GIA FLOAT,
    NAMXUATBAN DATE,
	NHAXUATBAN NVARCHAR(100),
	XEMTRUOC NVARCHAR(MAX),
    FOREIGN KEY (MALOAI) REFERENCES CATEGORIES(MALOAI)
);

CREATE TABLE ACCOUNTS (
    MANGUOIDUNG INT PRIMARY KEY IDENTITY(1,1),
    TENDANGNHAP NVARCHAR(255) UNIQUE,
    MATKHAU NVARCHAR(100),
    TENNGUOIDUNG NVARCHAR(100),
    DIACHI NVARCHAR(255),
    SODIENTHOAI NVARCHAR(10),
	EMAIL NVARCHAR(100),
    VAITRO BIT DEFAULT 0
);

CREATE TABLE ORDERS (
    MADONHANG INT PRIMARY KEY IDENTITY(1,1),
    MANGUOIDUNG INT,
    NGAYDATHANG DATE,
    DIACHI NVARCHAR(256),
    FOREIGN KEY (MANGUOIDUNG) REFERENCES ACCOUNTS(MANGUOIDUNG)
);

CREATE TABLE ORDERDETAILS (
	MADONHANGCHITIET INT PRIMARY KEY IDENTITY(1,1),
    MADONHANG INT,
    MASACH INT,
    SOLUONG INT,
    FOREIGN KEY (MADONHANG) REFERENCES ORDERS(MADONHANG),
    FOREIGN KEY (MASACH) REFERENCES BOOKS(MASACH)
);
GO

INSERT INTO CATEGORIES (TENLOAI, MOTA) VALUES
  (N'Tiểu thuyết', N'Sách văn học tiểu thuyết'),
  (N'Khoa học', N'Sách khoa học tự nhiên'),
  (N'Trinh thám', N'Sách trinh thám'),
  (N'Trẻ em', N'Sách dành cho trẻ em'),
  (N'Kinh tế', N'Sách về kinh tế và kinh doanh');

INSERT INTO BOOKS (TENSACH, HINH, SOLUONG, MALOAI, TACGIA, GIA, NAMXUATBAN, NHAXUATBAN, XEMTRUOC) VALUES
  (N'Dế Mèn Phiêu Lưu Ký', N'Anh1.jpg', 50, 1, N'Tô Hoài', 55.5, '2001-05-10', N'NXB Trẻ', N'Trong hơn nửa thế kỉ, kể từ ngày đầu tiên ra mắt bạn đọc, năm 1941, "Dế Mèn phiêu lưu ký" là một trong những sáng tác tâm đắc nhất của nhà văn Tô Hoài. Tác phẩm đã được tái bản nhiều lần và được dịch ra hơn 20 thứ tiếng trên toàn thế giới và luôn được các thế hệ độc giả nhỏ tuổi đón nhận. Tác phẩm đã được xuất bản với nhiều hình thức khác nhau. Trong đó cuốn "Dế Mèn phiêu lưu ký" gồm 52 trang, trên khổ giấy 21,5x28cm là một ấn phẩm đặc biệt phù hợp với các em nhi đồng vì cách kể gọn, dễ nắm bắt. Các tranh diễn hoạ 4 màu sinh động của hoạ sĩ Trương Qua sẽ khiến các em thấy như đang được xem một cuốn phim về chú Dế Mèn nổi tiếng vậy!'),
  (N'Tuổi Trẻ Đáng Giá Bao Nhiêu', N'Anh2.jpg', 30, 5, N'Đỗ Phước Tuấn', 45.2, '2018-12-15', N'NXB Lao Động Xã Hội', N'NXB Lao Động Xã Hội', N'Những thói quen tốt ta hình thành khi còn trẻ không tạo nên khác biệt nhỏnào, đúng hơn, chúng tạo ra tất cả khác biệt." (Aristotle)Không biết bao nhiêu lần tôi nghe những người trẻ quanh mình than buồn,chán, bảo không biết gì để làm. Và rồi không biết làm gì nên ta giết thời giờ với những thú vui nhỏ nhặt, rong chơi cho qua ngày đoạn tháng, ngủ vùi lười biếng hoặc chìm đắm vào yêu đương. Nhưng khi đã đi qua gần hết thời đôi mươi, ngấp nghé ở ngưỡng ba mươi,nhìn lại tôi mới thấy tiếc nuối. Thấy bây giờ cuộc sống có quá nhiều cơ hội,nhiều điều phải làm, nhiều thứ để học, mà mình lại không có đủ thời giancho ngần ấy thứ. Nghĩ nếu mà mình biết những điều này khi còn đi học, khimình còn trẻ tuổi, chắc hẳn cuộc sống của mình sẽ khác, chắc mình sẽ bớt đinhiều vật vã gian nan.Ai có trải qua rồi mới hiểu, tuổi trẻ ngắn ngủi biết bao nhiêu. Thời gian mộtđi là không trở lại. Điều đáng quý nhất mà tuổi trẻ có được là thời gian,nhưng rất nhiều người trẻ không biết làm gì có ích với thời gian của họ. Trênthực tế, có rất nhiều điều để làm, khi người ta còn trẻ.'),
  (N'Bí Mật Tư Duy Triệu Phú', N'Anh3.jpg', 20, 5, N'T. Harv Eker', 75.8, '2005-09-22', N'NXB Phụ Nữ', N'Trong cuốn sách này T. Harv Eker sẽ tiết lộ những bí mật tại sao một số người lại đạt được những thành công vượt bậc, được số phận ban cho cuộc sống sung túc, giàu có, trong khi một số người khác phải chật vật, vất vả mới có một cuộc sống qua ngày. Bạn sẽ hiểu được nguồn gốc sự thật và những yếu tố quyết định thành công, thất bại để rồi áp dụng, thay đổi cách suy nghĩ, lên kế hoạch rồi tìm ra cách làm việc, đầu tư, sử dụng nguồn tài chính của bạn theo hướng hiệu quả nhất.Cuốn sách dành cho những ai còn loay hoay muốn tìm đường đến sự giàu có và thành công. “Bí mật tự duy triệu phú” mang đến nhiều tư duy mới cho người đọc về cách suy nghĩ của người giàu hay cách suy nghĩ để trở nên giàu có.'),
  (N'Cuộc Phiêu Lưu Của Alice Trong Xứ Sở Thần Tiên', N'Anh4.jpg', 40, 4, N'Lewis Carroll', 35.0, '1865-11-26', N'NXB Kim Đồng', N'Alice rơi xuống hố thỏ tới Xứ sở Thần tiên, nơi mọi thứ thật khác so với vẻ bề ngoài của chúng. Cô bé đã gặp gỡ Thỏ Trắng hay nhìn đồng hồ, Mèo Cheshire nhăn nhở, Người Bán Mũ điên khùng, Nữ Hoàng Q Cơ cau có và nhiều nhân vật thần kì khác… Một cuốn sách tuyệt đẹp cùng những hình vẽ minh họa đặc sắc sẽ đưa bé vào thế giới thần tiên đầy nhiệm mầu! Bé đã sẵn sàng cho cuộc phiêu lưu trong mơ cùng Alice chưa nào?'),
  (N'The Power of Habit', N'Anh5.jpg', 25, 2, N'Charles Duhigg', 63.9, '2012-02-28', N'NXB Random House', N'Về cơ bản, người lớn và trẻ em không khác nhau là mấy. Bởi hầu hết những hành động hàng ngày của chúng ta đều là sản phẩm của thói quen vô thức. Thế nhưng không phải cá nhân, tổ chức nào cũng có được thành công. Đó  là vì mỗi người có những thói quen riêng. Vậy thói quen nào mới giúp bạn thành công? Trong cuốn sách “Sức mạnh của thói quen”, Charles Duhigg sẽ giải đáp thắc mắc ấy. Chìa khoá quan trọng nhất để mở cánh cửa thành công chính là sự kết hợp nhuần nhuyễn những thói quen tốt với nhau. Câu hỏi đặt ra là làm thế nào để phân biệt thói quen tốt và thói quen xấu? Thói quen có nằm trong tầm kiểm soát của chúng ta hay không? Với ba phần khá đầy đặn, “Sức mạnh của thói quen” cho bạn cái nhìn toàn diện không chỉ về thói quen cá nhân, của tổ chức mà còn là của toàn xã hội, cùng với lời khuyên để vận dụng các thói quen đó. Muốn thay đổi thói quen, bạn phải phá vỡ những việc làm tuỳ hứng hàng ngày – câu “thần chú” này chỉ đường cho bạn tới thành công');

INSERT INTO ACCOUNTS (TENDANGNHAP, MATKHAU, TENNGUOIDUNG, DIACHI, SODIENTHOAI, EMAIL, VAITRO) VALUES
  (N'user1', N'password1', N'Nguyễn Văn A', N'Hà Nội', N'0987654321', N'user1@example.com', 0),
  (N'user2', N'password2', N'Phạm Thị B', N'Hồ Chí Minh', N'0901234567', N'user2@example.com', 0),
  (N'admin', N'admin123', N'Admin', N'Đà Nẵng', N'0977123456', N'admin@example.com', 1);

INSERT INTO ORDERS (MANGUOIDUNG, NGAYDATHANG, DIACHI) VALUES
  (1, '2023-11-20', N'123 Đường ABC, Hà Nội'),
  (2, '2023-11-22', N'456 Đường XYZ, Hồ Chí Minh');

INSERT INTO ORDERDETAILS (MADONHANG, MASACH, SOLUONG) VALUES
  (1, 1, 2),
  (1, 3, 1),
  (2, 4, 3),
  (2, 5, 2);



