-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 02, 2023 lúc 08:25 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `pro1014_duan1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `bill_name` varchar(255) NOT NULL,
  `bill_address` varchar(255) NOT NULL,
  `bill_email` varchar(255) NOT NULL,
  `bill_tel` varchar(255) NOT NULL,
  `bill_pttt` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1:Thanh toán trực tiếp\r\n2:Chuyển khoản\r\n3:Thanh toán online',
  `ngaydathang` date NOT NULL,
  `total` int(11) NOT NULL,
  `bill_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:Đơn hàng mới\r\n1:Đang xử lý\r\n2:Đang giao hàng\r\n3:Đã giao hàng',
  `receive_name` varchar(255) DEFAULT NULL,
  `receive_address` varchar(255) DEFAULT NULL,
  `receive_email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(11) NOT NULL,
  `noi_dung` varchar(255) NOT NULL,
  `ma_sp` int(10) NOT NULL,
  `ma_kh` int(10) NOT NULL,
  `ngay_them` date NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`id`, `noi_dung`, `ma_sp`, `ma_kh`, `ngay_them`, `status`) VALUES
(1, 'fsfd', 10, 1, '2023-12-02', '1'),
(2, 'hay\r\n', 12, 2, '2023-12-02', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idpro` int(11) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `soluong` int(3) NOT NULL,
  `thanhtien` int(11) NOT NULL,
  `idbill` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `name`) VALUES
(1, 'Thiếu nhi'),
(2, 'Văn học'),
(3, 'Truyện');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(11) NOT NULL,
  `namesp` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `tacgia` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `sell_price` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `luotxem` int(11) NOT NULL,
  `iddm` int(11) NOT NULL,
  `mota` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `namesp`, `amount`, `tacgia`, `price`, `sell_price`, `img`, `luotxem`, `iddm`, `mota`) VALUES
(6, 'Trôi - Nguyễn Ngọc Tư', 1207, 'Nguyễn Ngọc Tư', 90000, 15000, 'troi.jpg', 1234, 3, '“Em thà trôi một mình. Nhưng những gì còn sót lại của một cù lao phân rã chẳng là bao. Vài ba mái nhà lấp ló trên mặt nước, một vài cái lu, những rẻo đất đủ rộng cho một người ngồi thì cũng có, lại trôi đờ đẫn đằng xa. Mãi mới có mảnh đất trôi gần, đúng lúc nó rùng mình nứt làm hai.\r\n\r\nTrong mê lộ của nước, mình chẳng biết trôi được đến đâu. Không bãi bờ gì để định vị. Ngó đâu cũng chỉ thấy nước và bọt nước, cùng những vật chất nổi nênh.\r\n\r\nGiờ thì mạnh ai nấy trôi.” - Trích tác phẩm.'),
(10, 'Người Tập Lớn', 23, 'Chà', 109000, 10000, 'nguoi-tap-lon.jpg', 32423, 2, 'Chà – một tác giả mới được nhiều bạn đọc yêu thích nhờ lối viết hài hước, dễ thương. Chà mang đến sự tích cực qua từng trang viết với giọng văn gần gũi, giản dị. Những câu chuyện mà bất cứ ai cũng dễ gặp phải sẽ được kể qua một lăng kính mới đầy tích cực. Cuốn sách đầu tay “Người tập lớn” được phát hành vào tháng 2 như một lời nhắc bạn hãy chậm lại một chút để cảm nhận những điều tử tế giữa cuộc sống này.'),
(11, 'Hoàng Tử Bé', 234, 'Antoine de Saint-Exupéry', 50000, 5000, 'hoang-tu-be.jpg', 123, 1, 'Hoàng tử bé được xuất bản lần đầu năm 1943 của nhà văn, phi công người Pháp Antoine de Saint-exupéry là một trong những cuốn tiểu thuyết kinh điển nổi tiếng nhất mọi thời đại. Câu chuyện ngắn gọn về cuộc gặp gỡ diệu kỳ giữa viên phi công bị rơi máy bay và Hoàng tử bé giữa sa mạc Sa-ha-ra hoang vu. Hành tinh quê hương và các mối quan hệ của hoàng tử bé dần hé lộ: Tình bạn, tình yêu thương của Hoàng tử bé dành cho bông hồng duy nhất, tình cảm sâu sắc dành cho chú cáo.'),
(12, 'Thỏ Bảy Màu Và Những Người Nghĩ Nó Là Bạn ', 1241, 'HUỲNH THÁI NGỌC', 99000, 25000, 'tho-7-mau.jpg', 2454, 1, 'Thỏ Bảy Màu là fanpage sở hữu hơn 2,6tr lượt thích trên mạng xã hội. Với hình tượng nhân vật thú vị cùng phong cách sáng tạo độc đáo, Thỏ bảy màu vẫn luôn là thu hút được số lượng lớn người quan tâm thể hiện qua nhiều bài viết với hàng chục nghìn lượt like và share.\r\n\r\nThỏ Bảy Màu là một nhân vật hư cấu chẳng còn xa lạ gì với anh em dùng mạng xã hội với slogan “Nghe lời Thỏ, kiếp này coi như bỏ!”.'),
(13, 'Truyện Kinh Dị Việt Nam - Truyện Đường Rừng', 243, 'Lan Khai', 50000, 15000, 'duong-rung.jpg', 234, 3, '“Là một cây bút nổi tiếng trên văn đàn cả nước những năm ba mươi đầu thế kỷ XX, các sáng tác của Lan Khai (Lâm Tuyền Khách) đã sớm xuất hiện trên các tờ báo: Loa, Ngọ Báo, Đông Pháp, Đông Phương, Rạng Đông, Tiểu thuyết thứ Bảy, Ích Hữu, Phổ thông bán nguyệt san... Đồng hành với những cuốn tiểu thuyết về đường rừng, về tâm lý - xã hội và lịch sử, tác phẩm lý luận phê bình, các bài ký, các công trình sưu tầm văn học dân gian, những bản dịch, những tác phẩm hội họa, còn xuất hiện hàng loạt những truyện ngắn truyền kỳ và truyện cổ tích thần kỳ của Nhà văn đường rừng với các chủ đề và kiểu dạng khác nhau, đã góp phần vào cuộc cách tân thể loại văn học, để lại ấn tượng sâu đậm trong bạn đọc hơn tám thập niên qua.'),
(14, 'Nam Thiên Kì Đàm', 234, 'Fanpage Truyện Thần Thoại', 40000, 5000, 'nam-thien-ky.jpg', 342, 3, '“Trời đất thiên địa sinh ra vạn vật trên đời. Lẫn giữa người phàm, đã có bậc thánh nhân, tiên Phật oai linh, thì cũng sẽ có những loài yêu ma quỷ quái dị thường. Khi thì là đại thụ thành tinh, khi lại là vong hồn oan khuất còn lưu luyến cõi trần, lúc lại từ loài súc sinh hóa thành. Từ thuở xa xưa, chúng đã luôn tồn tại bên cạnh chúng ta trong muôn hình vạn trạng. Nay lục tìm sách vở, hoặc nhớ lại lời cổ nhân mà kể ra đôi chuyện quỷ dị.”');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id` int(11) NOT NULL,
  `user` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `email` varchar(120) NOT NULL,
  `role` int(11) DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1,
  `tel` varchar(25) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`id`, `user`, `pass`, `email`, `role`, `status`, `tel`, `address`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', 2, 1, '0377777777', 'laclongquan'),
(2, 'chocho', '123456', 'cho@gmail.com', 1, 1, '', '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sp` (`ma_sp`) USING BTREE,
  ADD KEY `lk_binhluan_khachhang` (`ma_kh`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lk_sanpham_danhmuc` (`iddm`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `lk_binhluan_khachhang` FOREIGN KEY (`ma_kh`) REFERENCES `taikhoan` (`id`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `lk_sanpham_danhmuc` FOREIGN KEY (`iddm`) REFERENCES `danhmuc` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
