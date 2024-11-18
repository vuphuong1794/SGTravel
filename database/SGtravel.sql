-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 18, 2024 lúc 03:13 AM
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
-- Cơ sở dữ liệu: `sgtravel`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bao_cao`
--

CREATE TABLE `bao_cao` (
  `id` int(11) NOT NULL,
  `id_dia_diem` int(11) NOT NULL,
  `noi_dung_bao_cao` text NOT NULL,
  `id_tai_khoan` int(11) NOT NULL,
  `ngay_bao_cao` date NOT NULL,
  `trang_thai` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bao_cao`
--

INSERT INTO `bao_cao` (`id`, `id_dia_diem`, `noi_dung_bao_cao`, `id_tai_khoan`, `ngay_bao_cao`, `trang_thai`) VALUES
(1, 5, 'Phàn nàn về dịch vụ kém', 10, '2024-10-01', 'Đang xử lý'),
(2, 12, 'Thực phẩm không đạt yêu cầu', 3, '2024-10-02', 'Đã xử lý'),
(3, 35, 'Giá cả không rõ ràng', 22, '2024-10-05', 'Đang xử lý'),
(4, 89, 'Không gian không thoáng mát', 7, '2024-10-06', 'Đã xử lý'),
(5, 43, 'Phục vụ thiếu chuyên nghiệp', 15, '2024-10-08', 'Đang xử lý'),
(6, 66, 'Chờ đợi quá lâu', 8, '2024-10-09', 'Đã xử lý'),
(7, 121, 'Chất lượng sản phẩm kém', 5, '2024-10-10', 'Đang xử lý'),
(8, 153, 'Thiếu vệ sinh', 33, '2024-10-11', 'Đã xử lý'),
(9, 178, 'Dịch vụ không đáp ứng mong đợi', 45, '2024-10-12', 'Đang xử lý'),
(10, 190, 'Thái độ nhân viên không tốt', 12, '2024-10-13', 'Đã xử lý');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binh_luan`
--

CREATE TABLE `binh_luan` (
  `id` int(11) NOT NULL,
  `noi_dung` text NOT NULL,
  `id_dia_diem` int(11) DEFAULT NULL,
  `id_nguoi_dung` int(11) DEFAULT NULL,
  `ten_dang_nhap` varchar(100) NOT NULL,
  `ngay_binh_luan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `binh_luan`
--

INSERT INTO `binh_luan` (`id`, `noi_dung`, `id_dia_diem`, `id_nguoi_dung`, `ten_dang_nhap`, `ngay_binh_luan`) VALUES
(1, 'Giá cực kì đắt. Phần nhân k như mong muốn. Phục vụ kém, chờ siêu lâu mà còn chảy hết cả mồ hôi. Tiết kiệm điện quá mức, nóng như cái lò. KHÔNG NÊN MUA:(', 1, 9, 'nguyentuananh', '2024-01-01'),
(2, 'Có rất nhiều món mới bò nướng, tôm nướng, cá đuối, bạch tuộc, bò nhúng ớt có mặt ở quán. Ăn xong free chè lun nha các chế 😋😋😋😋 vote vote', 1, 9, 'nguyentuananh', '2024-01-02'),
(3, 'Tớ thích ăn Jollibee cực kì. Khi nào đi học về tớ cũng ăn. Ở đây mát gà rán ngon giòn. Nhưng có điều tớ không thích là cách phục vụ :(. Khi tớ order thì đáng nhẽ là lượt của tớ nhưng nhân viên lại order cho khách khác mặc dù tớ đứng rất lâu. Bỏ qua chuyện này đi. Thì đến cái lúc mà tớ đc order rồi í. Thì nhân viên kiểu kiểu thái độ không vui vẻ cho lắm ăn nói thì kiểu trống không mặt mày thì nhăn nhó. Chả lịch sự tí nào. Nhân viên nữ thì đã đành ai ngờ nhân viên nam cũng vậy :(. Mình đang ngồi ăn thì nhân viên quét dọn lại lấy cái chổi quét dưới chân mình làm như muốn đuổi í :( Bực không tả nổi :).', 7, 3, 'tranthithuy', '2024-01-03'),
(4, 'Quán này không biết mở được lâu chưa, cơ mà mình giờ mới có cơ hội ăn thử :)). Quán khá rộng, được bố trí sạch sẽ, thoáng mát. Cũng như cơm tấm ở những chỗ khác thì đâu cũng có giá muối chua, 1 ít cá bống, thêm ít lát dưa chuột, trứng cộng với món chủ lực là sườn nướng.. Đi tới gần quán là mùi sườn nướng đã bay nồng khắp rồi, mình cùng tụi bạn còn đùa không lẽ dân cư quanh đây ngày nào cũng được thưởng thức không mất tiền sao? :)) Đồ ăn quán khá ngon, mua cơm hộp thì có khay khá lịch sự. Giá cả từ 35-55 tùy món.', 3, 4, 'leminhcuong', '2024-01-04'),
(5, 'Lần đầu tiên mình đưa gia đình vào Nhật Lệ, cảm nhận đầu tiên là con người ở đây rất mến và quý khách. Dạo quanh một vòng mình thấy quán hải sản Minh Lưu, được mọi người đánh giá rất cao nên mình đã đưa gia đình đến trải nghiệm. Cảm nhận đầu tiên là không gian quán ở đây rất mát mẻ, quán sạch sẽ, chủ quán vui vẻ, món ăn ở đây rất ngon không chỉ hợp với gia đình mình mà rất hợp với bọn trẻ. Ăn món nào cũng ngon, cua ghẹ rất chắc con nào con ấy rất đầy thịt, quán có bể hải sản nuôi tôm hùm cá mú bơi tại quán tha hồ chọn, và đặc biệt là cách chế biến không cay xè rất hợp với người miền Bắc. Như mình, và đặc biệt món mực tươi và mực một nắng rất tươi và rất ngọt, nên mình muốn chia sẻ cho mọi người biết, chuyến trải nghiệm đúng là quá tuyệt vời.', 4, 5, 'phamquanghuy', '2024-01-05'),
(6, 'Chất lượng ok. Nhà hàng có vị trí đẹp 10 điểm, món ăn ngon 10 điểm, phục vụ nhiệt tình 10 điểm, nói chung là Ok giá cả phải chăng.', 5, 6, 'hoangngoclan', '2024-01-06'),
(7, 'Đặt bánh tròn 20cm nhưng lúc nhận bánh thì chỉ có gần 2/3 bề mặt bánh là có nhân.', 6, 7, 'vuongthanhdat', '2024-01-07'),
(8, 'Pizza ngon, phục vụ tốt.', 7, 8, 'dangquangdai', '2024-01-08'),
(9, 'Nhân viên phục vụ tốt, giá thành phù hợp, sẽ quay lại.', 8, 9, 'nguyentuananh', '2024-01-09'),
(10, 'Khách sạn 4 sao nằm ngay trung tâm thành phố nên rất dễ tìm. Cũng có lẽ vì thế chỉ cần nói địa chỉ là taxi đã biết ngay đó là khách sạn gì. Sảnh khách sạn khá rộng, với nhiều bộ bàn ghế khách ngồi tại sảnh. Món ăn ở đây tuyệt vời phục vụ nhiệt tình.', 9, 10, 'tranlethu', '2024-01-10'),
(11, 'Mình đặt 3 phần buổi trưa, giao đến toàn đồ nguội như từ hôm qua, chả ram thì dai, dồi thì chiên lại, đậu thì mềm,... mắc nữa chứ. Không ngon.', 10, 11, 'phamminhthang', '2024-01-11'),
(12, 'Phải nói món gà ở đây thật tuyệt, gà nuôi trên miền núi nên thịt dai, da giòn và vị ngọt rất ngon. Sự kết hợp với lá é và kỹ thuật ướp gia vị, cho ra món Lẩu Gà Lá É tuyệt cú mèo: Mùi thơm nồng, vị ngọt thanh và miếng gà ngon hết sảy! Đúng là món chủ đạo của quán trong rất nhiều món đặc trưng của vùng miền núi!', 11, 12, 'nguyenlan', '2024-01-12'),
(13, 'Quán này mới khai trương, tiếp tục giảm giá 20% đến hết ngày 19/12. Quán nằm trên đường Bà Triệu nên không được chú ý nhiều. Được cái là sạch sẽ, có cả bàn ngồi ghế và sàn ngồi nên mình cũng thích.', 12, 13, 'lethanhhoang', '2024-01-13'),
(14, 'Quán này làm ngon.', 13, 14, 'trinhthihanh', '2024-01-14'),
(15, 'Quán nấu ăn ngon.', 14, 15, 'vuongdinhkhoa', '2024-01-15'),
(16, 'Nhân viên phục vụ tốt, giá thành phù hợp, sẽ quay lại.', 15, 16, 'hoangtrongdat', '2024-01-16'),
(17, 'Chất lượng không đáng với số tiền.', 16, 17, 'phamthanhcong', '2024-01-17'),
(18, 'Đáng đồng tiền.', 17, 18, 'dangthanhha', '2024-01-18'),
(19, 'Giá hợp lý cho cả gia đình.', 18, 19, 'tranthehuong', '2024-01-19'),
(21, 'Đồ ăn ngon, tinh tế, chế biến nóng hổi.', 20, 21, 'vuthanh', '2024-01-21'),
(22, 'Phục vụ chu đáo, nhiệt tình và niềm nở.', 21, 22, 'phamnhut', '2024-01-22'),
(23, 'Buổi sáng có quán phở 2 tô.', 22, 23, 'lethanhtruong', '2024-01-23'),
(24, 'Giá cả rẻ, hợp lý.', 23, 24, 'tranhongson', '2024-01-24'),
(25, 'Kết luận: ok.', 24, 25, 'vuonghong', '2024-01-25'),
(26, 'Nhà hàng Hương Quê thực sự là một viên ngọc ẩn mình giữa lòng Bắc Kạn.', 25, 26, 'nguyenquocdat', '2024-01-26'),
(27, 'Bia ngon đồ ăn phong phú có nhiều món lạ. Thái độ nhân viên nhiệt tình.', 26, 27, 'tranquocbinh', '2024-01-27'),
(28, 'Khách sạn bẩn, toàn mùi thuốc lá nồng nặc từ hành lang cho đến khi vào phòng.', 27, 28, 'hoangcuong', '2024-01-28'),
(29, 'Không gian mát mẻ, giá tốt, thoải mái.', 28, 29, 'dangquynh', '2024-01-29'),
(30, 'Sạch đẹp.', 29, 30, 'vuthikim', '2024-01-30'),
(31, 'Quá đã.', 30, 31, 'nguyenminh', '2024-01-31'),
(32, 'Quán này đồ ăn ngon mà phục vụ rất nhiệt tình và dễ thương.', 31, 32, 'tranhuong', '2024-02-01'),
(33, 'Không gian sang trọng, rộng rãi.', 32, 33, 'phamtruong', '2024-02-02'),
(34, 'Đồ ăn phong phú, thái độ nhân viên ok.', 33, 34, 'vuongdinh', '2024-02-03'),
(35, 'Không đáng đồng tiền.', 34, 35, 'nguyenxuan', '2024-02-04'),
(36, 'Hôm mình đến có 3 người khách, nhạc còn chưa đủ hay để ngồi lại.', 35, 36, 'tranthang', '2024-02-05'),
(37, 'Nhà hàng sang trọng nhưng món ăn không ngon như hình.', 36, 37, 'hoangtrinh', '2024-02-06'),
(38, 'Phục vụ ổn.', 37, 38, 'danglam', '2024-02-07'),
(39, 'Giá cả hợp lý, phục vụ nhanh.', 38, 39, 'vuthien', '2024-02-08'),
(40, 'Chỉ đơn giản là ghét!', 39, 40, 'nguyenduc', '2024-02-09'),
(41, 'Quán rất dễ tìm.', 40, 41, 'phamduy', '2024-02-10'),
(42, 'Tôi rất thích các món ăn của nhà hàng.', 41, 42, 'trongngoc', '2024-02-11'),
(43, 'Rau muống xào tỏi được ướp gia vị rất vừa ăn.', 42, 43, 'vuongminh', '2024-02-12'),
(44, 'Nhà hàng phong cách thiết kế hiện đại và ấm cúng, thích hợp cho các bữa tiệc nhỏ.', 43, 44, 'nguyenkim', '2024-02-13'),
(45, 'Quán có vị trí rất thuận lợi cho việc đi lại.', 44, 45, 'tranhoang', '2024-02-14'),
(46, 'Mình đi ăn một lần rồi thấy rất ngon nên hôm sau dẫn bạn bè đến ăn cùng.', 45, 46, 'phamvan', '2024-02-15'),
(47, 'Món ăn siêu ngon, nhân viên rất thân thiện.', 46, 47, 'dangtuan', '2024-02-16'),
(48, 'Quán có không gian thoáng đãng, sạch sẽ.', 47, 48, 'vuongtrong', '2024-02-17'),
(49, 'Có nhân viên phục vụ tận tình, thức ăn rất ngon.', 48, 49, 'nguyenhai', '2024-02-18'),
(50, 'Rất hài lòng về dịch vụ ở đây.', 49, 50, 'tranvan', '2024-02-19'),
(51, 'Món ăn rất đa dạng.', 50, 50, 'hoangthanh', '2024-02-20'),
(52, 'Địa điểm này rất tuyệt vời, không gian thoáng đãng và dịch vụ tốt.', 51, 6, 'hoangngoclan', '2024-10-16'),
(53, 'Đồ ăn ở đây khá ngon, giá cả hợp lý, tôi sẽ quay lại lần sau.', 52, 6, 'hoangngoclan', '2024-10-16'),
(54, 'Phòng nghỉ rộng rãi, sạch sẽ, rất đáng tiền.', 53, 3, 'tranthithuy', '2024-10-16'),
(55, 'Tôi thích không gian yên tĩnh ở đây, phù hợp để nghỉ ngơi.', 54, 4, 'leminhcuong', '2024-10-16'),
(56, 'Dịch vụ chăm sóc khách hàng chưa được tốt, cần cải thiện.', 55, 5, 'phamquanghuy', '2024-10-16'),
(57, 'Phong cảnh đẹp, tuy nhiên nhà vệ sinh hơi bẩn.', 56, 6, 'hoangngoclan', '2024-10-16'),
(58, 'Thức ăn ngon, nhân viên phục vụ nhiệt tình.', 57, 7, 'vuongthanhdat', '2024-10-16'),
(59, 'Giá cả hơi đắt so với chất lượng dịch vụ.', 58, 8, 'dangquangdai', '2024-10-16'),
(60, 'Địa điểm này rất thú vị, tôi sẽ giới thiệu cho bạn bè.', 59, 9, 'nguyentuananh', '2024-10-16'),
(61, 'Tôi không hài lòng về chất lượng dịch vụ ở đây.', 60, 10, 'tranlethu', '2024-10-16'),
(62, 'Quán cà phê đẹp, yên tĩnh, thích hợp để làm việc.', 61, 11, 'phamminhthang', '2024-10-16'),
(63, 'Không gian thoáng mát, rất thư giãn.', 62, 12, 'nguyenlan', '2024-10-16'),
(64, 'Dịch vụ rất chuyên nghiệp, tôi rất hài lòng.', 63, 13, 'lethanhhoang', '2024-10-16'),
(65, 'Nhân viên phục vụ chu đáo, đồ ăn ngon.', 64, 14, 'trinhthihanh', '2024-10-16'),
(66, 'Phong cảnh hữu tình, rất phù hợp để nghỉ dưỡng.', 65, 15, 'vuongdinhkhoa', '2024-10-16'),
(67, 'Quán có không gian nhỏ nhưng ấm cúng, giá cả phải chăng.', 66, 16, 'hoangtrongdat', '2024-10-16'),
(68, 'Dịch vụ rất tốt, nhưng phòng tắm cần được cải thiện.', 67, 17, 'phamthanhcong', '2024-10-16'),
(69, 'Địa điểm rất tuyệt, rất thích hợp để nghỉ dưỡng cùng gia đình.', 68, 18, 'dangthanhha', '2024-10-16'),
(70, 'Đồ ăn ngon, giá cả hợp lý.', 69, 19, 'tranthehuong', '2024-10-16'),
(72, 'Dịch vụ tốt, không gian sạch sẽ, tôi rất hài lòng.', 71, 21, 'vuthanh', '2024-10-16'),
(73, 'Nhân viên phục vụ chưa nhiệt tình, cần cải thiện.', 72, 22, 'phamnhut', '2024-10-16'),
(74, 'Phong cảnh đẹp, nhưng chất lượng dịch vụ chưa tương xứng.', 73, 23, 'lethanhtruong', '2024-10-16'),
(75, 'Thức ăn rất ngon, tôi sẽ quay lại.', 74, 24, 'tranhongson', '2024-10-16'),
(76, 'Địa điểm đẹp, nhưng giá cả hơi cao.', 75, 25, 'vuonghong', '2024-10-16'),
(77, 'Tôi rất thích nơi này, phù hợp để nghỉ dưỡng.', 76, 26, 'nguyenquocdat', '2024-10-16'),
(78, 'Phục vụ tốt, không gian thoáng đãng.', 77, 27, 'tranquocbinh', '2024-10-16'),
(79, 'Dịch vụ ổn, nhưng nhà hàng hơi ồn.', 78, 28, 'hoangcuong', '2024-10-16'),
(80, 'Không gian đẹp, nhưng phục vụ chưa tốt.', 79, 29, 'dangquynh', '2024-10-16'),
(81, 'Rất thích không gian ở đây, phong cách độc đáo.', 80, 30, 'vuthikim', '2024-10-16'),
(82, 'Dịch vụ rất kém, tôi không hài lòng.', 81, 31, 'trangvan', '2024-10-16'),
(83, 'Không gian yên tĩnh, phù hợp để thư giãn.', 82, 32, 'minhthuy', '2024-10-16'),
(84, 'Dịch vụ tốt, nhân viên thân thiện.', 83, 33, 'huyentran', '2024-10-16'),
(85, 'Chất lượng thức ăn rất tốt, tôi sẽ giới thiệu cho bạn bè.', 84, 34, 'thanhnhan', '2024-10-16'),
(86, 'Địa điểm này rất đẹp, giá cả hợp lý.', 85, 35, 'vananh', '2024-10-16'),
(87, 'Không gian rộng rãi, thoáng mát, nhân viên phục vụ chu đáo.', 86, 36, 'trangnhat', '2024-10-16'),
(88, 'Phục vụ chuyên nghiệp, không gian rất yên tĩnh.', 87, 37, 'lanhuong', '2024-10-16'),
(90, 'Dịch vụ tốt nhưng đồ ăn chưa ngon lắm.', 89, 39, 'lindang', '2024-10-16'),
(91, 'Không gian ấm cúng, thích hợp cho các buổi hẹn hò.', 90, 40, 'thanhha', '2024-10-16'),
(92, 'Thức ăn tươi ngon, nhân viên thân thiện.', 91, 41, 'kimngoc', '2024-10-16'),
(93, 'Không gian quán cà phê rất yên tĩnh, tôi thích nơi này.', 92, 42, 'thuynhi', '2024-09-10'),
(94, 'Phong cảnh rất đẹp, nhưng dịch vụ chưa tốt.', 93, 43, 'vanchau', '2024-08-25'),
(95, 'Thức ăn ngon, phục vụ nhanh chóng, tôi rất hài lòng.', 94, 44, 'hongsang', '2024-07-05'),
(96, 'Không gian đẹp, dịch vụ tốt, rất đáng để ghé thăm.', 95, 45, 'hoangson', '2024-06-18'),
(97, 'Nhân viên phục vụ nhiệt tình, không gian quán rộng rãi.', 96, 46, 'nhatminh', '2024-05-22'),
(98, 'Dịch vụ rất tuyệt, tôi sẽ quay lại lần sau.', 97, 47, 'thanhkhoan', '2024-04-11'),
(99, 'Quán cà phê có không gian rất ấm cúng, thích hợp để thư giãn.', 98, 48, 'duonghuong', '2024-03-28'),
(100, 'Tôi hài lòng về dịch vụ và chất lượng nơi đây.', 99, 49, 'trucdo', '2024-03-07'),
(101, 'Phong cảnh đẹp, thức ăn ngon, giá cả hợp lý.', 100, 50, 'namthanh', '2024-02-15'),
(103, 'Dịch vụ tốt nhưng giá cả hơi cao.', 102, 2, 'Tester', '2024-01-05'),
(104, 'Phong cách phục vụ rất chuyên nghiệp, tôi rất hài lòng.', 103, 3, 'tranthithuy', '2023-12-20'),
(105, 'Không gian rộng rãi, thích hợp cho các buổi gặp gỡ bạn bè.', 104, 4, 'leminhcuong', '2023-11-30'),
(106, 'Thức ăn ngon, nhưng phục vụ hơi chậm.', 105, 5, 'phamquanghuy', '2023-11-10'),
(107, 'Giá cả hợp lý, nhưng dịch vụ chưa tốt.', 106, 6, 'hoangngoclan', '2023-10-25'),
(108, 'Phong cảnh đẹp, dịch vụ tốt, tôi sẽ quay lại.', 107, 7, 'vuongthanhdat', '2023-09-14'),
(109, 'Nhân viên thân thiện, không gian thoáng đãng.', 108, 8, 'dangquangdai', '2023-08-29'),
(110, 'Dịch vụ tốt, tuy nhiên đồ uống không ngon lắm.', 109, 9, 'nguyentuananh', '2023-08-08'),
(111, 'Không gian nhỏ nhưng ấm cúng, tôi thích nơi này.', 110, 10, 'tranlethu', '2023-07-21'),
(112, 'Địa điểm này rất thú vị, nhân viên phục vụ rất chu đáo.', 111, 11, 'phamminhthang', '2023-06-10'),
(113, 'Dịch vụ khá tốt, không gian thoáng mát.', 132, 32, 'minhthuy', '2024-09-30'),
(114, 'Không gian rất đẹp, nhưng thức ăn chưa ngon.', 133, 33, 'huyentran', '2024-09-15'),
(115, 'Phong cách phục vụ chuyên nghiệp, giá cả hợp lý.', 134, 34, 'thanhnhan', '2024-08-22'),
(117, 'Dịch vụ tốt nhưng không gian hơi chật.', 136, 36, 'trangnhat', '2024-07-29'),
(118, 'Thức ăn ngon, nhưng giá cả cao hơn mong đợi.', 137, 37, 'lanhuong', '2024-07-15'),
(119, 'Không gian quán rộng rãi, rất thích hợp để gặp gỡ bạn bè.', 138, 38, 'thaithuy', '2024-06-20'),
(120, 'Phong cảnh đẹp, nhưng phục vụ hơi chậm.', 139, 39, 'lindang', '2024-06-10'),
(121, 'Không gian thoáng mát, thức ăn tươi ngon.', 140, 40, 'thanhha', '2024-05-25'),
(122, 'Dịch vụ chu đáo, nhưng không gian chưa ấn tượng lắm.', 141, 41, 'kimngoc', '2024-05-15'),
(123, 'Quán có không gian yên tĩnh, rất thích hợp để làm việc.', 142, 42, 'thuynhi', '2024-04-30'),
(125, 'Nhân viên phục vụ chuyên nghiệp, rất hài lòng.', 144, 44, 'hongsang', '2024-03-28'),
(126, 'Thức ăn ngon, phong cách phục vụ nhanh nhẹn.', 145, 45, 'hoangson', '2024-03-10'),
(127, 'Không gian ấm cúng, phù hợp cho gia đình.', 146, 46, 'nhatminh', '2024-02-22'),
(128, 'Dịch vụ rất tốt, nhưng giá cả cao.', 147, 47, 'thanhkhoan', '2024-02-10'),
(129, 'Nhân viên thân thiện, không gian quán rất đẹp.', 148, 48, 'duonghuong', '2024-01-18'),
(130, 'Giá cả hợp lý, dịch vụ chưa tốt lắm.', 149, 49, 'trucdo', '2024-01-02'),
(131, 'Quán cà phê có không gian rất thoáng, thích hợp để thư giãn.', 150, 50, 'namthanh', '2023-12-21'),
(132, 'Dịch vụ tốt, nhưng nhân viên phục vụ chưa thân thiện.', 151, 44, 'hongsang', '2023-11-30'),
(133, 'Không gian đẹp, thức ăn ngon, rất thích hợp để thư giãn.', 151, 12, 'nguyenlan', '2024-09-05'),
(134, 'Dịch vụ tốt, nhân viên thân thiện.', 152, 13, 'lethanhhoang', '2024-08-12'),
(135, 'Quán có phong cách đẹp, nhưng phục vụ hơi chậm.', 153, 14, 'trinhthihanh', '2024-07-18'),
(136, 'Không gian quán rộng rãi, rất thoải mái.', 154, 15, 'vuongdinhkhoa', '2024-06-30'),
(137, 'Thức ăn ngon, dịch vụ ổn.', 155, 16, 'hoangtrongdat', '2024-06-08'),
(138, 'Nhân viên phục vụ không thân thiện lắm.', 156, 17, 'phamthanhcong', '2024-05-19'),
(139, 'Không gian ấm cúng, phục vụ chu đáo.', 157, 18, 'dangthanhha', '2024-05-02'),
(140, 'Dịch vụ tốt, nhưng không gian hơi chật.', 158, 19, 'tranthehuong', '2024-04-17'),
(142, 'Giá cả hợp lý, nhưng phục vụ chưa tốt.', 160, 21, 'vuthanh', '2024-03-05'),
(143, 'Dịch vụ nhanh chóng, thức ăn rất ngon.', 161, 22, 'phamnhut', '2024-02-18'),
(144, 'Không gian yên tĩnh, rất thích hợp để làm việc.', 162, 23, 'lethanhtruong', '2024-01-27'),
(145, 'Nhân viên phục vụ tốt, nhưng không gian chưa đẹp.', 163, 24, 'tranhongson', '2024-01-10'),
(146, 'Quán cà phê rất ấm cúng, giá cả hợp lý.', 164, 25, 'vuonghong', '2023-12-19'),
(147, 'Dịch vụ khá tốt, nhưng món ăn chưa đặc biệt.', 165, 26, 'nguyenquocdat', '2023-12-05'),
(148, 'Không gian nhỏ, nhưng thức ăn ngon.', 166, 27, 'tranquocbinh', '2023-11-23'),
(150, 'Nhân viên thân thiện, không gian đẹp.', 168, 29, 'dangquynh', '2023-10-15'),
(151, 'Không gian thoáng, dịch vụ ổn định.', 169, 30, 'vuthikim', '2023-09-26'),
(152, 'Dịch vụ chuyên nghiệp, nhưng giá hơi cao.', 170, 31, 'trangvan', '2023-09-08'),
(153, 'Không gian quán thoáng đãng, đồ uống ngon.', 171, 32, 'minhthuy', '2023-08-18'),
(154, 'Thức ăn ngon, nhưng không gian hơi ồn ào.', 172, 33, 'huyentran', '2023-07-29'),
(155, 'Dịch vụ nhanh, không gian nhỏ nhưng đẹp.', 173, 34, 'thanhnhan', '2023-07-05'),
(156, 'Nhân viên phục vụ không tốt lắm, nhưng thức ăn ngon.', 174, 35, 'vananh', '2023-06-12'),
(157, 'Dịch vụ ổn, nhưng không gian hơi cũ.', 175, 36, 'trangnhat', '2023-05-24'),
(158, 'Không gian quán cà phê rất dễ chịu, thích hợp để làm việc.', 176, 37, 'lanhuong', '2023-04-15'),
(159, 'Thức ăn ngon, không gian ấm cúng, phục vụ nhiệt tình.', 177, 38, 'thaithuy', '2023-03-22'),
(160, 'Không gian rất đẹp, nhưng giá cả hơi cao.', 178, 39, 'lindang', '2023-03-02'),
(161, 'Nhân viên thân thiện, thức ăn ngon.', 179, 40, 'thanhha', '2023-02-16'),
(162, 'Không gian rộng, phục vụ tốt.', 180, 41, 'kimngoc', '2023-01-30'),
(163, 'Quán có view đẹp, nhưng đồ uống không ngon.', 181, 42, 'thuynhi', '2022-12-12'),
(164, 'Dịch vụ ổn, nhưng không gian hơi hẹp.', 182, 43, 'vanchau', '2022-11-20'),
(165, 'Nhân viên phục vụ nhiệt tình, thức ăn ngon.', 183, 44, 'hongsang', '2022-11-02'),
(166, 'Không gian quán nhỏ, nhưng phong cách độc đáo.', 184, 45, 'hoangson', '2022-10-10'),
(167, 'Không gian quán thoáng đãng, nhưng phục vụ chưa chu đáo.', 185, 46, 'nhatminh', '2023-09-18'),
(168, 'Dịch vụ tốt, nhưng giá cả không hợp lý.', 186, 47, 'thanhkhoan', '2023-08-07'),
(169, 'Thức ăn ổn, nhưng không gian không ấn tượng.', 187, 48, 'duonghuong', '2023-07-21'),
(170, 'Phục vụ chậm, nhưng không gian đẹp.', 188, 49, 'trucdo', '2023-06-13'),
(171, 'Quán cà phê đẹp, đồ uống ngon, nhưng giá hơi cao.', 189, 50, 'namthanh', '2023-05-01'),
(172, 'Nhân viên rất thân thiện, không gian rộng rãi.', 190, 34, 'thanhnhan', '2023-04-10'),
(173, 'Thức ăn ngon, dịch vụ ổn, không gian không đặc sắc.', 191, 34, 'thanhnhan', '2023-03-28'),
(174, 'Quán cà phê yên tĩnh, nhưng phục vụ chưa tốt.', 51, 3, 'tranthithuy', '2023-02-14'),
(175, 'Dịch vụ tốt, nhưng không gian hơi chật.', 52, 4, 'leminhcuong', '2023-01-09'),
(176, 'Thức ăn ngon, không gian ấm cúng.', 53, 5, 'phamquanghuy', '2022-12-19'),
(177, 'Không gian rất đẹp, tôi sẽ quay lại lần sau.', 54, 6, 'hoangngoclan', '2022-11-11'),
(178, 'Dịch vụ nhanh chóng, nhưng giá hơi cao.', 55, 7, 'vuongthanhdat', '2022-10-03'),
(179, 'Không gian rộng, thích hợp cho các buổi gặp gỡ bạn bè.', 56, 8, 'dangquangdai', '2022-09-15'),
(180, 'Dịch vụ tốt, nhưng đồ uống chưa ngon.', 57, 9, 'nguyentuananh', '2022-08-22'),
(181, 'Thức ăn rất ngon, nhân viên phục vụ nhiệt tình.', 58, 10, 'tranlethu', '2022-07-29'),
(182, 'Không gian quán đẹp, nhưng hơi ồn ào.', 59, 11, 'phamminhthang', '2022-06-14'),
(183, 'Dịch vụ rất tuyệt, nhưng giá hơi cao.', 60, 12, 'nguyenlan', '2022-05-07'),
(184, 'Thức ăn ngon, nhưng không gian chưa ấn tượng.', 61, 13, 'lethanhhoang', '2022-04-18'),
(185, 'Không gian rộng, nhân viên phục vụ tốt.', 62, 14, 'trinhthihanh', '2022-03-22'),
(186, 'Giá cả hợp lý, dịch vụ tốt, tôi sẽ quay lại.', 63, 15, 'vuongdinhkhoa', '2022-02-25'),
(187, 'Không gian quán cà phê rất đẹp, thức ăn ngon.', 64, 16, 'hoangtrongdat', '2022-01-16'),
(188, 'Phục vụ không tốt lắm, nhưng đồ uống ngon.', 65, 17, 'phamthanhcong', '2021-12-09'),
(189, 'Nhân viên rất chu đáo, không gian quán đẹp.', 66, 18, 'dangthanhha', '2021-11-20'),
(190, 'Thức ăn không ngon lắm, nhưng giá hợp lý.', 67, 19, 'tranthehuong', '2021-10-01'),
(192, 'Nhân viên phục vụ chưa chuyên nghiệp, nhưng phong cảnh đẹp.', 69, 21, 'vuthanh', '2021-08-10'),
(193, 'Không gian nhỏ, nhưng thức ăn ngon.', 70, 22, 'phamnhut', '2021-07-07'),
(194, 'Dịch vụ tốt, thức ăn ngon.', 71, 23, 'lethanhtruong', '2021-06-19'),
(195, 'Nhân viên phục vụ rất nhiệt tình, không gian quán thoáng đãng.', 72, 24, 'tranhongson', '2021-05-11'),
(196, 'Không gian thoáng mát, thức ăn ngon.', 73, 25, 'vuonghong', '2021-04-08'),
(197, 'Quán cà phê rất đẹp, nhưng giá hơi cao.', 74, 26, 'nguyenquocdat', '2021-03-22'),
(198, 'Phục vụ nhanh chóng, nhưng không gian chưa tốt lắm.', 75, 27, 'tranquocbinh', '2021-02-17'),
(199, 'Không gian quán rất rộng rãi, nhưng đồ uống chưa ngon.', 76, 28, 'hoangcuong', '2021-01-05'),
(206, 'Mát mẻ', 121, NULL, '0', '0000-00-00'),
(207, 'Mát mẻ', 121, NULL, '0', '0000-00-00'),
(208, 'Mát mẻ', 121, NULL, '0', '0000-00-00'),
(213, 'ăn ngon', 1, 51, 'teonv', '0000-00-00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_gia`
--

CREATE TABLE `danh_gia` (
  `id` int(11) NOT NULL,
  `id_dia_diem` int(11) NOT NULL,
  `phuc_vu` decimal(3,1) NOT NULL,
  `khong_gian` decimal(3,1) NOT NULL,
  `chat_luong` decimal(3,1) NOT NULL,
  `gia_ca` decimal(3,1) NOT NULL,
  `diem_trung_binh` decimal(3,1) DEFAULT 0.0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_gia`
--

INSERT INTO `danh_gia` (`id`, `id_dia_diem`, `phuc_vu`, `khong_gian`, `chat_luong`, `gia_ca`, `diem_trung_binh`) VALUES
(1, 1, 10.0, 10.0, 10.0, 10.0, 10.0),
(2, 2, 7.0, 8.0, 5.5, 8.0, 7.1),
(3, 3, 6.2, 6.3, 6.2, 6.2, 6.2),
(4, 4, 5.0, 5.0, 10.0, 5.0, 6.3),
(5, 5, 5.0, 4.7, 4.7, 4.7, 4.8),
(6, 6, 10.0, 10.0, 10.0, 10.0, 10.0),
(7, 7, 3.0, 4.8, 4.5, 4.5, 4.2),
(8, 8, 6.7, 8.3, 7.0, 5.3, 6.8),
(9, 9, 7.0, 7.3, 7.5, 7.0, 7.2),
(10, 10, 7.3, 7.2, 7.1, 7.2, 7.1),
(11, 11, 10.0, 10.0, 10.0, 10.0, 10.0),
(12, 12, 7.6, 7.1, 8.3, 7.7, 7.7),
(13, 13, 5.6, 6.3, 6.1, 5.6, 5.8),
(14, 14, 9.0, 8.8, 9.2, 8.8, 8.7),
(15, 15, 8.5, 8.0, 8.0, 8.0, 8.1),
(16, 16, 9.4, 9.3, 9.4, 9.2, 9.3),
(17, 17, 8.2, 9.0, 8.0, 8.1, 8.3),
(18, 18, 6.5, 6.5, 7.0, 6.5, 6.6),
(19, 19, 7.0, 6.0, 7.0, 8.0, 7.2),
(20, 20, 6.0, 6.0, 6.5, 6.5, 5.7),
(21, 21, 9.6, 9.4, 7.8, 7.8, 8.6),
(22, 22, 7.3, 7.3, 6.7, 7.3, 7.1),
(23, 23, 10.0, 10.0, 9.0, 10.0, 9.8),
(24, 24, 5.0, 5.0, 5.0, 5.0, 5.0),
(25, 25, 6.8, 6.6, 7.2, 6.2, 6.8),
(26, 26, 7.2, 7.2, 7.2, 7.2, 7.2),
(27, 27, 8.2, 8.2, 8.2, 8.2, 8.2),
(28, 28, 7.8, 7.8, 7.8, 7.8, 7.8),
(29, 29, 8.2, 8.2, 8.2, 8.2, 8.2),
(30, 30, 8.8, 8.8, 8.8, 8.8, 8.8),
(31, 31, 8.8, 8.8, 8.8, 8.8, 8.8),
(32, 32, 8.8, 8.8, 8.8, 8.8, 8.8),
(33, 33, 9.2, 9.2, 9.2, 9.2, 9.2),
(34, 34, 9.4, 9.4, 9.4, 9.4, 9.4),
(35, 35, 9.4, 9.4, 9.4, 9.4, 9.4),
(36, 36, 7.8, 7.8, 7.8, 7.8, 7.8),
(37, 37, 9.4, 9.4, 9.4, 9.4, 9.4),
(38, 38, 8.5, 8.6, 8.7, 8.6, 8.6),
(39, 39, 9.0, 9.0, 9.0, 9.0, 9.0),
(40, 40, 7.5, 7.5, 7.5, 7.5, 7.5),
(41, 41, 8.6, 8.6, 8.6, 8.6, 8.6),
(42, 42, 10.0, 10.0, 10.0, 10.0, 10.0),
(43, 43, 6.8, 7.0, 6.5, 7.2, 6.9),
(44, 44, 6.8, 7.0, 6.8, 7.0, 7.0),
(45, 45, 8.5, 10.0, 9.0, 9.5, 9.0),
(46, 46, 5.0, 4.0, 6.0, 4.6, 5.0),
(47, 47, 8.5, 7.0, 9.0, 9.1, 8.5),
(48, 48, 6.5, 6.5, 6.0, 5.5, 6.9),
(49, 49, 7.5, 8.5, 9.0, 7.0, 8.0),
(50, 50, 6.8, 7.0, 6.8, 7.4, 7.1),
(51, 51, 8.5, 10.0, 9.0, 9.5, 9.0),
(52, 52, 9.0, 9.0, 9.0, 9.0, 9.0),
(53, 53, 10.0, 10.0, 10.0, 10.0, 10.0),
(54, 54, 6.8, 7.0, 5.0, 6.0, 6.0),
(55, 55, 5.6, 5.6, 5.6, 6.5, 5.9),
(56, 56, 6.8, 6.6, 7.2, 6.2, 6.8),
(57, 57, 8.0, 8.0, 8.0, 8.0, 8.0),
(58, 58, 6.5, 6.6, 6.7, 6.6, 6.6),
(59, 59, 6.7, 6.7, 6.9, 6.8, 6.7),
(60, 60, 7.7, 8.3, 8.3, 7.0, 7.7),
(61, 61, 5.0, 6.8, 4.8, 6.5, 5.9),
(62, 62, 6.9, 6.5, 6.8, 7.6, 7.0),
(63, 63, 5.6, 4.8, 5.3, 5.1, 5.4),
(64, 64, 5.0, 5.0, 5.0, 5.0, 5.0),
(65, 65, 6.4, 6.4, 6.7, 6.4, 6.6),
(66, 66, 10.0, 10.0, 10.0, 10.0, 10.0),
(67, 67, 10.0, 10.0, 10.0, 10.0, 10.0),
(68, 68, 6.5, 7.6, 6.3, 6.6, 6.8),
(69, 69, 7.1, 7.8, 7.5, 6.6, 7.2),
(70, 70, 6.6, 6.5, 5.4, 6.8, 6.5),
(71, 71, 5.0, 5.0, 5.0, 5.0, 5.0),
(72, 72, 9.0, 9.0, 9.0, 7.0, 8.6),
(73, 73, 5.0, 5.0, 5.0, 5.0, 5.0),
(74, 74, 9.0, 9.0, 9.0, 7.0, 8.6),
(75, 75, 9.0, 9.0, 9.0, 7.0, 8.6),
(76, 76, 9.0, 9.0, 9.0, 7.0, 8.6),
(77, 77, 9.0, 9.0, 9.0, 7.0, 8.6),
(78, 78, 9.0, 9.0, 9.0, 7.0, 8.6),
(79, 79, 9.0, 9.0, 9.0, 7.0, 8.5),
(80, 80, 7.1, 7.8, 7.5, 8.0, 7.6),
(81, 81, 8.5, 8.7, 9.2, 9.0, 9.0),
(82, 82, 7.1, 6.8, 6.0, 8.0, 7.0),
(83, 83, 10.0, 10.0, 10.0, 10.0, 10.0),
(84, 84, 8.0, 9.0, 7.0, 8.0, 8.0),
(85, 85, 5.0, 5.0, 5.0, 5.0, 5.0),
(86, 86, 10.0, 10.0, 10.0, 10.0, 10.0),
(87, 87, 8.0, 9.0, 7.0, 8.0, 8.0),
(89, 89, 6.4, 6.4, 6.7, 6.4, 6.6),
(90, 90, 8.0, 9.0, 7.0, 8.0, 8.0),
(91, 91, 7.2, 7.5, 7.0, 7.2, 7.2),
(92, 92, 8.8, 8.0, 7.8, 7.9, 8.1),
(93, 93, 9.5, 9.0, 9.2, 8.8, 9.1),
(94, 94, 6.7, 6.8, 6.9, 6.5, 6.7),
(95, 95, 7.3, 7.1, 7.0, 7.4, 7.2),
(96, 96, 8.5, 9.0, 8.8, 8.6, 8.7),
(97, 97, 9.6, 9.4, 9.5, 9.2, 9.4),
(98, 98, 7.9, 8.0, 7.8, 7.7, 7.9),
(99, 99, 6.0, 5.9, 6.2, 6.0, 6.0),
(100, 100, 8.2, 8.4, 8.0, 8.5, 8.3),
(101, 101, 9.7, 9.6, 9.8, 9.5, 9.7),
(102, 102, 7.8, 7.5, 7.6, 7.7, 7.7),
(103, 103, 6.5, 6.0, 6.8, 6.2, 6.4),
(104, 104, 8.8, 8.9, 8.5, 8.7, 8.7),
(105, 105, 9.1, 9.0, 9.3, 9.0, 9.1),
(106, 106, 7.0, 6.8, 7.2, 7.1, 7.0),
(107, 107, 6.2, 6.5, 6.7, 6.3, 6.4),
(108, 108, 8.3, 8.5, 8.2, 8.4, 8.3),
(109, 109, 9.4, 9.5, 9.6, 9.3, 9.5),
(110, 110, 6.8, 7.0, 6.5, 7.2, 6.9),
(111, 111, 8.2, 8.0, 7.9, 8.1, 8.1),
(112, 112, 7.5, 7.4, 7.2, 7.7, 7.5),
(113, 113, 9.0, 8.9, 8.8, 9.1, 8.9),
(114, 114, 6.5, 6.4, 6.7, 6.6, 6.6),
(115, 115, 7.8, 7.9, 7.7, 7.6, 7.8),
(116, 116, 8.7, 8.9, 8.5, 8.8, 8.7),
(117, 117, 9.2, 9.1, 9.4, 9.0, 9.2),
(118, 118, 7.3, 7.2, 7.0, 7.5, 7.3),
(119, 119, 6.7, 6.5, 6.6, 6.8, 6.7),
(120, 120, 8.9, 9.0, 8.8, 8.7, 8.9),
(121, 121, 7.5, 7.4, 7.7, 7.8, 7.6),
(122, 122, 6.9, 7.0, 6.8, 6.6, 6.8),
(124, 124, 9.6, 9.5, 9.3, 9.7, 9.5),
(125, 125, 7.2, 7.1, 7.3, 7.0, 7.2),
(126, 126, 8.5, 8.4, 8.3, 8.6, 8.4),
(127, 127, 9.0, 9.1, 9.3, 9.2, 9.1),
(128, 128, 7.6, 7.7, 7.4, 7.5, 7.6),
(129, 129, 8.0, 8.2, 8.0, 8.1, 8.1),
(130, 130, 9.4, 9.3, 9.6, 9.2, 9.4),
(131, 131, 7.8, 7.5, 7.6, 7.7, 7.6),
(132, 132, 8.1, 8.2, 8.3, 8.4, 8.2),
(133, 133, 9.5, 9.4, 9.7, 9.6, 9.5),
(134, 134, 7.3, 7.1, 7.2, 7.0, 7.2),
(136, 136, 8.3, 8.4, 8.5, 8.6, 8.4),
(137, 137, 9.6, 9.5, 9.7, 9.8, 9.6),
(138, 138, 7.0, 7.1, 7.2, 7.3, 7.2),
(139, 139, 6.6, 6.8, 6.7, 6.9, 6.8),
(140, 140, 8.9, 9.0, 8.8, 8.9, 8.9),
(141, 141, 7.7, 7.6, 7.8, 7.9, 7.7),
(142, 142, 9.3, 9.4, 9.5, 9.2, 9.4),
(144, 144, 8.0, 8.1, 8.2, 8.3, 8.2),
(145, 145, 9.4, 9.3, 9.5, 9.2, 9.4),
(146, 146, 7.6, 7.5, 7.7, 7.8, 7.6),
(147, 147, 6.8, 6.9, 6.7, 6.8, 6.8),
(148, 148, 8.2, 8.3, 8.5, 8.4, 8.3),
(149, 149, 9.5, 9.6, 9.4, 9.3, 9.4),
(150, 150, 7.3, 7.4, 7.2, 7.3, 7.3),
(151, 151, 6.9, 7.0, 7.1, 6.9, 7.0),
(152, 152, 8.5, 8.6, 8.7, 8.5, 8.6),
(153, 153, 9.2, 9.3, 9.1, 9.0, 9.1),
(154, 154, 7.4, 7.5, 7.6, 7.3, 7.5),
(155, 155, 6.7, 6.9, 6.8, 6.7, 6.8),
(156, 156, 8.9, 9.0, 9.1, 9.2, 9.0),
(157, 157, 7.5, 7.7, 7.6, 7.8, 7.7),
(158, 158, 6.8, 6.9, 7.0, 7.1, 7.0),
(159, 159, 8.3, 8.4, 8.2, 8.3, 8.3),
(160, 160, 9.4, 9.3, 9.6, 9.5, 9.5),
(161, 161, 7.9, 7.8, 7.7, 7.6, 7.7),
(162, 162, 6.6, 6.5, 6.8, 6.7, 6.7),
(163, 163, 8.1, 8.2, 8.3, 8.4, 8.3),
(164, 164, 9.7, 9.8, 9.6, 9.7, 9.7),
(165, 165, 7.4, 7.3, 7.5, 7.4, 7.4),
(166, 166, 6.5, 6.4, 6.6, 6.5, 6.5),
(168, 168, 9.1, 9.0, 9.2, 9.1, 9.1),
(169, 169, 7.7, 7.6, 7.8, 7.9, 7.7),
(170, 170, 6.9, 7.0, 7.1, 7.0, 7.0),
(171, 171, 8.4, 8.3, 8.5, 8.6, 8.4),
(172, 172, 9.3, 9.2, 9.4, 9.5, 9.4),
(173, 173, 7.8, 7.9, 7.7, 7.8, 7.8),
(174, 174, 6.8, 6.9, 6.7, 6.8, 6.8),
(175, 175, 8.9, 9.0, 9.1, 9.2, 9.0),
(176, 176, 9.2, 9.3, 9.1, 9.0, 9.1),
(177, 177, 7.1, 7.0, 7.2, 7.3, 7.2),
(178, 178, 6.9, 7.0, 7.1, 7.2, 7.1),
(179, 179, 8.3, 8.4, 8.5, 8.6, 8.5),
(180, 180, 9.6, 9.5, 9.7, 9.8, 9.7),
(181, 181, 7.0, 7.1, 7.2, 7.3, 7.2),
(182, 182, 6.6, 6.8, 6.7, 6.9, 6.8),
(183, 183, 8.9, 9.0, 8.8, 8.9, 8.9),
(184, 184, 7.7, 7.6, 7.8, 7.9, 7.7),
(185, 185, 9.3, 9.4, 9.5, 9.2, 9.4),
(186, 186, 6.9, 7.0, 7.1, 7.0, 7.0),
(187, 187, 8.0, 8.1, 8.2, 8.3, 8.1),
(188, 188, 9.4, 9.3, 9.5, 9.2, 9.4),
(189, 189, 7.6, 7.5, 7.7, 7.8, 7.7),
(190, 190, 6.8, 6.9, 6.7, 6.8, 6.8),
(191, 191, 9.9, 9.9, 9.9, 9.9, 9.9),
(193, 3, 4.0, 4.0, 4.0, 5.0, 4.3),
(194, 3, 4.0, 3.0, 5.0, 4.0, 4.0),
(195, 3, 4.0, 3.0, 5.0, 4.0, 4.0),
(196, 102, 4.0, 3.0, 1.0, 2.0, 2.5),
(197, 102, 4.0, 3.0, 1.0, 2.0, 2.5),
(198, 121, 3.0, 4.0, 1.0, 2.0, 2.5),
(199, 121, 2.0, 3.0, 1.0, 3.0, 2.3),
(200, 121, 2.0, 3.0, 1.0, 3.0, 2.3),
(201, 121, 2.0, 3.0, 1.0, 3.0, 2.3),
(202, 150, 1.0, 4.0, 1.0, 2.0, 2.0),
(203, 150, 1.0, 4.0, 1.0, 2.0, 2.0),
(204, 180, 4.0, 4.0, 2.0, 2.0, 3.0),
(205, 180, 4.0, 3.0, 1.0, 2.0, 2.5),
(209, 1, 9.0, 8.0, 9.0, 7.0, 8.3),
(210, 1, 8.0, 8.0, 8.0, 6.0, 7.5),
(211, 1, 8.0, 8.0, 8.0, 6.0, 7.5);

--
-- Bẫy `danh_gia`
--
DELIMITER $$
CREATE TRIGGER `before_danh_gia_update` BEFORE UPDATE ON `danh_gia` FOR EACH ROW BEGIN
    SET NEW.diem_trung_binh = (NEW.phuc_vu + NEW.khong_gian + NEW.chat_luong + NEW.gia_ca) / 4;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dia_diem`
--

CREATE TABLE `dia_diem` (
  `id` int(11) NOT NULL,
  `ten_dia_diem` varchar(255) DEFAULT NULL,
  `dia_chi` varchar(255) DEFAULT NULL,
  `so_dien_thoai` varchar(20) DEFAULT NULL,
  `mo_ta` text DEFAULT NULL,
  `gio_mo_cua` time DEFAULT NULL,
  `gio_dong_cua` time DEFAULT NULL,
  `loai_hinh` varchar(30) NOT NULL,
  `diem_trung_binh` decimal(4,2) DEFAULT NULL,
  `gia_ca_giao_dong` varchar(100) DEFAULT NULL,
  `hinh_anh1` text DEFAULT NULL,
  `hinh_anh2` text DEFAULT NULL,
  `hinh_anh3` text DEFAULT NULL,
  `so_luot_danh_gia` int(11) DEFAULT 0,
  `link_dia_diem` varchar(500) DEFAULT NULL,
  `so_luot_tk` int(11) DEFAULT 0,
  `id_nguoi_dang` int(11) NOT NULL DEFAULT 1,
  `ngay_dang` datetime NOT NULL DEFAULT current_timestamp(),
  `hinh_anh4` text DEFAULT NULL,
  `hinh_anh5` text DEFAULT NULL,
  `hinh_anh6` text DEFAULT NULL,
  `hinh_anh7` text DEFAULT NULL,
  `nguoi_tao_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dia_diem`
--

INSERT INTO `dia_diem` (`id`, `ten_dia_diem`, `dia_chi`, `so_dien_thoai`, `mo_ta`, `gio_mo_cua`, `gio_dong_cua`, `loai_hinh`, `diem_trung_binh`, `gia_ca_giao_dong`, `hinh_anh1`, `hinh_anh2`, `hinh_anh3`, `so_luot_danh_gia`, `link_dia_diem`, `so_luot_tk`, `id_nguoi_dang`, `ngay_dang`, `hinh_anh4`, `hinh_anh5`, `hinh_anh6`, `hinh_anh7`, `nguoi_tao_id`) VALUES
(1, 'KOMBO - Cơm Niêu Singapore - Trần Phú', '28 trần phú, p.điện biên', '0829491333', 'Quán ăn chuyên bán, phục vụ các món ăn Singapore đúng vị.', '09:00:00', '21:00:00', 'ăn uống', 10.00, '91.800đ - 399.000đ', '/images/diadiem1/hinhanh1.jpg', '/images/diadiem1/hinhanh2.jpg', '/images/diadiem1/hinhanh3.jpg', 1, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3567.9613337551373!2d105.77700019999999!3d19.8107018!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3136f722873d23f1%3A0xea13470fc59b5c3e!2sKombo%20-%20C%C6%A1m%20ni%C3%AAu%20Singapore!5e1!3m2!1svi!2s!4v1728830553413!5m2!1svi!2s', 1116, 43, '2022-11-22 00:00:00', NULL, NULL, NULL, NULL, NULL),
(2, 'GỎI CUỐN & BÁNH XÈO', 'số 28 quốc lộ 45 gần bệnh viện phổi, x. quảng thịnh', '0913253457', 'Bánh xèo giá rẻ, chất lượng, ngon.', '08:00:00', '22:00:00', 'ăn uống', 7.10, '10.000đ - 130.000đ', '/images/diadiem2/hinhanh1.jpg', '/images/diadiem2/hinhanh2.jpg', '/images/diadiem2/hinhanh3.jpg', 1, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d408.9491860237241!2d105.73077707674865!3d19.822437441263673!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3136f713dadb501d%3A0xc0e246efb766acad!2zTmjDoCBow6BuZyBNYWkgTMOibQ!5e1!3m2!1svi!2s!4v1728830763579!5m2!1svi!2s', 82, 13, '2022-04-21 00:00:00', NULL, NULL, NULL, NULL, NULL),
(3, 'Khu du lịch Sầm Sơn', 'thị xã sầm sơn', '0913253457', 'Thăm quan & chụp ảnh.', '08:00:00', '17:00:00', 'vui chơi du lịch', 6.20, 'Đang Cập Nhật', '/images/diadiem3/hinhanh1.jpg', '/images/diadiem3/hinhanh2.jpg', '/images/diadiem3/hinhanh3.jpg', 20, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d57108.450089493606!2d105.90800265!3d19.75191815!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3136513d70fc7279%3A0x17fc2fc6ef4b70a0!2zU-G6p20gU8ahbiwgVGhhbmggSG_DoQ!5e1!3m2!1svi!2s!4v1728830803442!5m2!1svi!2s', 86, 2, '2018-01-03 00:00:00', NULL, NULL, NULL, NULL, NULL),
(4, 'Bún Đậu Minh Châu - Bún Đậu & Nem Nướng Nha Trang', '36 bạch liêu, p.bến thủy, tp vinh', '0913253457', 'Quán ăn - Món á.', '09:00:00', '22:00:00', 'ăn uống', 6.00, '12.000đ - 32.000đ', '/images/diadiem4/hinhanh1.jpg', '/images/diadiem4/hinhanh2.jpg', '/images/diadiem4/hinhanh3.jpg', 1, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7486889.80531717!2d104.8069283!3d15.4302795!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3139cd5dc9261329%3A0x78d9044d5656a77d!2zQsO6biDEkOG6rXUgTmVtIE7GsOG7m25nIE1pbmggQ2jDonU!5e1!3m2!1svi!2s!4v1728830845489!5m2!1svi!2s', 82, 3, '2024-10-19 00:00:00', NULL, NULL, NULL, NULL, NULL),
(5, 'Pizza Hut - Lê Hồng Phong', '65 lê hồng phong, p. hưng bình, thành phố vinh', '19001822', 'Nhà hàng - Món Việt- Gia Đình.', '08:00:00', '22:00:00', 'ăn uống', 4.90, '15.000đ - 300.000đ', '/images/diadiem5/hinhanh1.jpg', '/images/diadiem5/hinhanh2.jpg', '/images/diadiem5/hinhanh3.jpg', 3, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3592.7061449526846!2d105.68405349999999!3d18.6763896!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3139cf952d71da91%3A0xec41f573ace8bef0!2sPizza%20hut%20-%20Vinh!5e1!3m2!1svi!2s!4v1728830882297!5m2!1svi!2s', 1456, 15, '2018-08-17 00:00:00', NULL, NULL, NULL, NULL, NULL),
(6, 'Ý Gia - Chả Cá Phố Cổ', '182 lê duẫn', '0982562567', 'Nhà hàng - Món Việt- Gia Đình.', '09:00:00', '22:30:00', 'ăn uống', 10.00, '10.000đ - 280.000đ', '/images/diadiem6/hinhanh1.jpg', '/images/diadiem6/hinhanh2.jpg', '/images/diadiem6/hinhanh3.jpg', 2, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3599.888126505966!2d105.8942915!3d18.334526099999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31384ffde7dd4b07%3A0x5f0d0fcba6b5241c!2zQ2jhuqMgQ8OhIHBo4buVIGPhu5UgMw!5e1!3m2!1svi!2s!4v1728830915109!5m2!1svi!2s', 51, 17, '2020-05-27 00:00:00', NULL, NULL, NULL, NULL, NULL),
(7, 'Jollibee - CoopMart Hà Tĩnh', '2 phan đình tùng, tp hà tĩnh', '02393896799', 'Nhà hàng - Philippines.', '08:30:00', '21:30:00', 'ăn uống', 4.30, '15.000đ - 44.000đ', '/images/diadiem7/hinhanh1.jpg', '/images/diadiem7/hinhanh2.jpg', '/images/diadiem7/hinhanh3.jpg', 4, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3599.8084364580413!2d105.897177!3d18.3383531!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31384e15d46cb60d%3A0x8e897503d2dc3143!2sJollibee%20Coopmart%20H%C3%A0%20T%C4%A9nh!5e1!3m2!1svi!2s!4v1728830948269!5m2!1svi!2s', 60, 34, '2021-04-22 00:00:00', NULL, NULL, NULL, NULL, NULL),
(8, 'Cơm Tấm Sài Gòn O.Q', '3 trần nhân tông', '0913253457', 'Nhà hàng - Cơm Tấm.', '09:00:00', '22:00:00', 'ăn uống', 9.80, '15.000đ - 70.000đ', '/images/diadiem8/hinhanh1.jpg', '/images/diadiem8/hinhanh2.jpg', '/images/diadiem8/hinhanh3.jpg', 5, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3568.059752271186!2d105.77642579999999!3d19.810399199999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3136f722dd1c5793%3A0xc91b5c11d8f4ca31!2zQ8OhbmcgVMOjbSB0YW0gU2FpIEdvbiBPcS4uLg!5e1!3m2!1svi!2s!4v1728830975708!5m2!1svi!2s', 100, 32, '2020-06-28 00:00:00', NULL, NULL, NULL, NULL, NULL),
(9, 'Hải Sản Minh Lưu', '185 trương pháp, p. hải thành, tp. đồng hới', '0911863683', 'Quán ăn - Món Việt', '07:00:00', '02:00:00', 'ăn uống', 7.20, '15.000đ - 150.000đ', '/images/diadiem9/hinhanh1.jpg', '/images/diadiem9/hinhanh2.jpg', '/images/diadiem9/hinhanh3.jpg', 49, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3617.005349762613!2d106.62615729999999!3d17.493768799999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3147578f23672c4b%3A0xc2de6b2e779b041f!2zSOG6o2kgU-G6o24gTWluaCBMxrB1IC0gSOG6o2kgU-G6o24gxJDhu5NuZyBI4bubaSAtIEjhuqNpIFPhuqNuIFF14bqjbmcgQsOsbmg!5e1!3m2!1svi!2s!4v1728831014273!5m2!1svi!2s', 68, 4, '2022-07-11 00:00:00', NULL, NULL, NULL, NULL, NULL),
(10, 'Vedana Lagoon Resort & Spa', 'khu vực 1, tt. phú lộc, huyện phú lộc, huế', '02343681688', 'Khu nghỉ dưỡng', '00:00:00', '12:00:00', 'ngủ nghỉ', 7.10, '1.000.000đ - 3.300.000đ', '/images/diadiem10/hinhanh1.jpg', '/images/diadiem10/hinhanh2.jpg', '/images/diadiem10/hinhanh3.jpg', 2, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7280.358962879469!2d107.8576617!3d16.2887634!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31418fd8c96e3763%3A0x14a161b13b44ed3f!2sVedana%20Lagoon%20Resort%20%26%20Spa%20Hue!5e1!3m2!1svi!2s!4v1728831426662!5m2!1svi!2s', 1932, 38, '2017-06-25 00:00:00', NULL, NULL, NULL, NULL, NULL),
(11, 'Nhà Hàng Mũi Dinh Cà Ná', 'quốc lộ 1a, lạc sơn 1, xã cà ná, huyện thuận nam, ninh thuận', '0898481984', 'Nhà hàng - Món Việt', '06:00:00', '22:00:00', 'ăn uống', 10.00, '20.000đ - 2.700.000đ', '/images/diadiem11/hinhanh1.jpg', '/images/diadiem11/hinhanh2.jpg', '/images/diadiem11hinhanh3.jpg', 22, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3718.4542945251155!2d108.86679129999999!3d11.333419000000001!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317729ce1bb82a4d%3A0x4d8d2eae189d7c6!2zTmjDoCBow6BuZyAtIGtow6FjaCBz4bqhbiBI4bqjaSDEkMSDbmcgTcWpaSBEaW5o!5e1!3m2!1svi!2s!4v1728831480296!5m2!1svi!2s', 90, 25, '2021-07-03 00:00:00', NULL, NULL, NULL, NULL, NULL),
(12, 'Napom\'s Bakery - 3 Tháng 2', '154 đường 3 tháng 2, p. thuận phước, quận hải châu', '0905357954', 'Tiệm bánh - Món Việt', '07:00:00', '22:00:00', 'ăn uống', 7.50, '15.000đ - 300.000đ', '/images/diadiem12/hinhanh1.jpg', '/images/diadiem12/hinhanh2.jpg', '/images/diadiem12/hinhanh3.jpg', 282, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d58307.86166780893!2d108.1855215!3d16.0685206!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314218ff61fe400b%3A0x7a7852ffa65973c1!2zVGnhu4dtIELDoW5oIE5hcG9t!5e1!3m2!1svi!2s!4v1728831529524!5m2!1svi!2s', 1291, 30, '2021-05-29 00:00:00', NULL, NULL, NULL, NULL, NULL),
(13, 'Pizza Hut - Núi Thành', '239 núi thành, quận hải châu', '19001822', 'Nhà hàng - Mỹ', '10:00:00', '22:00:00', 'ăn uống', 5.80, '39.000đ - 499.000đ', '/images/diadiem13/hinhanh1.jpg', '/images/diadiem13/hinhanh2.jpg', '/images/diadiem13/hinhanh3.jpg', 8, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3644.683836545565!2d108.22146420000001!3d16.044350599999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314219d1002c0acf%3A0xfbd7132a04e701ef!2sPizza%20Hut%20239%20N%C3%BAi%20Th%C3%A0nh!5e1!3m2!1svi!2s!4v1728831572349!5m2!1svi!2s', 96, 32, '2017-09-09 00:00:00', NULL, NULL, NULL, NULL, NULL),
(14, 'Mường Thanh Hội An Hotel', 'khu ô 9, kđt phước trạch - phước hải, âu cơ, thành phố hội an, quảng nam', '02353666999', 'Khách sạn - Gia đình', '00:00:00', '23:30:00', 'ngủ nghỉ', 8.70, '700.000đ - 3.000.000đ', '/images/diadiem14/hinhanh1.jpg', '/images/diadiem14/hinhanh2.jpg', '/images/diadiem14/hinhanh3.jpg', 5, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7294.88954203565!2d108.3694411!3d15.8927299!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31420da278163339%3A0xdb0f3198a07c5d7b!2sM%C6%B0%E1%BB%9Dng%20Thanh%20Holiday%20Hoi%20An%20Hotel!5e1!3m2!1svi!2s!4v1728831612313!5m2!1svi!2s', 59, 5, '2017-01-23 00:00:00', NULL, NULL, NULL, NULL, NULL),
(15, 'Central Hotel', '1 lê lợi, tp. quảng ngãi', '02553829999', 'Khách sạn - Món Việt', '01:00:00', '00:00:00', 'ngủ nghỉ', 8.20, '200.000đ - 1.400.000đ', '/images/diadiem15/hinhanh1.jpg', '/images/diadiem15/hinhanh2.jpg', '/images/diadiem15/hinhanh3.jpg', 2, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7322.459358086113!2d108.8052355!3d15.1135634!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3169ad2ab6b4637f%3A0xd7e4979a743b0b31!2sCentral%20Hotel!5e1!3m2!1svi!2s!4v1728831714484!5m2!1svi!2s', 1658, 43, '2016-03-31 00:00:00', NULL, NULL, NULL, NULL, NULL),
(16, 'Út Ngọc - Cơm Hải Sản Bình Dân', 'cầu cảng cá lý sơn, thôn tây, xã an vĩnh, huyện lý sơn, quảng ngãi', '0913253457', 'Quán ăn - gia đình', '08:00:00', '21:00:00', 'ăn uống', 9.30, '10.000đ - 100.000đ', '/images/diadiem16/hinhanh1.jpg', '/images/diadiem16/hinhanh2.jpg', '/images/diadiem16/hinhanh3.jpg', 50, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3656.6032653878997!2d109.0954618!3d15.379356599999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31683e96aaaaaaab%3A0x87e619fc309a1cce!2zQ-G6p3UgQ-G6o25nIGPDoSBMw70gU8ahbg!5e1!3m2!1svi!2s!4v1728832103442!5m2!1svi!2s', 57, 29, '2022-11-19 00:00:00', NULL, NULL, NULL, NULL, NULL),
(17, 'A Toàn - Bún Đậu Mắm Tôm', '48 đô đốc bảo, p. trần phú, tp. qui nhơn, bình định', '0905479794', 'Quán ăn - gia đình', '11:00:00', '22:00:00', 'ăn uống', 8.30, '15.000 - 55.0000đ', '/images/diadiem17/hinhanh1.jpg', '/images/diadiem17/hinhanh2.jpg', '/images/diadiem17/hinhanh3.jpg', 5, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3797553.6667116913!2d106.8907839!3d12.071278!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316f6d21e24ea117%3A0x61e4b203f9a4588c!2zQsO6biDEkOG6rXUgTeG6r20gVMO0bSBBIFRvw6Bu!5e1!3m2!1svi!2s!4v1728832145512!5m2!1svi!2s', 61, 12, '2023-03-01 00:00:00', NULL, NULL, NULL, NULL, NULL),
(18, 'Quán Gà Lá É - Hùng Vương', '389 hùng vương, thành phố tuy hòa, phú yên', '0913253457', 'Quán ăn - gia đình', '10:00:00', '23:00:00', 'ăn uống', 6.60, '35.000đ - 300.000đ', '/images/diadiem18/hinhanh1.jpg', '/images/diadiem18/hinhanh2.jpg', '/images/diadiem18/hinhanh3.jpg', 22, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3693.5560493470225!2d109.3011287!3d13.1103747!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316fec66a98f37b9%3A0x6dfee2c7a3987b7!2zMzg5IMSQTCBIw7luZyBWxrDGoW5nLCBQaMaw4budbmcgOSwgVHV5IEjDsmEsIFBow7ogWcOqbg!5e1!3m2!1svi!2s!4v1728832182238!5m2!1svi!2s', 82, 25, '2022-04-29 00:00:00', NULL, NULL, NULL, NULL, NULL),
(19, 'Sasin - Mì Cay 7 Cấp Độ Hàn Quốc', '273 bà triệu, thành phố tuy hòa, phú yên', '0913253457', '', '09:00:00', '22:00:00', 'ăn uống', 7.20, '15.000đ - 35.000đ', '/images/diadiem19/hinhanh1.jpg', '/images/diadiem19/hinhanh2.jpg', '/images/diadiem19/hinhanh3.jpg', 5, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3693.747582243449!2d109.3128689!3d13.0976114!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316fec414c819e9d%3A0x224a4f113aa7c26b!2zMjczIEJhzIAgVHJpw6rMo3UsIFBoxrDhu51uZzcsIFR1eSBIw7JhLCBQaMO6IFnDqm4!5e1!3m2!1svi!2s!4v1728832225443!5m2!1svi!2s', 76, 19, '2017-04-19 00:00:00', NULL, NULL, NULL, NULL, NULL),
(20, 'Bánh Khọt Tí Hon & Tàu Hũ Đá 4G', '1/18 đặng tất, p. vĩnh hải, tp. nha trang, khánh hoà', '0913253457', 'ăn vặt/vỉa hè', '08:00:00', '22:00:00', 'ăn uống', 5.70, '15.000đ - 30.000đ', '/images/diadiem20/hinhanh1.jpg', '/images/diadiem20/hinhanh2.jpg', '/images/diadiem20/hinhanh3.jpg', 77, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3705.685712893008!2d109.1988807!3d12.276378!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317067f033c222db%3A0x81667537ca7ab60e!2sWinMart%2B!5e1!3m2!1svi!2s!4v1728832277743!5m2!1svi!2s', 1418, 42, '2021-03-13 00:00:00', NULL, NULL, NULL, NULL, NULL),
(21, 'Bà Bốn - Bánh Canh & Chả Cuốn', '75 ngô gia tự, tp. phan rang-tháp chàm, ninh thuận', '0913253457', 'quán ăn', '06:00:00', '22:00:00', 'ăn uống', 8.60, '12.000đ - 22.000đ', '/images/diadiem21/hinhanh1.jpg', '/images/diadiem21/hinhanh2.jpg', '/images/diadiem21/hinhanh3.jpg', 44, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3715.2777965418677!2d108.99185142505368!3d11.575081588626432!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3170d0299d3f68fd%3A0x739b32827acd152!2zQsOhbmggY2FuaCBjaOG6oyBjdeG7kW4gQsOgIELhu5Fu!5e1!3m2!1svi!2s!4v1728832438931!5m2!1svi!2s', 86, 14, '2020-06-02 00:00:00', NULL, NULL, NULL, NULL, NULL),
(22, 'Cầu Vồng Karaoke', '4b kiệt 81 nguyễn huệ, p. phú nhuận, tp. huế, huế', '0913253457', 'Karaoke', '09:00:00', '23:30:00', 'vui chơi du lịch', 7.10, '60.000đ - 70.000đ', '/images/diadiem22/hinhanh1.jpg', '/images/diadiem22/hinhanh2.jpg', '/images/diadiem22/hinhanh3.jpg', 12, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7490724.953668798!2d101.23814610326941!3d15.323585715366587!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3141a13f6ef8624d%3A0xa42b7df440d0965f!2zQ-G6p3UgVuG7k25nIEthcmFva2U!5e1!3m2!1svi!2s!4v1728832558632!5m2!1svi!2s', 50, 4, '2022-07-02 00:00:00', NULL, NULL, NULL, NULL, NULL),
(23, 'A Nhi - Bánh Ướt Lòng Gà', '128 hà huy tập, p. 3, thành phố đà lạt, lâm đồng', '0913253457', 'quán ăn - món việt', '06:00:00', '21:30:00', 'ăn uống', 9.80, '25.000đ - 50.000đ', '/images/diadiem23/hinhanh1.jpg', '/images/diadiem23/hinhanh2.jpg', '/images/diadiem23/hinhanh3.jpg', 1, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3710.4715321319236!2d108.43996709999999!3d11.931556100000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3171135535f86005%3A0xa54e65a6a9eb0895!2zQsOhbmggxrDhu5t0IGzDsm5nIGfDoCBBIE5oaQ!5e1!3m2!1svi!2s!4v1728832595757!5m2!1svi!2s', 95, 45, '2017-07-29 00:00:00', NULL, NULL, NULL, NULL, NULL),
(24, 'Gà rán và Mì Ý - Jollibee - EC Lê Duẩn BMT', 'thửa đất 37-37a tờ số 28 đường lê duẩn, p. ea tam, thành phố buôn ma thuột', '0913253457', 'quán ăn - món việt', '09:00:00', '21:00:00', 'ăn uống', 5.00, '25.000 - 100.000đ', '/images/diadiem24/hinhanh1.jpg', '/images/diadiem24/hinhanh2.jpg', '/images/diadiem24/hinhanh3.jpg', 33, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14800.979086698151!2d108.009053!3d12.6571663!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31721dcb4c64c125%3A0xec8ddaf929d49266!2zSm9sbGliZWUgTMOqIER14bqpbg!5e1!3m2!1svi!2s!4v1728832630004!5m2!1svi!2s', 73, 47, '2022-01-16 00:00:00', NULL, NULL, NULL, NULL, NULL),
(25, 'Phở Hồng - Phở Khô Gia Lai', '22 - 24 nguyễn văn trỗi, p. hội thương, thành phố pleiku, gia lai', '', 'quán ăn - món việt', '07:00:00', '22:00:00', 'ăn uống', 6.80, '25.000 - 35.000đ', '/images/diadiem25/hinhanh1.jpg', '/images/diadiem25/hinhanh2.jpg', '/images/diadiem25/hinhanh3.jpg', 25, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3680.109451777615!2d108.00026917486042!3d13.977833886438042!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316c1f82575e02f3%3A0x52bb95f684f009b4!2zMjIgTmd1eeG7hW4gVsSDbiBUcuG7l2ksIFAuIEjhu5lpIFRoxrDGoW5nLCBQbGVpa3UsIEdpYSBMYWkgNjAwMDAwLCBWaeG7h3QgTmFt!5e1!3m2!1svi!2s!4v1728832708356!5m2!1svi!2s', 1116, 9, '2023-10-27 00:00:00', NULL, NULL, NULL, NULL, NULL),
(26, 'Nhà Hàng Ngân Hà', 'km3 ql2, thành phố, vị xuyên, hà giang, việt nam', '0984591613', 'Quán ăn - món việt', '07:00:00', '23:00:00', 'ăn uống', 7.20, '1-100.000đ', '/images/diadiem26/hinhanh1.jpg', '/images/diadiem26/hinhanh2.jpg', '/images/diadiem26/hinhanh3.jpg', 22, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1748.0276229846727!2d104.9804595!3d22.8009193!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x36cc7903bdb81519%3A0xa24521249e79eba7!2zTmjDoCBIw6BuZyBOZ8OibiBIw6A!5e1!3m2!1svi!2s!4v1728832757833!5m2!1svi!2s', 79, 29, '2019-04-16 00:00:00', NULL, NULL, NULL, NULL, NULL),
(27, 'Nhà Hàng Linh Hằng', '143 phố kim đồng, p. hợp giang, cao bằng, việt nam', '0913027527', 'Quán ăn - món việt', '09:00:00', '21:45:00', 'ăn uống', 8.20, '200000-300000đ', '/images/diadiem27/hinhanh1.jpg', '/images/diadiem27/hinhanh2.jpg', '/images/diadiem27/hinhanh3.jpg', 62, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d6999.091288092693!2d106.2523114!3d22.664458!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x36ca656ee25bb2d9%3A0xf6a19683250afa5!2zTmjDoCBIw6BuZyBMaW5oIEjhurFuZw!5e1!3m2!1svi!2s!4v1728832808402!5m2!1svi!2s', 79, 31, '2017-10-31 00:00:00', NULL, NULL, NULL, NULL, NULL),
(28, 'Nhà hàng Hương Quê', 'tổ 3, tp, bắc kạn, việt nam', '0961557555', 'Quán ăn - món việt', '08:00:00', '22:00:00', 'ăn uống', 7.80, '100000-200000đ', '/images/diadiem28/hinhanh1.jpg', '/images/diadiem28/hinhanh2.jpg', '/images/diadiem28/hinhanh3.jpg', 68, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d112445.5796143616!2d105.752117!3d22.0938894!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x36cadfa101268533%3A0x8f8ba5d4b37ebd5d!2zTmjDoCBow6BuZyBIxrDGoW5nIFF1w6o!5e1!3m2!1svi!2s!4v1728832912671!5m2!1svi!2s', 55, 48, '2024-02-16 00:00:00', NULL, NULL, NULL, NULL, NULL),
(29, 'Nhà Hàng Viên Châu Quán', 'nhà hàng viên châu, quán tổ 6, p. tân quang, tuyên quang, việt nam', '0388127010', 'Quán ăn - món việt', '08:00:00', '22:00:00', 'ăn uống', 8.20, '10000-200000đ', '/images/diadiem29/hinhanh1.jpg', '/images/diadiem29/hinhanh2.jpg', '/images/diadiem29/hinhanh3.jpg', 18, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d28166.933125163185!2d105.1793352!3d21.8133421!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3134afdb23b6bf3b%3A0xe785b859e6a67065!2zTmjDoCBIw6BuZyBWacOqbiBDaMOidSBRdcOhbg!5e1!3m2!1svi!2s!4v1728832952812!5m2!1svi!2s', 90, 30, '2024-08-16 00:00:00', NULL, NULL, NULL, NULL, NULL),
(30, 'BIG Lào Cai Hotel', '505 đ. hoàng liên, kim tân, lào cai, việt nam', '0919123966', 'Khách sạn-gia đình', '00:00:00', '23:59:00', 'ngủ nghỉ', 8.80, '265000-350000đ', '/images/diadiem30/hinhanh1.jpg', '/images/diadiem30/hinhanh2.jpg', '/images/diadiem30/hinhanh3.jpg', 67, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d56067.23069681261!2d103.9105065!3d22.4811942!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x36cd15368c794c11%3A0x3a73da4f6faa7493!2sBIG%20L%C3%A0o%20Cai%20Hotel!5e1!3m2!1svi!2s!4v1728832984536!5m2!1svi!2s', 82, 10, '2017-01-24 00:00:00', NULL, NULL, NULL, NULL, NULL),
(31, 'Eco Rose Homestay', '175 sùng phái sinh, tân thanh, thành phố điện biên phủ, điện biên, việt nam', '0913253457', 'Homestay', '00:00:00', '23:59:00', 'ngủ nghỉ', 8.80, '1350000đ', '/images/diadiem31/hinhanh1.jpg', '/images/diadiem31/hinhanh2.jpg', '/images/diadiem31/hinhanh3.jpg', 23, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d56492.40148874871!2d103.0086487!3d21.4068741!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x312d09000209315f%3A0xd581cbecebd755c!2sEco%20Rose%20Homestay!5e1!3m2!1svi!2s!4v1728833017125!5m2!1svi!2s', 90, 19, '2021-12-21 00:00:00', NULL, NULL, NULL, NULL, NULL),
(32, 'Bình Long Hotel', 'bùi thị xuân/tổ 18 phố hoàng diệu, p, thị xã lai châu, lai châu, việt nam', '0914522122', 'Khách sạn-gia đình', '00:00:00', '23:59:00', 'ngủ nghỉ', 8.80, '1350000đ', '/images/diadiem32/hinhanh1.jpg', '/images/diadiem32/hinhanh2.jpg', '/images/diadiem32/hinhanh3.jpg', 53, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d112212.59628230576!2d103.3271885!3d22.3845237!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x36d2a1150e21db85%3A0x2ca559bf9d578cf1!2sB%C3%ACnh%20Long%20Hotel!5e1!3m2!1svi!2s!4v1728833052961!5m2!1svi!2s', 54, 39, '2016-02-24 00:00:00', NULL, NULL, NULL, NULL, NULL),
(33, 'Khách sạn Mường Thanh Luxury Sơn La', 'số 2 tô hiệu, p. tô hiệu, sơn la, 34000, việt nam', '02123906666', 'Khách sạn-gia đình', '00:00:00', '23:59:00', 'ngủ nghỉ', 9.20, '1200000đ', '/images/diadiem33/hinhanh1.jpg', '/images/diadiem33/hinhanh2.jpg', '/images/diadiem33/hinhanh3.jpg', 12, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d28261.445478803515!2d103.8874067!3d21.3278566!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31328b2cea7d243f%3A0x85e55d6231399f90!2zS2jDoWNoIHPhuqFuIE3GsOG7nW5nIFRoYW5oIEx1eHVyeSBTxqFuIExh!5e1!3m2!1svi!2s!4v1728833093045!5m2!1svi!2s', 50, 22, '2016-07-02 00:00:00', NULL, NULL, NULL, NULL, NULL),
(34, 'Khách Sạn Phương Thúy Âu Cơ', 'khu tái định cư số 1, tân thịnh, yên bái, việt nam', '0988680707', 'Khách sạn-gia đình', '00:00:00', '23:59:00', 'ngủ nghỉ', 9.40, '400000đ', '/images/diadiem34/hinhanh1.jpg', '/images/diadiem34/hinhanh2.jpg', '/images/diadiem34/hinhanh3.jpg', 20, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d56382.26291948983!2d104.8817032!3d21.6900271!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31335bd5ca383c6f%3A0x21a7468b07ea00ec!2zS2jDoWNoIFPhuqFuIFBoxrDGoW5nIFRow7p5IMOCdSBDxqE!5e1!3m2!1svi!2s!4v1728833135292!5m2!1svi!2s', 92, 39, '2018-01-23 00:00:00', NULL, NULL, NULL, NULL, NULL),
(35, 'Sojo Hotel', '112 lê thánh tông, tân thịnh, hòa bình, 350000, việt nam', '02183908333', 'Khách sạn-gia đình', '00:00:00', '23:59:00', 'ngủ nghỉ', 9.40, '400000đ', '/images/diadiem35/hinhanh1.jpg', '/images/diadiem35/hinhanh2.jpg', '/images/diadiem35/hinhanh3.jpg', 100, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3544.57182647224!2d105.3339113!3d20.8283229!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31346ba1e27edb8d%3A0x3a78547826ab0a90!2sSojo%20Hotel!5e1!3m2!1svi!2s!4v1728833165634!5m2!1svi!2s', 54, 16, '2024-10-24 00:00:00', NULL, NULL, NULL, NULL, NULL),
(36, 'Lotte Cinema Hải Dương', 'đỗ gia palace, 158 ngô quyền, p, hải dương, việt nam', '02203838511', 'Xem phim', '08:00:00', '22:00:00', 'vui chơi du lịch', 7.80, '100000đ', '/images/diadiem36/hinhanh1.jpg', '/images/diadiem36/hinhanh2.jpg', '/images/diadiem36/hinhanh3.jpg', 50, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3542.1768809713917!2d106.3141292!3d20.9298471!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31359b1176576e4d%3A0x84b11f8136913837!2zTG90dGUgQ2luZW1hIEjhuqNpIETGsMahbmc!5e1!3m2!1svi!2s!4v1728833197829!5m2!1svi!2s', 100, 30, '2018-07-11 00:00:00', NULL, NULL, NULL, NULL, NULL),
(37, 'Rosa Place Hotel', '2xfx+489, khu đô thị bắc, cầu trới, khu 5, hạ long, quảng ninh, việt nam', '0889382626', 'Khách sạn-gia đình', '00:00:00', '23:59:00', 'ngủ nghỉ', 9.40, '600000đ', '/images/diadiem37/hinhanh1.jpg', '/images/diadiem37/hinhanh2.jpg', '/images/diadiem37/hinhanh3.jpg', 12, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3539.9744949936276!2d106.9957814!3d21.0227951!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314af545d2414b37%3A0x9ff15d21c4754ca9!2sRosa%20Place%20Hotel!5e1!3m2!1svi!2s!4v1728833227137!5m2!1svi!2s', 85, 42, '2019-11-12 00:00:00', NULL, NULL, NULL, NULL, NULL),
(38, 'Nhà hàng 29', '33 ngọc hân công chúa, đại phúc, bắc ninh, 16000, việt nam', '0969603499', 'Nhà hàng rất ngon', '09:00:00', '16:00:00', 'ăn uống', 8.60, '200000-300000đ', '/images/diadiem38/hinhanh1.jpg', '/images/diadiem38/hinhanh2.jpg', '/images/diadiem38/hinhanh3.jpg', 213, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3536.2765101196287!2d106.0681039!3d21.1779862!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31350d86d4286a4d%3A0x5b751a73c8ad26d3!2zTmjDoCBow6BuZyAyOQ!5e1!3m2!1svi!2s!4v1728833264619!5m2!1svi!2s', 73, 35, '2018-11-28 00:00:00', NULL, NULL, NULL, NULL, NULL),
(39, 'Kim Thai Hotel', '3 đường hoàng văn thụ, tổ 1, thành phố thái nguyên, thái nguyên 24000, việt nam', '0886835588', 'Khách sạn tuyệt vời cho du khách', '14:00:00', '12:00:00', 'ngủ nghỉ', 9.00, '552000đ', '/images/diadiem39/hinhanh1.jpg', '/images/diadiem39/hinhanh2.jpg', '/images/diadiem39/hinhanh3.jpg', 150, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3526.2249304116376!2d105.8376416!3d21.594437!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313527dce89e5d71%3A0x73da6d6844f3260c!2sKim%20Thai%20Hotel!5e1!3m2!1svi!2s!4v1728833302239!5m2!1svi!2s', 61, 10, '2018-12-13 00:00:00', NULL, NULL, NULL, NULL, NULL),
(40, 'Nhà Hàng Hoa Ban Trắng - Trung Tâm Tổ Chức Sự Kiện', 'đt309b, hưng đạo, tam dương, vĩnh phúc 541800, việt nam', '0972471970', 'Nhà hàng ca hát cùng nhau', '00:00:00', '23:59:00', 'ăn uống', 7.50, '100000đ-500000đ', '/images/diadiem40/hinhanh1.jpg', '/images/diadiem40/hinhanh2.jpg', '/images/diadiem40/hinhanh3.jpg', 5, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3531.2263975518927!2d105.5699603!3d21.388185399999994!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3134effd925b9565%3A0x8513dda15226ff65!2zTmjDoCBIw6BuZyBIb2EgQmFuIFRy4bqvbmcgLSBUcnVuZyBUw6JtIFThu5UgQ2jhu6ljIFPhu7EgS2nhu4du!5e1!3m2!1svi!2s!4v1728833330098!5m2!1svi!2s', 88, 2, '2022-01-07 00:00:00', NULL, NULL, NULL, NULL, NULL),
(41, 'Vườn Quốc gia Xuân Sơn', '4xff+p7v, tân sơn, phú thọ, việt nam', '02103609116', 'Khung cảnh núi non hùng vĩ có những khu rừng nguyên sinh, hang động và thác nước cùng làng nghỉ dưỡng và lối đi bộ.', '08:00:00', '17:00:00', 'vui chơi du lịch', 8.60, '0đ', '/images/diadiem41/hinhanh1.jpg', '/images/diadiem41/hinhanh2.jpg', '/images/diadiem41/hinhanh3.jpg', 2074, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d113201.83728886627!2d104.9731784!3d21.1243544!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313381bb76dd67df%3A0xac3b479f492ab17b!2zVsaw4budbiBRdeG7kWMgZ2lhIFh1w6JuIFPGoW4!5e1!3m2!1svi!2s!4v1728833381954!5m2!1svi!2s', 55, 17, '2019-07-30 00:00:00', NULL, NULL, NULL, NULL, NULL),
(42, 'Chin Milktea & Macchiato - 29 Trần Hưng Đạo - Cà Mau', '29 trần hưng đạo, p. 5, thành phố cà mau, cà mau', '', 'Nước uống/ cà phê', '08:00:00', '22:30:00', 'ăn uống', 10.00, '20.000đ - 25.000đ', '/images/diadiem42/hinhanh1.jpg', '/images/diadiem42/hinhanh2.jpg', '/images/diadiem42/hinhanh3.jpg', 1, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3743.8211598377816!2d105.15572527478261!3d9.181060490886486!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a149982e4df78b%3A0xa6f3e63f589403a4!2sCHIN%20-%20Milk%20Tea%20%26%20Macchiato!5e1!3m2!1svi!2s!4v1728833452154!5m2!1svi!2s', 64, 28, '2024-08-31 00:00:00', NULL, NULL, NULL, NULL, NULL),
(43, 'Hoàng Gia Hotel', '47 trần huỳnh, phường 7, thành phố bạc liêu, bạc liêu', '', 'Khách sạn, ăn uống', '00:00:00', '23:59:00', 'ngủ nghỉ', 6.90, '200.000đ - 500.000đ', '/images/diadiem43/hinhanh1.jpg', '/images/diadiem43/hinhanh2.jpg', '/images/diadiem43/hinhanh3.jpg', 63, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3742.6334878740386!2d105.7178208!3d9.292844900000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a1096f310a104d%3A0x683f63c80da51097!2zNDcgVHLhuqduIEh14buzbmgsIFBoxrDhu51uZyA3LCBC4bqhYyBMacOqdQ!5e1!3m2!1svi!2s!4v1728833491232!5m2!1svi!2s', 55, 13, '2022-02-01 00:00:00', NULL, NULL, NULL, NULL, NULL),
(44, 'CGV Cinema - Vincom Sóc Trăng', 'tầng 3, tầng 3-4 vincom sóc trăng, trần hưng đạo, p. 2, tp. sóc trăng, sóc trăng', '', 'Giải trí, xem phim', '09:00:00', '22:00:00', 'vui chơi du lịch', 7.00, '60.000đ -120.000đ', '/images/diadiem44/hinhanh1.jpg', '/images/diadiem44/hinhanh2.jpg', '/images/diadiem44/hinhanh3.jpg', 4, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3739.328565154897!2d105.9706235!3d9.5971155!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a04d4752041ab5%3A0xdfa55bca93d1fef9!2sCGV%20Vincom%20S%C3%B3c%20Tr%C4%83ng!5e1!3m2!1svi!2s!4v1728833528963!5m2!1svi!2s', 84, 33, '2020-06-06 00:00:00', NULL, NULL, NULL, NULL, NULL),
(45, 'GÀ RÁN KFC - SENSE CITY BẾN TRE', 'tttm sense city, số 26a đường trần quốc tuấn, p.4, tp. bến tre, bến tre', '', 'Ăn uống', '10:00:00', '22:30:00', 'ăn uống', 9.00, '50.000đ -499.000đ', '/images/diadiem45/hinhanh1.jpg', '/images/diadiem45/hinhanh2.jpg', '/images/diadiem45/hinhanh3.jpg', 50, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3731.9749671795175!2d106.37715220000001!3d10.2420434!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x310aa8f60b02460d%3A0x588c38219eb2282b!2zMjZhIFRy4bqnbiBRdeG7kWMgVHXhuqVuLCBQaMaw4budbmcgNCwgQuG6v24gVHJl!5e1!3m2!1svi!2s!4v1728833561766!5m2!1svi!2s', 53, 21, '2019-11-25 00:00:00', NULL, NULL, NULL, NULL, NULL),
(46, 'Ăn Vặt Mờ Lem - Cầu Long Bình 1', 'cầu long bình 1, p. 5 - trước cty điện lực trà vinh, tp. trà vinh, trà vinh', '', 'Ăn vặt, vỉa hè', '00:00:00', '23:59:00', 'ăn uống', 5.00, '20.000đ - 70.000đ', '/images/diadiem46/hinhanh1.jpg', '/images/diadiem46/hinhanh2.jpg', '/images/diadiem46/hinhanh3.jpg', 4, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3735.5158019050614!2d106.34502599999999!3d9.936678!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zOcKwNTYnMTIuMCJOIDEwNsKwMjAnNDIuMSJF!5e1!3m2!1svi!2s!4v1728833615246!5m2!1svi!2s', 63, 11, '2022-03-14 00:00:00', NULL, NULL, NULL, NULL, NULL),
(47, 'Gia Hòa 2 Hotel', '50 lê lợi, tp. trà vinh, trà vinh', '', 'Khách sạn, nghỉ ngơi', '00:00:00', '23:59:00', 'ngủ nghỉ', 8.50, '150.000đ -500.000đ', '/images/diadiem47/hinhanh1.jpg', '/images/diadiem47/hinhanh2.jpg', '/images/diadiem47/hinhanh3.jpg', 17, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3735.375663243786!2d106.341571!3d9.94894!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a010a8dcaa6d93%3A0xc5dc7ba5e3d8c19c!2zNTAgTMOqIEzhu6NpLCBQaMaw4budbmcgMSwgVHLDoCBWaW5o!5e1!3m2!1svi!2s!4v1728833656002!5m2!1svi!2s', 58, 44, '2017-08-15 00:00:00', NULL, NULL, NULL, NULL, NULL),
(48, 'Hihi 67 Karaoke', '67/24f phó cơ điều, p. 4, thành phố vĩnh long, vĩnh long', '', 'Giải trí, karaoke', '09:00:00', '22:00:00', 'vui chơi du lịch', 6.90, '50.000đ -100.000đ', '/images/diadiem48/hinhanh1.jpg', '/images/diadiem48/hinhanh2.jpg', '/images/diadiem48/hinhanh3.jpg', 3, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3732.0974435351964!2d105.9860777!3d10.231631499999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x310a9d458e591d0f%3A0x63afc4d90462bbe7!2zNjcgxJAuIFBow7MgQ8ahIMSQaeG7gXUsIFBoxrDhu51uZyA0LCBWxKluaCBMb25n!5e1!3m2!1svi!2s!4v1728833686269!5m2!1svi!2s', 100, 9, '2023-03-13 00:00:00', NULL, NULL, NULL, NULL, NULL),
(49, 'Chả Giò Bích Đào - Đặc Sản Cao Lãnh - Đoàn Thị Điểm', '11/2 đoàn thị điểm, p. 2, tp. cao lãnh, đồng tháp', '', 'Ăn uống', '06:00:00', '23:00:00', 'ăn uống', 8.00, '35.000đ -150.000đ', '/images/diadiem49/hinhanh1.jpg', '/images/diadiem49/hinhanh2.jpg', '/images/diadiem49/hinhanh3.jpg', 10, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3729.460064929!2d105.63431179999999!3d10.453570999999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x310a65a9e5f8d383%3A0xd7f4e353756084fc!2zMTEgxJBvw6BuIFRo4buLIMSQaeG7g20sIFBoxrDhu51uZyAyLCBDYW8gTMOjbmgsIMSQ4buTbmcgVGjDoXA!5e1!3m2!1svi!2s!4v1728833716811!5m2!1svi!2s', 74, 26, '2020-08-05 00:00:00', NULL, NULL, NULL, NULL, NULL),
(50, 'Rừng Tràm Trà Sư', 'văn giáo, huyện tịnh biên, an giang', '', 'Tham quan,ăn uống, chụp ảnh', '07:00:00', '18:00:00', 'vui chơi du lịch', 7.10, '50.000đ -250.000đ', '/images/diadiem50/hinhanh1.jpg', '/images/diadiem50/hinhanh2.jpg', '/images/diadiem50/hinhanh3.jpg', 42, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d29822.77593826167!2d105.03358834999999!3d10.58704575!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x310a1fdf4659b3cd%3A0x93d802e0330dc01d!2zVsSDbiBHacOhbywgVHAuIENow6J1IMSQ4buRYywgQW4gR2lhbmc!5e1!3m2!1svi!2s!4v1728833743834!5m2!1svi!2s', 1326, 6, '2017-05-20 00:00:00', NULL, NULL, NULL, NULL, NULL),
(51, 'Highlands Coffee - Trà, Cà Phê & Bánh - Tôn Đức Thắng Rạch Giá', '47-50 tôn đức thắng, p. vĩnh bảo, tp. rạch giá, kiên giang', '', 'Ăn uống', '07:00:00', '22:00:00', 'ăn uống', 9.00, '55.000đ -149.000đ', '/images/diadiem51/hinhanh1.jpg', '/images/diadiem51/hinhanh2.jpg', '/images/diadiem51/hinhanh3.jpg', 5, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d29879.9714744603!2d105.0689263!3d9.9820474!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a0b57f39b03e13%3A0x9ac202d90c5f86a!2zSGlnaGxhbmRzIENvZmZlZSBUw7RuIMSQ4bupYyBUaOG6r25nIFLhuqFjaCBHacOh!5e1!3m2!1svi!2s!4v1728833789081!5m2!1svi!2s', 71, 38, '2017-12-24 00:00:00', NULL, NULL, NULL, NULL, NULL),
(52, 'Cháo Vịt A Toàn', 'nguyễn thái học, p. 1, thành phố vị thanh, hậu giang', '', 'Ăn uống', '17:00:00', '23:00:00', 'ăn uống', 9.00, '15.000đ -30.000đ', '/images/diadiem52/hinhanh1.jpg', '/images/diadiem52/hinhanh2.jpg', '/images/diadiem52/hinhanh3.jpg', 1, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3737.3027068847414!2d105.4654388!3d9.7789912!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a0e91026336b97%3A0x138d932c4b207348!2zTmd1eeG7hW4gVGjDoWkgSOG7jWMsIFBoxrDhu51uZyAxLCBUcC4gVuG7iyBUaGFuaCwgSOG6rXUgR2lhbmc!5e1!3m2!1svi!2s!4v1728833820541!5m2!1svi!2s', 85, 38, '2021-10-01 00:00:00', NULL, NULL, NULL, NULL, NULL),
(53, 'Công Viên Giải Trí Kittyd & Minnied', 'quốc lộ 1a, xã tân phú thạnh, huyện châu thành a, hậu giang', '', 'Vui chơi+ giải trí', '07:00:00', '18:00:00', 'vui chơi du lịch', 10.00, '195.000đ -250.000đ', '/images/diadiem53/hinhanh1.jpg', '/images/diadiem53/hinhanh2.jpg', '/images/diadiem53/hinhanh3.jpg', 23, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3738.1357912629683!2d105.77055!3d9.704608000000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zOcKwNDInMTYuNiJOIDEwNcKwNDYnMTQuMCJF!5e1!3m2!1svi!2s!4v1728833850556!5m2!1svi!2s', 59, 21, '2021-02-16 00:00:00', NULL, NULL, NULL, NULL, NULL),
(54, '577 Coffee & Billiards - Ninh Bình', 'ninh bình, p. 2, thành phố bạc liêu, bạc liêu', '', 'Ăn uống+ vui chơi', '07:00:00', '22:00:00', 'vui chơi du lịch', 6.00, '15.000đ -75.000đ', '/images/diadiem54/hinhanh1.jpg', '/images/diadiem54/hinhanh2.jpg', '/images/diadiem54/hinhanh3.jpg', 3, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7511855.970374984!2d102.12814769395413!3d14.722194517851444!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a10bd0ce81f6e3%3A0x3174b8b89cc1fe70!2zQ29mZmVlIEJpbGxpYXJkcyBUaMO5eSBExrDGoW5n!5e1!3m2!1svi!2s!4v1728833935684!5m2!1svi!2s', 94, 49, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL, NULL),
(55, 'Kimbap - Trần Phú', '36/3 trần phú, thành phố pleiku, gia lai', '', 'Ăn uống', '08:00:00', '22:00:00', 'ăn uống', 5.90, '20.000đ - 100.000đ', '/images/diadiem55/hinhanh1.jpg', '/images/diadiem55/hinhanh2.jpg', '/images/diadiem55/hinhanh3.jpg', 14, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3680.104997273473!2d107.99768429999999!3d13.9781125!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316c1f78fd669e23%3A0xdc6f8e52b37c920f!2zMzYgVHLhuqduIFBow7osIFAuIERpw6puIEjhu5NuZywgUGxlaWt1LCBHaWEgTGFpIDYwMDAwMA!5e1!3m2!1svi!2s!4v1728833971311!5m2!1svi!2s', 88, 36, '2016-02-08 00:00:00', NULL, NULL, NULL, NULL, NULL),
(56, 'Phở Hồng - Phở Khô Gia Lai', '22 - 24 nguyễn văn trỗi, p. hội thương, thành phố pleiku, gia lai', '', 'Ăn uống', '07:00:00', '22:00:00', 'ăn uống', 6.80, '25.000đ - 35.000đ', '/images/diadiem56/hinhanh1.jpg', '/images/diadiem56/hinhanh2.jpg', '/images/diadiem56/hinhanh3.jpg', 25, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3680.109451560787!2d108.00284409999999!3d13.9778339!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316c1f82575e02f3%3A0x52bb95f684f009b4!2zMjIgTmd1eeG7hW4gVsSDbiBUcuG7l2ksIFAuIEjhu5lpIFRoxrDGoW5nLCBQbGVpa3UsIEdpYSBMYWkgNjAwMDAw!5e1!3m2!1svi!2s!4v1728834010570!5m2!1svi!2s', 58, 5, '2017-11-01 00:00:00', NULL, NULL, NULL, NULL, NULL),
(57, 'Đỗ Quyên Garden - Khu Du Lịch Dã Ngoại Hồ Đăk Ke', 'hồ đăk ke, tt. măng đen, huyện kon plông, kon tum', '', 'Vui chơi', '07:00:00', '22:00:00', 'vui chơi du lịch', 8.00, '120.000đ - 250.000đ', '/images/diadiem57/hinhanh1.jpg', '/images/diadiem57/hinhanh2.jpg', '/images/diadiem57/hinhanh3.jpg', 2, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1835.1325465294833!2d108.2759884!3d14.580833600000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3169437b6e339d6d%3A0x447ec81410a75770!2zSOG7kyDEkGFrIEtl!5e1!3m2!1svi!2s!4v1728834041469!5m2!1svi!2s', 81, 29, '2016-01-11 00:00:00', NULL, NULL, NULL, NULL, NULL),
(58, 'Ẩm Thực Hoa Viên - Bà Triệu', '253 bà triệu, thành phố kon tum, kon tum', '', 'Ăn uống', '10:00:00', '23:00:00', 'ăn uống', 6.60, '50.000đ - 250.000đ', '/images/diadiem58/hinhanh1.jpg', '/images/diadiem58/hinhanh2.jpg', '/images/diadiem58/hinhanh3.jpg', 124, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3674.0020271936214!2d108.009228!3d14.3548549!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316bffa381d34d33%3A0xdaa00d81f2f835d8!2z4bqobSBUaOG7sWMgSG9hIFZpw6pu!5e1!3m2!1svi!2s!4v1728834071546!5m2!1svi!2s', 76, 28, '2019-06-22 00:00:00', NULL, NULL, NULL, NULL, NULL),
(59, 'Cơm Niêu Hương Miền Tây - Kiến Thành', '967 kiến thành, đắk rlấp, huyện đắk rlấp, đắk nông', '', 'ăn uống', '06:00:00', '21:00:00', 'ăn uống', 6.70, '20.000đ - 50.000đ', '/images/diadiem59/hinhanh1.jpg', '/images/diadiem59/hinhanh2.jpg', '/images/diadiem59/hinhanh3.jpg', 116, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d29679.306826261967!2d107.4539059!3d11.9722773!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3173bb58439260bd%3A0xe3a425236e0b0aa0!2zQ8ahbSBOacOqdSBIxrDGoW5nIE1p4buBbiBUw6J5!5e1!3m2!1svi!2s!4v1728834107311!5m2!1svi!2s', 89, 12, '2024-06-07 00:00:00', NULL, NULL, NULL, NULL, NULL),
(60, 'Tadung Topview Homestay', 'thôn 3, xã đăk som, huyện đắk glong, đắk nông', '', 'vui chơi', '00:00:00', '23:59:00', 'vui chơi du lịch', 7.70, '200.000đ - 500.000đ', '/images/diadiem60/hinhanh1.jpg', '/images/diadiem60/hinhanh2.jpg', '/images/diadiem60/hinhanh3.jpg', 3, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d29694.93183360531!2d106.9558324!3d11.8291856!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31736bf276c7b59f%3A0x23aa1e66318f74f!2zSG9hIFTGsMahaSB0aOG7iyB4w6MgUGjGsOG7m2MgTG9uZyAtIELDrG5oIFBoxrDhu5tj!5e1!3m2!1svi!2s!4v1728834139109!5m2!1svi!2s', 67, 32, '2021-03-30 00:00:00', NULL, NULL, NULL, NULL, NULL),
(61, 'Phúc Long Hoà Bình', '296 hòa bình, p. hiệp tân, quận tân phú, tp. hcm', '19001822', 'Cafe/dessert', '08:00:00', '21:30:00', 'ăn uống', 5.90, '28.000đ - 229.000đ', '/images/diadiem61/hinhanh1.jpg', '/images/diadiem61/hinhanh2.jpg', '/images/diadiem61/hinhanh3.jpg', 6, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4816.247134199468!2d106.6219533!3d10.7728558!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752d877c0fff59%3A0x33e470ee4f81b3d9!2sPhuc%20Long%20Coffee%20%26%20Tea!5e1!3m2!1svi!2s!4v1728884922204!5m2!1svi!2s', 70, 17, '2016-11-29 00:00:00', NULL, NULL, NULL, NULL, NULL),
(62, 'Cơm Gà Xối Mỡ Thạch Lam - Thạch Lam', '217 thạch lam, p. phú thạnh, quận tân phú, tp. hcm', '0981501938', 'Quán ăn - món việt', '10:00:00', '22:00:00', 'ăn uống', 7.00, '25.000đ - 35.000đ', '/images/diadiem62/hinhanh1.jpg', '/images/diadiem62/hinhanh2.jpg', '/images/diadiem62/hinhanh3.jpg', 34, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d38543.04103508091!2d106.5893073!3d10.7786119!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752c1c4674fc19%3A0x1cbb58588fe60acd!2zSOG7hyB0aOG7kW5nIEPGoW0gR8OgIFRo4bqhY2ggTGFtIC0gdGhhY2hsYW1jaGlja2VuLmNvbQ!5e1!3m2!1svi!2s!4v1728884960606!5m2!1svi!2s', 100, 6, '2022-07-06 00:00:00', NULL, NULL, NULL, NULL, NULL),
(63, 'A Chảy - Mì Sủi Cảo & Cơm Chiên Gà Xối Mỡ - Shop Online', '58/11 nguyễn văn săng, p. tân sơn nhì, quận tân phú, tp. hcm', '0981501938', 'Quán ăn - món việt', '06:00:00', '21:00:00', 'ăn uống', 5.40, '8.000đ - 47.000đ', '/images/diadiem63/hinhanh1.jpg', '/images/diadiem63/hinhanh2.jpg', '/images/diadiem63/hinhanh3.jpg', 9, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d77077.37276250504!2d106.5638488!3d10.7953322!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b2e808c6d49%3A0xf357b7e2365ef9a4!2zQ8ahbSB04bqlbSBLaMawxqFuZw!5e1!3m2!1svi!2s!4v1728885021398!5m2!1svi!2s', 87, 3, '2019-04-21 00:00:00', NULL, NULL, NULL, NULL, NULL),
(64, 'Cơm Tấm Khương - Cơm Tấm Sườn Cọng - CC Gò Dầu 2', '021 lôa chung cư gò dầu 2, đường tân sơn nhì, p. tân sơn nhì, quận tân phú', '0834000740', 'Quán ăn - món việt', '06:00:00', '22:30:00', 'ăn uống', 5.00, '41.000đ - 65.000đ', '/images/diadiem64/hinhanh1.jpg', '/images/diadiem64/hinhanh2.jpg', '/images/diadiem64/hinhanh3.jpg', 1, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d77077.37276250504!2d106.5638488!3d10.7953322!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b2e808c6d49%3A0xf357b7e2365ef9a4!2zQ8ahbSB04bqlbSBLaMawxqFuZw!5e1!3m2!1svi!2s!4v1728885021398!5m2!1svi!2s', 87, 15, '2021-10-28 00:00:00', NULL, NULL, NULL, NULL, NULL),
(65, 'Trà Sữa Gong Cha - 貢茶 - Nguyễn Sơn', '7 nguyễn sơn, p. phú thạnh, quận tân phú, tp. hcm', '02862673011', 'Cafe/dessert', '09:30:00', '21:30:00', 'ăn uống', 6.60, '40.000đ - 80.000đ', '/images/diadiem65/hinhanh1.jpg', '/images/diadiem65/hinhanh2.jpg', '/images/diadiem65/hinhanh3.jpg', 244, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.470196623728!2d106.63329499999999!3d10.780729399999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f57e58111c7%3A0xd5c295dc665ebebd!2zR29uZyBDaGEgTmd1eeG7hW4gU8ahbg!5e1!3m2!1svi!2s!4v1728885141034!5m2!1svi!2s', 1282, 12, '2017-07-13 00:00:00', NULL, NULL, NULL, NULL, NULL),
(66, 'HỦ TIẾU MỰC ÔNG GIÀ CALI - Thoại Ngọc Hầu', '2 thoại ngọc hầu, p. hòa thạnh, quận tân phú, tp. hcm', '0981501938', 'Quán ăn - món việt', '07:00:00', '22:00:00', 'ăn uống', 10.00, '41.000đ - 65.000đ', '/images/diadiem66/hinhanh1.jpg', '/images/diadiem66/hinhanh2.jpg', '/images/diadiem66/hinhanh3.jpg', 1, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.4088972991717!2d106.6414089!3d10.7856794!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f002d5b5451%3A0x4b4ce11cd780192!2zaOG7pyB0aeG6v3UgbeG7sWMgw7RuZyBnacOgIGNhbGk!5e1!3m2!1svi!2s!4v1728885168793!5m2!1svi!2s', 72, 33, '2023-11-11 00:00:00', NULL, NULL, NULL, NULL, NULL),
(67, 'Bánh Mì Hà Nội Long Duyên - Tân Sơn Nhì', '205 tân sơn nhì, p. tân sơn nhì, quận tân phú, tp. hcm', '0981501938', 'Quán ăn - món việt', '00:00:00', '22:00:00', 'ăn uống', 10.00, '41.000đ - 65.000đ', '/images/diadiem67/hinhanh1.jpg', '/images/diadiem67/hinhanh2.jpg', '/images/diadiem67/hinhanh3.jpg', 66, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4816.247134199468!2d106.6146374!3d10.8015803!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b9535b60699%3A0x4737f3be8bd41d5b!2zw4ZPTiBNQUxMIFTDom4gUGjDug!5e1!3m2!1svi!2s!4v1728885227016!5m2!1svi!2s', 50, 13, '2024-03-15 00:00:00', NULL, NULL, NULL, NULL, NULL),
(68, 'Bowling Dream Game - AEON Mall', 'tầng 3, tầng 3 aeon mall, 30 bờ bao tân thắng, p. sơn kỳ, quận tân phú, tp. hcm', '02862887733', 'khu chơi game', '09:00:00', '21:00:00', 'vui chơi du lịch', 6.80, '100.000đ - 165.000đ', '/images/diadiem68/hinhanh1.jpg', '/images/diadiem68/hinhanh2.jpg', '/images/diadiem68/hinhanh3.jpg', 16, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4816.247134199468!2d106.6146374!3d10.8015803!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b9535b60699%3A0x4737f3be8bd41d5b!2zw4ZPTiBNQUxMIFTDom4gUGjDug!5e1!3m2!1svi!2s!4v1728885227016!5m2!1svi!2s', 88, 44, '2024-08-04 00:00:00', NULL, NULL, NULL, NULL, NULL),
(69, 'tiNiWorld Aeon Tân Phú', 'tầng 2, tầng 2 aeon mall, 30 bờ bao tân thắng, p. sơn kỳ, quận tân phú, tp. hcm', '0903064040', 'khu chơi game', '09:00:00', '22:00:00', 'vui chơi du lịch', 7.20, '20.000đ - 50.000đ', '/images/diadiem69/hinhanh1.jpg', '/images/diadiem69/hinhanh2.jpg', '/images/diadiem69/hinhanh3.jpg', 8, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d19269.34319062626!2d106.6020938!3d10.8013965!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752beca786a08d%3A0xc3dc823cccc94690!2stiNiWorld%20Aeon%20T%C3%A2n%20Ph%C3%BA!5e1!3m2!1svi!2s!4v1728885297616!5m2!1svi!2s', 86, 27, '2016-09-05 00:00:00', NULL, NULL, NULL, NULL, NULL),
(70, 'Karaoke Zing', '10 độc lập, p. tân thành, quận tân phú, tp. hcm', '0903064040', 'Karaoke', '09:00:00', '23:00:00', 'vui chơi du lịch', 6.50, '50.000đ - 220.000đ', '/images/diadiem70/hinhanh1.jpg', '/images/diadiem70/hinhanh2.jpg', '/images/diadiem70/hinhanh3.jpg', 11, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.3343272927095!2d106.6370252!3d10.791698!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752eacc465bb11%3A0x89803d8c07bb3ae2!2zMTAgxJDhu5ljIEzhuq1wIC0gMTAgxJDhu5ljIEzhuq1wIC0gUGjGsOG7nW5nIFTDom4gVGjDoG5o!5e1!3m2!1svi!2s!4v1728885373571!5m2!1svi!2s', 67, 45, '2020-02-18 00:00:00', NULL, NULL, NULL, NULL, NULL),
(71, 'Tấn Tài Billiards', '332 gò dầu, p. tân qúy, quận tân phú, tp. hcm', '0903064040', 'billiards', '08:00:00', '22:30:00', 'vui chơi du lịch', 5.00, '50.000đ - 110.000đ', '/images/diadiem71/hinhanh1.jpg', '/images/diadiem71/hinhanh2.jpg', '/images/diadiem71/hinhanh3.jpg', 1, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4816.247134199468!2d106.613022!3d10.8009202!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b0ae161c1b5%3A0xfb881ddc6e6e053d!2sFANPEKKA!5e1!3m2!1svi!2s!4v1728885416261!5m2!1svi!2s', 79, 3, '2016-12-11 00:00:00', NULL, NULL, NULL, NULL, NULL),
(72, 'Khu Vui Chơi Fanpekka - Aeon Mall Tân Phú', 'tầng 3, tầng 3 aeon mall tân phú, 30 bờ bao tân thắng, p. sơn kỳ, quận tân phú, tp. hcm', '0906660851', 'khu vui chơi', '09:00:00', '22:00:00', 'vui chơi du lịch', 8.60, '50.000đ - 300.000đ', '/images/diadiem72/hinhanh1.jpg', '/images/diadiem72/hinhanh2.jpg', '/images/diadiem72/hinhanh3.jpg', 33, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4816.247134199468!2d106.613022!3d10.8009202!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b0ae161c1b5%3A0xfb881ddc6e6e053d!2sFANPEKKA!5e1!3m2!1svi!2s!4v1728885416261!5m2!1svi!2s', 92, 18, '2017-03-03 00:00:00', NULL, NULL, NULL, NULL, NULL),
(73, 'Tân Phú Gia Hotel - Gò Dầu', '58-60 gò dầu, quận tân phú, tp. hcm', '0906660851', 'khách sạn', '09:00:00', '22:00:00', 'ngủ nghỉ', 5.00, '200.000đ - 600.000đ', '/images/diadiem73/hinhanh1.jpg', '/images/diadiem73/hinhanh2.jpg', '/images/diadiem73/hinhanh3.jpg', 11, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.2813651476495!2d106.62667739999999!3d10.795970599999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b22196a6b13%3A0xb56963ec7330524d!2zS2jDoWNoIHPhuqFuIFTDom4gUGjDuiBHaWE!5e1!3m2!1svi!2s!4v1728885496453!5m2!1svi!2s', 73, 48, '2019-01-05 00:00:00', NULL, NULL, NULL, NULL, NULL),
(74, 'Khách Sạn Phú Hưng', '3338 đ.tân sơn nhì, tân sơn nhì, tân phú, tphcm', '0906660852', 'khách sạn', '00:00:00', '23:59:00', 'ngủ nghỉ', 8.60, '200.000đ - 600.000đ', '/images/diadiem74/hinhanh1.jpg', '/images/diadiem74/hinhanh2.jpg', '/images/diadiem74/hinhanh3.jpg', 23, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d19291.11645976821!2d106.6163777!3d10.7959704!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752900525f3833%3A0x6d9c8c7f25f508d7!2zS2jDoWNoIFPhuqFuIFBow7ogSMawbmc!5e1!3m2!1svi!2s!4v1728977503018!5m2!1svi!2s', 88, 15, '2018-09-19 00:00:00', NULL, NULL, NULL, NULL, NULL),
(75, 'Khách sạn Hải Miền', '38 vườn lài, phường tân thành, quận tân phúm thành phố hcm', '0906660853', 'Khách sạn', '00:00:00', '23:59:00', 'ngủ nghỉ', 8.60, '200.000đ - 600.000đ', '/images/diadiem75/hinhanh1.jpg', '/images/diadiem75/hinhanh2.jpg', '/images/diadiem75/hinhanh3.jpg', 12, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4820.601788027858!2d106.6317596!3d10.7875332!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752eabe2827f03%3A0x773bb154aa530f35!2zSG90ZWwgSOG6o2kgTWnDqm4!5e1!3m2!1svi!2s!4v1728977537173!5m2!1svi!2s', 73, 33, '2020-07-19 00:00:00', NULL, NULL, NULL, NULL, NULL),
(76, 'khách sạn lộc phát', '16c lũy bán bích tân phú 1, phường tân thới hòa, quận tân phú, thành phố hcm', '0906660854', 'khách sạn', '00:00:00', '23:59:00', 'ngủ nghỉ', 8.60, '200.000đ - 600.000đ', '/images/diadiem76/hinhanh1.jpg', '/images/diadiem76/hinhanh2.jpg', '/images/diadiem76/hinhanh3.jpg', 4, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d308348.68293447566!2d106.3692621!3d10.760365!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f56af601fe1%3A0x9a95af9b98290462!2zS2jDoWNoIFPhuqFuIEzhu5ljIFBow6F0!5e1!3m2!1svi!2s!4v1728977737847!5m2!1svi!2s', 100, 26, '2021-09-30 00:00:00', NULL, NULL, NULL, NULL, NULL),
(77, 'khách sạn sao phương thảo', '140f lê thiết, phường phú thọ hòa, quận tân phú, thành phố hcm', '0906660855', 'khách sạn', '00:00:00', '23:59:00', 'ngủ nghỉ', 8.60, '200.000đ - 600.000đ', '/images/diadiem77/hinhanh1.jpg', '/images/diadiem77/hinhanh2.jpg', '/images/diadiem77/hinhanh3.jpg', 2, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4816.247134199468!2d106.6171381!3d10.7863226!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752c05b3c6ded1%3A0x4ec5714812c7309f!2zQ8O0bmcgVHkgVG5oaCBNdHYgS2jDoWNoIFPhuqFuIFNhbyBQaMawxqFuZyBUaOG6o28!5e1!3m2!1svi!2s!4v1728977767645!5m2!1svi!2s', 80, 11, '2022-04-07 00:00:00', NULL, NULL, NULL, NULL, NULL),
(78, 'khách sạn thiên thuận', '130 nguyễn cữu đàm, tân phú, tân sơn nhất, phường tân sơn nhì, quận tân phú', '0906660856', 'khách sạn', '00:00:00', '23:59:00', 'ngủ nghỉ', 8.60, '200.000đ - 600.000đ', '/images/diadiem78/hinhanh1.jpg', '/images/diadiem78/hinhanh2.jpg', '/images/diadiem78/hinhanh3.jpg', 1, 'Https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4816.247134199468!2d106.6261155!3d10.8000835!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bfdbdac23db%3A0x23ff4837623b925c!2zS2jDoWNoIFPhuqFuIFRoacOqbiBUaHXhuq1u!5e1!3m2!1svi!2s!4v1728977933173!5m2!1svi!2s', 100, 34, '2021-03-27 00:00:00', NULL, NULL, NULL, NULL, NULL),
(79, 'Ice Coffee - Cà phê đá', '76 tân quý, tân phú, thành phố hồ chí minh', '0906660857', 'khách sạn', '00:00:00', '23:59:00', 'vui chơi du lịch', 8.60, '200.000đ - 600.000đ', '/images/diadiem79/hinhanh1.jpg', '/images/diadiem79/hinhanh2.jpg', '/images/diadiem79/hinhanh3.jpg', 33, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d14898.52882318579!2d106.61734189999999!3d10.84820495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2s!5e1!3m2!1sen!2s!4v1728978153823!5m2!1sen!2s', 57, 2, '2023-05-22 00:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `dia_diem` (`id`, `ten_dia_diem`, `dia_chi`, `so_dien_thoai`, `mo_ta`, `gio_mo_cua`, `gio_dong_cua`, `loai_hinh`, `diem_trung_binh`, `gia_ca_giao_dong`, `hinh_anh1`, `hinh_anh2`, `hinh_anh3`, `so_luot_danh_gia`, `link_dia_diem`, `so_luot_tk`, `id_nguoi_dang`, `ngay_dang`, `hinh_anh4`, `hinh_anh5`, `hinh_anh6`, `hinh_anh7`, `nguoi_tao_id`) VALUES
(80, 'Vịt Quay Lu Văn Thiết - Phạm Văn Đồng', '191 phạm văn đồng, p.4, quận gò vấp, tp. hcm', '0933483945', 'Quán ăn - món việt', '07:00:00', '22:00:00', 'ăn uống', 7.80, '150.000đ - 300.000đ', '/images/diadiem80/hinhanh1.jpg', '/images/diadiem80/hinhanh2.jpg', '/images/diadiem80/hinhanh3.jpg', 3, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.017649905577!2d106.68553589999999!3d10.8172204!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529a8b00416cf%3A0xf5984e28166cdcdf!2zMTkxIMSQLiBQaOG6oW0gVsSDbiDEkOG7k25nLCBQaMaw4budbmcgNCwgR8OyIFbhuqVwLCBI4buTIENow60gTWluaA!5e1!3m2!1sen!2s!4v1728980558993!5m2!1sen!2s', 91, 2, '2019-07-23 00:00:00', NULL, NULL, NULL, NULL, NULL),
(81, 'Bếp Mẹ Shin - Chân Gà Sốt Thái Cay 5 Cấp Độ & Ăn Vặt', '102/5 đường số 20, p. 5, quận gò vấp, tp. hcm', '0933483123', 'Quán ăn - Ăn vặt', '10:00:00', '23:00:00', 'ăn uống', 9.00, '10.000đ - 100.000đ', '/images/diadiem81/hinhanh1.jpg', '/images/diadiem81/hinhanh2.jpg', '/images/diadiem81/hinhanh3.jpg', 10, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d6264.3480220261845!2d106.6819515!3d10.8344452!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175298a02920461%3A0x8a0d4aa08b461030!2zMTAyIMSQxrDhu51uZyBz4buRIDIwLCBQaMaw4budbmcgNSwgR8OyIFbhuqVwLCBI4buTIENow60gTWluaA!5e1!3m2!1sen!2s!4v1728980824484!5m2!1sen!2s', 79, 8, '2020-06-18 00:00:00', NULL, NULL, NULL, NULL, NULL),
(82, 'Ăn Vặt Gò Vấp', '954/5/6 quang trung, p. 8, quận gò vấp, tp. hcm', '0933483432', 'Quán ăn - Ăn vặt', '09:00:00', '22:00:00', 'ăn uống', 7.00, '20.000đ - 100.000đ', '/images/diadiem82/hinhanh1.jpg', '/images/diadiem82/hinhanh2.jpg', '/images/diadiem82/hinhanh3.jpg', 4, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.7401326002177!2d106.6482695!3d10.8395379!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175293c84fe6c71%3A0x3620a3be8a52f284!2zOTU0LzUvNiDEkC4gUXVhbmcgVHJ1bmcsIFBoxrDhu51uZyA4LCBHw7IgVuG6pXAsIEjhu5MgQ2jDrSBNaW5o!5e1!3m2!1sen!2s!4v1728990338260!5m2!1sen!2s', 75, 48, '2018-10-22 00:00:00', NULL, NULL, NULL, NULL, NULL),
(83, 'Cơm Gà Gò Vấp', '710/1/26 phan văn trị, p. 10, quận gò vấp, tp. hcm', '0976295609', 'Quán ăn - Cơm', '09:00:00', '18:00:00', 'ăn uống', 10.00, '34.000đ - 45.000đ', '/images/diadiem83/hinhanh1.jpg', '/images/diadiem83/hinhanh2.jpg', '/images/diadiem83/hinhanh3.jpg', 5, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3765.6634697118357!2d106.6768992!3d10.831249099999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528fe2d307017%3A0x368a2705c1be89d4!2zNzEwLzEgxJAuIFBoYW4gVsSDbiBUcuG7iywgUGjGsOG7nW5nIDEwLCBHw7IgVuG6pXAsIEjhu5MgQ2jDrSBNaW5oIDcwMDAwMA!5e1!3m2!1sen!2s!4v1728990372164!5m2!1sen!2s', 87, 30, '2016-08-22 00:00:00', NULL, NULL, NULL, NULL, NULL),
(84, 'Tropical Juices - Emart Gò Vấp', '366 phan văn trị, p. 5, quận gò vấp, tp. hcm', '0976256469', 'Quán ăn - Nước trái cây', '08:00:00', '22:00:00', 'ăn uống', 8.00, '35.000đ - 40.000đ', '/images/diadiem84/hinhanh1.jpg', '/images/diadiem84/hinhanh2.jpg', '/images/diadiem84/hinhanh3.jpg', 19, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d5194.466931067073!2d106.6880756!3d10.8256957!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528f0ee3b7e17%3A0x81c1c949ec584eab!2zMzY2IMSQLiBQaGFuIFbEg24gVHLhu4ssIFBoxrDhu51uZyA1LCBHw7IgVuG6pXAsIEjhu5MgQ2jDrSBNaW5o!5e1!3m2!1sen!2s!4v1728990407390!5m2!1sen!2s', 60, 22, '2019-08-19 00:00:00', NULL, NULL, NULL, NULL, NULL),
(85, 'Quán Nhậu Cây Sung Gò Vấp', '1227/24 lê đức thọ, p. 13, quận gò vấp, tp. hcm', '0976253454', 'Quán ăn - quán nhậu', '10:30:00', '22:30:00', 'ăn uống', 5.00, '80.000đ - 420.000đ', '/images/diadiem85/hinhanh1.jpg', '/images/diadiem85/hinhanh2.jpg', '/images/diadiem85/hinhanh3.jpg', 5, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d5193.94463916685!2d106.6523829!3d10.855781!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529bf9840b133%3A0xc58268e1598eea97!2zMTIyNyDEkC4gTMOqIMSQ4bupYyBUaOG7jSwgUGjGsOG7nW5nIDEzLCBHw7IgVuG6pXAsIEjhu5MgQ2jDrSBNaW5o!5e1!3m2!1sen!2s!4v1728990426717!5m2!1sen!2s', 89, 3, '2023-05-23 00:00:00', NULL, NULL, NULL, NULL, NULL),
(86, 'Kim Ngư - Karaoke Gò Vấp Vip', '524 - 526 nguyễn văn khối, p. 9, quận gò vấp, tp. hcm', '0933422132', 'Karaoke', '09:00:00', '23:59:00', 'vui chơi du lịch', 10.00, '50.000đ - 1.000.000đ', '/images/diadiem86/hinhanh1.jpg', '/images/diadiem86/hinhanh2.jpg', '/images/diadiem86/hinhanh3.jpg', 4, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5194.117827123271!2d106.6451135!3d10.845805299999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175299a6b12e3db%3A0x3827ff2d4937b096!2zNTI0IE5ndXnhu4VuIFbEg24gS2jhu5FpLCBQaMaw4budbmcgOCwgR8OyIFbhuqVwLCBI4buTIENow60gTWluaA!5e1!3m2!1sen!2s!4v1728990452054!5m2!1sen!2s', 62, 45, '2024-05-19 00:00:00', NULL, NULL, NULL, NULL, NULL),
(87, 'CLB Billiards Đại Phú Lạc Hồng', '16/4q phạm văn chiêu, p.12, quận gò vấp, tp. hcm', '0933422133', 'Billiards', '09:00:00', '23:30:00', 'vui chơi du lịch', 8.00, '50.000đ - 132.000đ', '/images/diadiem87/hinhanh1.jpg', '/images/diadiem87/hinhanh2.jpg', '/images/diadiem87/hinhanh3.jpg', 2, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5194.133185367908!2d106.65099599999999!3d10.844920999999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175299840918463%3A0x19c95b45fbd6355a!2zMTYvNEM3IFBo4bqhbSBWxINuIENoacOqdSwgUGjGsOG7nW5nIDksIEfDsiBW4bqlcCwgSOG7kyBDaMOtIE1pbmg!5e1!3m2!1sen!2s!4v1728990471613!5m2!1sen!2s', 98, 26, '2018-01-21 00:00:00', NULL, NULL, NULL, NULL, NULL),
(89, 'Galaxy Cinema - Quang Trung', '304a quang trung, p. 11, quận gò vấp, tp. hcm', '0976295632', 'Rạp chiếu phim', '07:00:00', '22:00:00', 'vui chơi du lịch', 6.60, '45.000đ - 120.000đ', '/images/diadiem89/hinhanh1.jpg', '/images/diadiem89/hinhanh2.jpg', '/images/diadiem89/hinhanh3.jpg', 20, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5194.305944996443!2d106.6620909!3d10.8349689!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175290829c79d11%3A0xf0f26c51ee7b33b0!2zMzA0QSDEkC4gUXVhbmcgVHJ1bmcsIFBoxrDhu51uZyAxMSwgR8OyIFbhuqVwLCBI4buTIENow60gTWluaCA3MDAwMDA!5e1!3m2!1sen!2s!4v1728990506516!5m2!1sen!2s', 66, 37, '2023-12-14 00:00:00', NULL, NULL, NULL, NULL, NULL),
(90, 'Game Center - Vincom Gò Vấp', 'tầng 4, tầng 4 vincom, 12 phan văn trị, p. 7, quận gò vấp, tp. hcm', '0933422144', 'khu chơi game', '09:00:00', '22:00:00', 'vui chơi du lịch', 8.00, '5.000đ - 200.000đ', '/images/diadiem90/hinhanh1.jpg', '/images/diadiem90/hinhanh2.jpg', '/images/diadiem90/hinhanh3.jpg', 50, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5194.442692993947!2d106.68923869999999!3d10.8270849!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528f0b99ce875%3A0x1f806d9b226a083!2sVincom%20Plaza%20Phan%20V%C4%83n%20Tr%E1%BB%8B!5e1!3m2!1sen!2s!4v1728990522513!5m2!1sen!2s', 76, 34, '2020-10-07 00:00:00', NULL, NULL, NULL, NULL, NULL),
(91, 'Công Viên Gia Định', 'hoàng minh giám, quận gò vấp, tp. hcm', '0933425649', 'Tham quan-Chụp hình', '00:00:00', '23:59:00', 'vui chơi du lịch', 8.40, '10.000đ', '/images/diadiem91/hinhanh1.jpg', '/images/diadiem91/hinhanh2.jpg', '/images/diadiem91/hinhanh3.jpg', 44, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5194.682527270012!2d106.6759091!3d10.8132439!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752969d1433cdb%3A0x162c742a6d71dde8!2sGia%20Dinh%20Park!5e1!3m2!1sen!2s!4v1728990618178!5m2!1sen!2s', 1433, 36, '2024-10-25 00:00:00', NULL, NULL, NULL, NULL, NULL),
(92, 'Hồ Bơi K690', '312/60a phan văn trị, p. 10, quận gò vấp, tp. hcm', '0933422323', 'Vui chơi-Bơi lội', '09:00:00', '21:00:00', 'vui chơi du lịch', 6.50, '10.000đ - 20.000đ', '/images/diadiem92/hinhanh1.jpg', '/images/diadiem92/hinhanh2.jpg', '/images/diadiem92/hinhanh3.jpg', 13, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5194.341400685666!2d106.67190930000001!3d10.8329253!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752900eab684c1%3A0x96ccbc48cf564381!2zMzEyIMSQLiBQaGFuIFbEg24gVHLhu4ssIFBoxrDhu51uZyAxMCwgR8OyIFbhuqVwLCBI4buTIENow60gTWluaA!5e1!3m2!1sen!2s!4v1728990676015!5m2!1sen!2s', 82, 49, '2019-04-10 00:00:00', NULL, NULL, NULL, NULL, NULL),
(93, 'Pylos Hotel - Gò Vấp', '47 đường số 14, p. 8, quận gò vấp, tp. hcm', '0933422166', 'Nghỉ ngơi-Khách sạn', '00:00:00', '23:59:00', 'ngủ nghỉ', 9.80, '150.000đ - 700.000đ', '/images/diadiem93/hinhanh1.jpg', '/images/diadiem93/hinhanh2.jpg', '/images/diadiem93/hinhanh3.jpg', 32, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5194.199302171655!2d106.64724079999999!3d10.8411133!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529995353eb61%3A0xc1cdaf4385776969!2zNDcgxJDGsOG7nW5nIHPhu5EgMTQsIFBoxrDhu51uZyA4LCBHw7IgVuG6pXAsIEjhu5MgQ2jDrSBNaW5oIDcwMDAwMA!5e1!3m2!1sen!2s!4v1728990696580!5m2!1sen!2s', 80, 29, '2023-08-05 00:00:00', NULL, NULL, NULL, NULL, NULL),
(94, 'Quang Trung Hotel', '1116a - 1118 quang trung, p. 8, quận gò vấp, tp. hcm', '0329886227', 'Nghỉ ngơi-Khách sạn', '00:00:00', '23:59:00', 'ngủ nghỉ', 5.00, '150.000đ - 500.000đ', '/images/diadiem94/hinhanh1.jpg', '/images/diadiem94/hinhanh2.jpg', '/images/diadiem94/hinhanh3.jpg', 15, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5194.182150505555!2d106.643751!3d10.8421012!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175299b7808abc5%3A0x198293d02bdae5a6!2zMTExNmEgxJAuIFF1YW5nIFRydW5nLCBQaMaw4budbmcgOCwgR8OyIFbhuqVwLCBI4buTIENow60gTWluaA!5e1!3m2!1sen!2s!4v1728990715907!5m2!1sen!2s', 53, 33, '2017-08-20 00:00:00', NULL, NULL, NULL, NULL, NULL),
(95, 'Anh Thư Hotel', '725 phan văn trị, quận gò vấp, tp. hcm', '0933422121', 'Nghỉ ngơi-Khách sạn', '08:00:00', '23:00:00', 'ngủ nghỉ', 8.00, '400.000đ - 800.000đ', '/images/diadiem95/hinhanh1.jpg', '/images/diadiem95/hinhanh2.jpg', '/images/diadiem95/hinhanh3.jpg', 20, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5194.313836176575!2d106.667858!3d10.834514100000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529445632ff29%3A0xe55894e3800f70a9!2zNzI1IMSQLiBQaGFuIFbEg24gVHLhu4ssIFBoxrDhu51uZyAxMCwgR8OyIFbhuqVwLCBI4buTIENow60gTWluaA!5e1!3m2!1sen!2s!4v1728990732814!5m2!1sen!2s', 78, 24, '2019-01-26 00:00:00', NULL, NULL, NULL, NULL, NULL),
(96, 'Khách Sạn Kim Oanh - Phan Văn Trị', '550 phan văn trị, p. 7, quận gò vấp, tp. hcm', '0933422122', 'Nghỉ ngơi-Khách sạn', '00:00:00', '23:59:00', 'ngủ nghỉ', 7.10, '200.000đ - 600.000đ', '/images/diadiem96/hinhanh1.jpg', '/images/diadiem96/hinhanh2.jpg', '/images/diadiem96/hinhanh3.jpg', 11, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5194.389856166766!2d106.68007229999999!3d10.830131800000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528fef1cf15e9%3A0xfa50d92032ef3640!2zNTUwIMSQLiBQaGFuIFbEg24gVHLhu4ssIFBoxrDhu51uZyA3LCBHw7IgVuG6pXAsIEjhu5MgQ2jDrSBNaW5o!5e1!3m2!1sen!2s!4v1728990754461!5m2!1sen!2s', 81, 13, '2017-08-12 00:00:00', NULL, NULL, NULL, NULL, NULL),
(97, 'Biển Sao Hotel', '6c dương quảng hàm, p. 5, quận gò vấp, tp. hcm', '0933422133', 'Nghỉ ngơi-Khách sạn', '00:00:00', '23:59:00', 'ngủ nghỉ', 6.20, '300.000đ - 800.000đ', '/images/diadiem97/hinhanh1.jpg', '/images/diadiem97/hinhanh2.jpg', '/images/diadiem97/hinhanh3.jpg', 5, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5194.361764419747!2d106.68927459999999!3d10.831751399999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528f7946a04d1%3A0xf38b3b0d38e2ac10!2zMTc2LzYgRC4gUXXhuqNuZyBIw6BtLCBQaMaw4budbmcgNSwgR8OyIFbhuqVwLCBI4buTIENow60gTWluaA!5e1!3m2!1sen!2s!4v1728990782862!5m2!1sen!2s', 71, 31, '2023-09-08 00:00:00', NULL, NULL, NULL, NULL, NULL),
(98, 'Hoa Bảo Hotel - Thống Nhất', '393 thống nhất, p. 11, quận gò vấp, tp. hcm', '0933422142', 'Nghỉ ngơi-Khách sạn', '00:00:00', '23:30:00', 'ngủ nghỉ', 7.10, '250.000đ - 500.000đ', '/images/diadiem98/hinhanh1.jpg', '/images/diadiem98/hinhanh2.jpg', '/images/diadiem98/hinhanh3.jpg', 22, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d5194.186792981255!2d106.6621082!3d10.8418426!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529af80aa4257%3A0xd058ebad1a54dceb!2zS2jDoWNoIFPhuqFuIEhvYSBC4bqjbyBUaOG7kW5nIE5o4bqldA!5e1!3m2!1sen!2s!4v1728990799584!5m2!1sen!2s', 59, 49, '2023-02-01 00:00:00', NULL, NULL, NULL, NULL, NULL),
(99, 'Hòn Én Hotel', '138b lê lợi, p. 4, quận gò vấp, tp. hcm', '0933421982', 'Nghỉ ngơi-Khách sạn', '00:00:00', '23:59:00', 'ngủ nghỉ', 6.20, '200.000đ - 500.000đ', '/images/diadiem99/hinhanh1.jpg', '/images/diadiem99/hinhanh2.jpg', '/images/diadiem99/hinhanh3.jpg', 10, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d5194.595554288434!2d106.6814992!3d10.818274!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f6f780d75eb%3A0xf52fa3bf371f0f60!2sRedDoorz%20Hon%20En%20Hotel%20Le%20Loi%20Go%20Vap!5e1!3m2!1sen!2s!4v1728990816828!5m2!1sen!2s', 87, 34, '2019-07-14 00:00:00', NULL, NULL, NULL, NULL, NULL),
(100, 'Jollibee Tô Ký', '557 đ. tô ký, trung mỹ tây, quận 12, hồ chí minh, vietnam', '02862722260', 'Popular Philippines-based chain globally known for its famed fried chicken, spaghetti & burgers.', '09:00:00', '21:00:00', 'ăn uống', 9.60, '1-100000đ', '/images/diadiem100/hinhanh1.jpg', '/images/diadiem100/hinhanh2.jpg', '/images/diadiem100/hinhanh3.jpg', 10, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d2596.9406595033247!2d106.6177115!3d10.8594228!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bafeae89b31%3A0xe37067234e66c5b3!2zSm9sbGliZWUgVMO0IEvDvQ!5e1!3m2!1sen!2s!4v1728990834373!5m2!1sen!2s', 53, 7, '2021-03-30 00:00:00', NULL, NULL, NULL, NULL, NULL),
(101, 'SAPA COFFEE 24H', '3a tân chánh hiệp 35, tân chánh hiệp, quận 12, hồ chí minh, vietnam', '0909873603', 'Sapa Coffee 24h là một quán cà phê tuyệt vời với không gian mở rộng rãi và thoáng mát. Quán được thiết kế rất đẹp, tạo cảm giác thoải mái và thư giãn cho khách hàng.', '00:00:00', '23:59:00', 'ăn uống', 8.00, '1-60000đ', '/images/diadiem101/hinhanh1.jpg', '/images/diadiem101/hinhanh2.jpg', '/images/diadiem101/hinhanh3.jpg', 10, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d979.5979642841269!2d106.6199457!3d10.8577711!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b883828037f%3A0xbb967e5d40bde3ec!2sSAPA%20COFFEE%2024H!5e0!3m2!1sen!2s!4v1728990849439!5m2!1sen!2s', 58, 45, '2022-10-12 00:00:00', NULL, NULL, NULL, NULL, NULL),
(102, 'HanFood - Lẩu Nướng Hàn Quốc', '50 nguyễn hữu cầu, trung mỹ tây, hóc môn, hồ chí minh 70000, vietnam', '0903584125', 'Quán đồ ăn Hàn lẩu nướng giá sinh viên', '04:00:00', '22:00:00', 'ăn uống', 8.50, '100000đ-200000đ', '/images/diadiem102/hinhanh1.jpg', '/images/diadiem102/hinhanh2.jpg', '/images/diadiem102/hinhanh3.jpg', 12, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5193.735355418185!2d106.61391880000001!3d10.8678044!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bbd6d8f7a2b%3A0x15692d43431fa2ba!2zSGFuRm9vZCAtIEzhuql1IE7GsOG7m25nIEjDoG4gUXXhu5Fj!5e1!3m2!1sen!2s!4v1728990870737!5m2!1sen!2s', 82, 25, '2016-07-01 00:00:00', NULL, NULL, NULL, NULL, NULL),
(103, 'Mì Cay Seoul Tân Chánh Hiệp', '1093 đ. nguyễn ảnh thủ, tân chánh hiệp, quận 12, hồ chí minh 700000, vietnam', '0969427003', 'Quán mì cay ngon ngon', '08:00:00', '22:00:00', 'ăn uống', 8.80, '1-100000đ', '/images/diadiem103/hinhanh1.jpg', '/images/diadiem103/hinhanh2.jpg', '/images/diadiem103/hinhanh3.jpg', 11, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1298.4315583997313!2d106.6166308!3d10.8683373!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bc4411132cd%3A0x56e77c69604ff2ea!2zTcOsIENheSBTZW91bCBUw6JuIENow6FuaCBIaeG7h3A!5e1!3m2!1sen!2s!4v1728990885588!5m2!1sen!2s', 85, 38, '2024-08-29 00:00:00', NULL, NULL, NULL, NULL, NULL),
(104, 'Khách sạn Nguyên Trung', '534 đ. tô ký, tân chánh hiệp, quận 12, hồ chí minh 71506, vietnam', '0345355293', 'Nằm tại vị trí thuận tiện ở Quận 12, TP. Hồ Chí Minh, Khách Sạn Nguyên Trung tọa lạc cách Chùa Giác Lâm 13 km, Công viên văn hóa Đầm Sen 13 km và Chợ Tân Định 15 km. Chỗ nghỉ này nằm cách Bảo tàng lịch sử Việt Nam 15 km, Bảo tàng chứng tích chiến tranh 16 km và Dinh Thống Nhất 16 km. Khách sạn tình nhân cung cấp sân hiên, lễ tân 24/24, cùng Wi-Fi miễn phí ở toàn bộ chỗ nghỉ. Mỗi phòng đều có điều hòa và TV màn hình phẳng, ngoài ra một số căn tại khách sạn tình nhân có ban công. Tại Khách Sạn Nguyên Trung, tất cả các phòng đều có ga trải giường và khăn tắm.', '00:00:00', '23:59:00', 'ngủ nghỉ', 7.50, '350000đ', '/images/diadiem104/hinhanh1.jpg', '/images/diadiem104/hinhanh2.jpg', '/images/diadiem104/hinhanh3.jpg', 8, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3991.1225095007553!2d106.6176579!3d10.8632489!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b007a104ab3%3A0xa7b36d57dc90cb8!2zS2jDoWNoIHPhuqFuIE5ndXnDqm4gVHJ1bmc!5e1!3m2!1sen!2s!4v1728990909107!5m2!1sen!2s', 77, 14, '2022-06-18 00:00:00', NULL, NULL, NULL, NULL, NULL),
(105, 'Van Thanh Dat Hotel', '959 đ. nguyễn ảnh thủ, tân chánh hiệp, quận 12, hồ chí minh 700000, vietnam', '02862566156', 'On a bustling street with shops and restaurants, this unassuming budget hotel is 5 km from Rin Rin Park, 12 km from Tân Sơn Nhất International Airport, and 17 km from Bến Thành Market in the city center.', '00:00:00', '23:59:00', 'ngủ nghỉ', 7.60, '250000đ', '/images/diadiem105/hinhanh1.jpg', '/images/diadiem105/hinhanh2.jpg', '/images/diadiem105/hinhanh3.jpg', 9, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d2596.8486398986834!2d106.6183321!3d10.8700008!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b1c7eb09541%3A0xc9d352f5f82fa143!2sVan%20Thanh%20Dat%20Hotel!5e1!3m2!1sen!2s!4v1728990955104!5m2!1sen!2s', 81, 41, '2022-04-30 00:00:00', NULL, NULL, NULL, NULL, NULL),
(106, 'Khách Sạn Hòa Bình', '640 đ. huỳnh thị hai, khu phố 8, quận 12, hồ chí minh, vietnam', '02862592183', 'Based on sightseeing, recreation, and getting around', '00:00:00', '23:59:00', 'ngủ nghỉ', 7.60, '350000đ', '/images/diadiem106/hinhanh1.jpg', '/images/diadiem106/hinhanh2.jpg', '/images/diadiem106/hinhanh3.jpg', 9, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d2596.8390509560986!2d106.6202457!3d10.8711025!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a052078eebd%3A0x489ec73d9aa071f1!2zS2jDoWNoIFPhuqFuIEjDsmEgQsOsbmg!5e1!3m2!1sen!2s!4v1728990971279!5m2!1sen!2s', 75, 8, '2019-06-03 00:00:00', NULL, NULL, NULL, NULL, NULL),
(107, 'Gia Bảo Hotel', '1061 1 đ. nguyễn ảnh thủ, tân chánh hiệp, quận 12, hồ chí minh 70000, vietnam', '02862566075', 'Gia Bao Hotel là một khách sạn 2.0 sao tọa lạc tại Hồ Chí Minh, Việt Nam. Với dịch vụ chuyên nghiệp và tiện nghi hiện đại, khách sạn này là lựa chọn lý tưởng cho du khách muốn khám phá thành phố sôi động này. Khách sạn Gia Bao có tổng cộng 18 phòng, đảm bảo sự thoải mái và riêng tư cho du khách. Mỗi phòng được trang bị đầy đủ tiện nghi cần thiết để mang đến trải nghiệm nghỉ ngơi tuyệt vời. Quý khách có thể thư giãn và tận hưởng không gian riêng tư sau một ngày dạo chơi và khám phá thành phố. Thời gian nhận phòng tại Gia Bao Hotel là từ 02:00 PM, và thời gian trả phòng là đến 12:00 PM. Khách sạn cũng có chính sách đặc biệt cho trẻ em. Trẻ em từ 2 đến 6 tuổi được ở miễn phí tại khách sạn này, tạo điều kiện thuận lợi cho gia đình du lịch có trẻ nhỏ.', '00:00:00', '23:59:00', 'ngủ nghỉ', 7.60, '350000đ', '/images/diadiem107/hinhanh1.jpg', '/images/diadiem107/hinhanh2.jpg', '/images/diadiem107/hinhanh3.jpg', 9, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d2596.8504040481334!2d106.6181644!3d10.8697981!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a10faa3f733%3A0x5820c409b9b505af!2zR2lhIELhuqNvIEhvdGVs!5e1!3m2!1sen!2s!4v1728990987942!5m2!1sen!2s', 83, 40, '2022-12-16 00:00:00', NULL, NULL, NULL, NULL, NULL),
(108, 'Nhà Hàng Vườn Lan', '45 đ. song hành, trung chánh, hóc môn, hồ chí minh, vietnam', '02862761896', 'Nhà hàng lớn nhất q12. Vị tri ok. Chất lượng thức ăn và dich vụ tốt.', '08:00:00', '23:00:00', 'ăn uống', 8.20, '100000đ-1000000đ', '/images/diadiem108/hinhanh1.jpg', '/images/diadiem108/hinhanh2.jpg', '/images/diadiem108/hinhanh3.jpg', 10, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1298.4518680788226!2d106.6040012!3d10.8636685!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a6b167d8551%3A0xff8efcb75ebac7dd!2zTmjDoCBIw6BuZyBWxrDhu51uIExhbg!5e1!3m2!1sen!2s!4v1728991004595!5m2!1sen!2s', 89, 29, '2022-11-05 00:00:00', NULL, NULL, NULL, NULL, NULL),
(109, 'Hotel Ánh Phương 2', 'a6 đ. tô ký, tân chánh hiệp, quận 12, hồ chí minh, vietnam', '0846641234', 'Nằm tại vị trí thuận tiện ở Quận 12, TP. Hồ Chí Minh, Hotel Ánh Phương II tọa lạc cách Công viên văn hóa Đầm Sen 13 km, Chợ Tân Định 14 km và Bảo tàng lịch sử Việt Nam 14 km. Ngoài Wi-Fi miễn phí, khách sạn 3 sao này còn cung cấp dịch vụ phòng và quầy lễ tân 24 giờ. Đây là chỗ nghỉ không hút thuốc và nằm cách Chùa Giác Lâm 12 km. Tại khách sạn, tất cả các phòng đều có tủ quần áo. Các phòng được thiết kế có điều hòa và TV màn hình phẳng, ngoài ra một số phòng tại Hotel Ánh Phương II có view thành phố. Tại chỗ nghỉ, các phòng đều có ga trải giường và khăn tắm.', '00:00:00', '23:59:00', 'ngủ nghỉ', 7.60, '300000đ', '/images/diadiem108/hinhanh1.jpg', '/images/diadiem108/hinhanh2.jpg', '/images/diadiem108/hinhanh3.jpg', 11, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d41551.23455427875!2d106.6077493!3d10.8581001!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b0673a12115%3A0xc5acdd2dfa4ebf1d!2zSG90ZWwgw4FuaCBQaMawxqFuZyAy!5e1!3m2!1sen!2s!4v1728991021480!5m2!1sen!2s', 96, 23, '2020-07-09 00:00:00', NULL, NULL, NULL, NULL, NULL),
(110, 'Galaxy Trung Chánh', 'trung tâm văn hóa quận 12 - hông trung tâm văn hóa quận 12 - nguyễn ảnh thủ, p, 09 ql22, trung mỹ tây, quận 12, hồ chí minh 700000, vietnam', '19002224', 'Rạp chiếu phim ở Trung Chánh', '08:00:00', '22:00:00', 'vui chơi du lịch', 8.80, '55000đ-200000đ', '/images/diadiem109/hinhanh1.jpg', '/images/diadiem109/hinhanh2.jpg', '/images/diadiem109/hinhanh3.jpg', 11, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d20775.808429040204!2d106.6083393!3d10.8553514!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a319ffb8a75%3A0x4a3882da065670aa!2sGalaxy%20Trung%20Ch%C3%A1nh!5e1!3m2!1sen!2s!4v1728991036591!5m2!1sen!2s', 61, 25, '2018-01-25 00:00:00', NULL, NULL, NULL, NULL, NULL),
(111, 'Galaxy Nguyen Van Qua', '119b đ. nguyễn văn quá, đông hưng thuận, quận 12, hồ chí minh, vietnam', '19002224', 'Trải nghiệm tuyệt vời tại Galaxy Cinema Nguyễn Văn Quá', '08:00:00', '22:00:00', 'vui chơi du lịch', 8.80, '55000đ-200000đ', '/images/diadiem110/hinhanh1.jpg', '/images/diadiem110/hinhanh2.jpg', '/images/diadiem110/hinhanh3.jpg', 12, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d41552.756608811505!2d106.634054!3d10.8471527!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529809630bdb9%3A0x21c165d4ca1c1e42!2sGalaxy%20Nguyen%20Van%20Qua!5e1!3m2!1sen!2s!4v1728991054747!5m2!1sen!2s', 67, 37, '2021-08-12 00:00:00', NULL, NULL, NULL, NULL, NULL),
(112, 'An Suong Park', '23 dn5, phường, quận 12, hồ chí minh 70000, vietnam', '', 'Công viên công cộng', '17:00:00', '23:00:00', 'vui chơi du lịch', 7.00, '0đ-100000đ', '/images/diadiem111/hinhanh1.jpg', '/images/diadiem111/hinhanh2.jpg', '/images/diadiem111/hinhanh3.jpg', 11, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5194.172319776045!2d106.6207870761426!3d10.84266738931021!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a2951327661%3A0x1f5141bf81ec6c28!2sAn%20Suong%20Park!5e1!3m2!1sen!2s!4v1728991145793!5m2!1sen!2s', 55, 5, '2020-03-08 00:00:00', NULL, NULL, NULL, NULL, NULL),
(113, 'Chùa Thiên Quang (Thiên Quang Tự)', '53/3 đ. thiên quang, trung mỹ tây, hóc môn, hồ chí minh, vietnam', '', 'Chùa phật', '06:00:00', '20:00:00', 'văn hoá', 8.60, '', '/images/diadiem112/hinhanh1.jpg', '/images/diadiem112/hinhanh2.jpg', '/images/diadiem112/hinhanh3.jpg', 11, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d20774.871747662353!2d106.6014636!3d10.868814!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b18d080b61d%3A0xb03e812fcea26393!2zQ2jDuWEgVGhpw6puIFF1YW5nIChUaGnDqm4gUXVhbmcgVOG7sSk!5e1!3m2!1sen!2s!4v1728991074872!5m2!1sen!2s', 73, 6, '2020-02-02 00:00:00', NULL, NULL, NULL, NULL, NULL),
(114, 'Van Hanh Buddhist Temple', '91/7 trung mỹ tây 5, trung mỹ tây, hóc môn, hồ chí minh, vietnam', '', 'Chùa phật', '07:00:00', '21:00:00', 'văn hoá', 8.70, '', '/images/diadiem113/hinhanh1.jpg', '/images/diadiem113/hinhanh2.jpg', '/images/diadiem113/hinhanh3.jpg', 11, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d20775.10019669418!2d106.6011054!3d10.8655321!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a13fd439535%3A0xeeb29c89931e4c83!2sVan%20Hanh%20Buddhist%20Temple!5e1!3m2!1sen!2s!4v1728991217045!5m2!1sen!2s', 100, 37, '2023-11-21 00:00:00', NULL, NULL, NULL, NULL, NULL),
(115, 'Nhà Truyền Thống xã Bà Điểm', '45 phan văn hớn, bà điểm, hóc môn, hồ chí minh, vietnam', '', 'Nhà truyền thống, di tích lịch sử', '08:00:00', '16:00:00', 'văn hoá', 8.00, '', '/images/diadiem114/hinhanh1.jpg', '/images/diadiem114/hinhanh2.jpg', '/images/diadiem114/hinhanh3.jpg', 12, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d332431.7953680832!2d106.5030537!3d10.8383857!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a4daaaaaaab%3A0xeb8a18294e5e06a1!2zTmjDoCBUcnV54buBbiBUaOG7kW5nIHjDoyBCw6AgxJBp4buDbQ!5e1!3m2!1sen!2s!4v1728991239343!5m2!1sen!2s', 77, 3, '2016-08-31 00:00:00', NULL, NULL, NULL, NULL, NULL),
(116, 'Nguyen An Ninh Memorial', 'vj47+m3x, nguyễn an ninh, trung mỹ tây, quận 12, hồ chí minh, vietnam', '', 'Nhà truyền thống, di tích lịch sử', '09:00:00', '17:00:00', 'văn hoá', 8.00, '', '/images/diadiem115/hinhanh1.jpg', '/images/diadiem115/hinhanh2.jpg', '/images/diadiem115/hinhanh3.jpg', 12, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d5193.927876615201!2d106.6101635!3d10.8567452!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a3dcac6b029%3A0x64b034cffd859f2b!2sNguyen%20An%20Ninh%20Memorial!5e1!3m2!1sen!2s!4v1728991255652!5m2!1sen!2s', 86, 50, '2022-03-06 00:00:00', NULL, NULL, NULL, NULL, NULL),
(117, 'California Hotel', '45 đường nhà vuông, trung chánh, hóc môn, hồ chí minh, vietnam', '0938309498', 'Nghỉ ngơi-Khách sạn', '00:00:00', '23:59:00', 'ngủ nghỉ', 9.00, '465000đ', '/images/diadiem116/hinhanh1.jpg', '/images/diadiem116/hinhanh2.jpg', '/images/diadiem116/hinhanh3.jpg', 10, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5193.826707514743!2d106.60128527614283!3d10.86255398929154!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a6b4bde9cd9%3A0x5af11eae0594ed48!2sCalifornia%20Hotel!5e1!3m2!1sen!2s!4v1728991304900!5m2!1sen!2s', 100, 9, '2018-05-17 00:00:00', NULL, NULL, NULL, NULL, NULL),
(118, 'Công viên du lịch sinh thái Hóc Môn', '106 xuân thới thượng, 6, hóc môn, hồ chí minh, việt nam', '0932162182', 'Công viên công cộng', '00:00:00', '23:59:00', 'vui chơi du lịch', 4.30, '0đ', '/images/diadiem117/hinhanh1.jpg', '/images/diadiem117/hinhanh2.jpg', '/images/diadiem117/hinhanh3.jpg', 363, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d18212.527257568803!2d106.5904164!3d10.8498586!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bc1df649201%3A0x481db1e94e761443!2sHoc%20Mon%20Eco-tourism%20Park!5e1!3m2!1sen!2s!4v1728991270759!5m2!1sen!2s', 92, 42, '2018-03-07 00:00:00', NULL, NULL, NULL, NULL, NULL),
(119, 'Citizone Trung Mỹ', '40 đ. trung mỹ - tân xuân, trung mỹ tây, hóc môn, hồ chí minh, việt nam', '0926632448', 'Quán coffee đậm chất thật', '08:00:00', '22:00:00', 'ăn uống', 4.40, '1-100.000 ₫', '/images/diadiem118/hinhanh1.jpg', '/images/diadiem118/hinhanh2.jpg', '/images/diadiem118/hinhanh3.jpg', 152, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d10387.461304864933!2d106.6102042!3d10.8680834!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bb40955d98d%3A0x79b328fa317bfd9b!2sCitizone%20Coffee%20Trung%20M%E1%BB%B9!5e1!3m2!1sen!2s!4v1728991342485!5m2!1sen!2s', 58, 32, '2019-10-11 00:00:00', NULL, NULL, NULL, NULL, NULL),
(120, 'Quán Hải Sản Cô Chủ Nhỏ', '6/7b đ. tân xuân 2, tân xuân, hóc môn, hồ chí minh, việt nam', '02862511566', 'Quán bình dan, giá cả hssv', '10:00:00', '22:00:00', 'ăn uống', 3.90, '1-200.000đ', '/images/diadiem119/hinhanh1.jpg', '/images/diadiem119/hinhanh2.jpg', '/images/diadiem119/hinhanh3.jpg', 576, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d20774.19622076722!2d106.5959098!3d10.8785129!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a0b28509e53%3A0x74c59ca3d440eb9b!2zUXXDoW4gSOG6o2kgU-G6o24gQ8O0IENo4bunIE5o4buP!5e1!3m2!1sen!2s!4v1728991361193!5m2!1sen!2s', 1318, 36, '2019-07-04 00:00:00', NULL, NULL, NULL, NULL, NULL),
(121, 'Mì Quảng, Cao Lầu Gánh Hội An', 'tổ 139 11/1b đ. tô ký, âp tam đông, hóc môn, hồ chí minh, việt nam', '0903362410', 'Quán cao lầu, mì quảng gốc hội an', '06:00:00', '21:00:00', 'ăn uống', 4.80, '1-100.000 ₫', '/images/diadiem120/hinhanh1.jpg', '/images/diadiem120/hinhanh2.jpg', '/images/diadiem120/hinhanh3.jpg', 50, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d20773.921386372578!2d106.5978104!3d10.8824564!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bc587b1f3a7%3A0x63a4363e3c8e9908!2zTcOsIFF14bqjbmcsIENhbyBM4bqndSBHw6FuaCBI4buZaSBBbg!5e1!3m2!1sen!2s!4v1728991383355!5m2!1sen!2s', 68, 38, '2022-03-14 00:00:00', NULL, NULL, NULL, NULL, NULL),
(122, 'Buffet Ba Chàng Trai', '97 nguyễn hữu cầu, trung chánh, hóc môn, hồ chí minh 70000, việt nam', '0984693090', 'Quán buffet sạch', '10:00:00', '22:00:00', 'ăn uống', 4.50, '200-300 N ₫', '/images/diadiem121/hinhanh1.jpg', '/images/diadiem121/hinhanh2.jpg', '/images/diadiem121/hinhanh3.jpg', 287, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d20774.798149715083!2d106.6038543!3d10.8698711!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bbc5821c4a9%3A0xfb66ed1a1ae3425b!2sBuffet%20Ba%20Ch%C3%A0ng%20Trai!5e1!3m2!1sen!2s!4v1728991466795!5m2!1sen!2s', 63, 38, '2018-10-20 00:00:00', NULL, NULL, NULL, NULL, NULL),
(124, 'Thọ Ký Mỳ Gia', '127/1a đ lê lợi, tt. hóc môn, hóc môn, hồ chí minh, việt nam', '0937921714', 'quán hủ tiếu mì đa dạng', '06:00:00', '21:00:00', 'ăn uống', 4.20, '1-100.000 ₫', '/images/diadiem123/hinhanh1.jpg', '/images/diadiem123/hinhanh2.jpg', '/images/diadiem123/hinhanh3.jpg', 102, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d20773.22639418313!2d106.5786385!3d10.8924223!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174d5d1962ac5e1%3A0x12bcd6f4435a2bce!2zVGjhu40gS8O9IE3hu7MgR2lh!5e1!3m2!1sen!2s!4v1728991547779!5m2!1sen!2s', 72, 19, '2019-12-30 00:00:00', NULL, NULL, NULL, NULL, NULL),
(125, 'MisterTom coffee sân vườn| cà phê sân vườn Hóc-Môn | cà phê Đặng Thúc Vịnh', '337 đường nguyễn thị ngâu, thới tam thôn, hóc môn, hồ chí minh, việt nam', '', 'coffee sân vườn', '00:01:00', '23:59:00', 'ăn uống', 4.90, '1-100.000 ₫', '/images/diadiem124/hinhanh1.jpg', '/images/diadiem124/hinhanh2.jpg', '/images/diadiem124/hinhanh3.jpg', 27, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d20772.758363033303!2d106.6008747!3d10.8991286!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174d5430a6fb361%3A0x4b49c4fcc7a158d5!2zTWlzdGVyVG9tIGNvZmZlZSBzw6JuIHbGsOG7nW58IGPDoCBwaMOqIHPDom4gdsaw4budbiBIw7NjLU3DtG4gfCBjw6AgcGjDqiDEkOG6t25nIFRow7pjIFbhu4tuaA!5e1!3m2!1sen!2s!4v1728991567111!5m2!1sen!2s', 72, 27, '2023-03-26 00:00:00', NULL, NULL, NULL, NULL, NULL),
(126, 'Khách Sạn Hòa Bình', '640 đ. huỳnh thị hai, khu phố 8, quận 12, hồ chí minh, việt nam', '02862592183', 'Nghỉ ngơi-Khách sạn', '00:00:00', '23:59:00', 'ngủ nghỉ', 4.20, '310.000đ', '/images/diadiem125/hinhanh1.jpg', '/images/diadiem125/hinhanh2.jpg', '/images/diadiem125/hinhanh3.jpg', 121, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d83098.83347554812!2d106.5790534!3d10.8711605!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a052078eebd%3A0x489ec73d9aa071f1!2zS2jDoWNoIFPhuqFuIEjDsmEgQsOsbmg!5e1!3m2!1sen!2s!4v1728991590553!5m2!1sen!2s', 96, 33, '2022-06-30 00:00:00', NULL, NULL, NULL, NULL, NULL),
(127, 'Khu Nghỉ Dưỡng Villa H2O', '4c đ. đặng thúc vịnh, ấp 3, hóc môn, hồ chí minh, việt nam', '09832732233', 'Khu nghỉ ngơi chất lượng', '00:00:00', '23:59:00', 'vui chơi du lịch', 3.90, '200-300 N ₫', '/images/diadiem126/hinhanh1.jpg', '/images/diadiem126/hinhanh2.jpg', '/images/diadiem126/hinhanh3.jpg', 728, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d83085.89686867723!2d106.6109928!3d10.9175079!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174d674d489f6a3%3A0x325ef69ca88bfcfd!2zS2h1IE5naOG7iSBExrDhu6FuZyBWaWxsYSBIMk8!5e1!3m2!1sen!2s!4v1728991625108!5m2!1sen!2s', 61, 36, '2017-12-12 00:00:00', NULL, NULL, NULL, NULL, NULL),
(128, 'Chùa Hoằng Pháp', '96 ấp tân thới 3, tân hiệp, hóc môn, hồ chí minh, việt nam', '02837130002', 'Chùa phật', '05:00:00', '22:00:00', 'văn hoá', 4.70, '0đ', '/images/diadiem127/hinhanh1.jpg', '/images/diadiem127/hinhanh2.jpg', '/images/diadiem127/hinhanh3.jpg', 10495, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d166167.59768417472!2d106.5330127!3d10.9250061!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174d575f67f9c1d%3A0xc8ce7b82c763b792!2sHoang%20Phap%20Buddhist%20Temple!5e1!3m2!1sen!2s!4v1728991650947!5m2!1sen!2s', 68, 30, '2023-12-05 00:00:00', NULL, NULL, NULL, NULL, NULL),
(129, 'Mì Cay 68', 'tán kế, phường 3, thành phố bến tre, bến tre', '', 'Ăn uống', '09:00:00', '21:00:00', 'ăn uống', 5.80, '35.000đ - 50.000đ', '/images/diadiem128/hinhanh1.jpg', '/images/diadiem128/hinhanh2.jpg', '/images/diadiem128/hinhanh3.jpg', 7, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4263.712823335159!2d106.3699290753926!3d10.237637289880231!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x310aa9cafb7692a9%3A0x92a57ecc9c16cfc0!2sM%C3%AC%20Cay%2068!5e1!3m2!1svi!2s!4v1729003273191!5m2!1svi!2s', 58, 7, '2023-04-12 00:00:00', NULL, NULL, NULL, NULL, NULL),
(130, 'Việt - Úc Hotel', '144 hùng vương, phường 3, thành phố bến tre, bến tre', '', 'Khách sạn-gia đình', '00:00:00', '23:59:00', 'ngủ nghỉ', 7.10, '500.000đ - 2.500.000đ', '/images/diadiem129/hinhanh1.jpg', '/images/diadiem129/hinhanh2.jpg', '/images/diadiem129/hinhanh3.jpg', 27, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4263.752582485726!2d106.37320577563219!3d10.234678595132603!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x310aa85c4c81ffe3%3A0x960f9eb975303448!2zS2jDoWNoIFPhuqFuIFZp4buHdC3DmmM!5e1!3m2!1svi!2s!4v1729003174726!5m2!1svi!2s', 87, 43, '2019-10-11 00:00:00', NULL, NULL, NULL, NULL, NULL),
(131, 'Khu Du Lịch Sinh Thái Déjà Vu Huỳnh Kha', 'dương duy khương, phường 4, thành phố trà vinh, trà vinh', '', 'Tham quan,ăn uống, chụp ảnh', '06:00:00', '23:59:00', 'ăn uống', 7.80, '0.000đ - 350.000đ', '/images/diadiem130/hinhanh1.jpg', '/images/diadiem130/hinhanh2.jpg', '/images/diadiem130/hinhanh3.jpg', 14, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2133.730177482135!2d106.34533623868383!3d9.954940297537046!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a01a09dd859e93%3A0xba8b1f0b5ca2d8fd!2zS2h1IGR1IGzhu4tjaCBzaW5oIHRow6FpIETDqWrDoCBWdSBIdeG7s25oIEtoYSwgQuG6oWNoIMSQ4bqxbmcsIExvbmcgxJDhu6ljLCBUcsOgIFZpbmgsIFZp4buHdCBOYW0!5e1!3m2!1svi!2s!4v1729003227633!5m2!1svi!2s', 59, 5, '2021-11-18 00:00:00', NULL, NULL, NULL, NULL, NULL),
(132, 'YMF Nama Chocolate', '542b kiên thị nhẫn, phường 7, thành phố trà vinh, trà vinh', '', 'Quán ăn - Món Việt', '07:00:00', '18:00:00', 'ăn uống', 8.50, '10.000đ - 150.000đ', '/images/diadiem131/hinhanh1.jpg', '/images/diadiem131/hinhanh2.jpg', '/images/diadiem131/hinhanh3.jpg', 2, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d908.3292320002595!2d106.33837803754074!3d9.932869038721018!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a01751045a8d15%3A0x393f666b35ec528b!2zNTQyQiBLacOqbiBUaOG7iyBOaOG6q24sIGtow7NtIDMsIFRyw6AgVmluaCwgODcwMDAwLCBWaWV0bmFt!5e1!3m2!1sen!2s!4v1728884252178!5m2!1sen!2s', 85, 48, '2016-05-28 00:00:00', NULL, NULL, NULL, NULL, NULL),
(133, 'Cửu Long Hotel', '1 đường 1 tháng 5, phường 1, thành phố vĩnh long, vĩnh long', '', 'Khách sạn-gia đình', '00:00:00', '23:59:00', 'ngủ nghỉ', 8.60, '150.000đ - 200.000đ', '/images/diadiem132/hinhanh1.jpg', '/images/diadiem132/hinhanh2.jpg', '/images/diadiem132/hinhanh3.jpg', 2, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3731.7871159565043!2d105.97267309999998!3d10.257983299999994!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x310a9d86bec8e4d1%3A0x1313b3951191c206!2sC%E1%BB%ADu%20Long%20A%20hotel%20(V%C4%A9nh%20Long%20market)!5e1!3m2!1sen!2s!4v1728884493291!5m2!1sen!2s', 96, 33, '2018-01-23 00:00:00', NULL, NULL, NULL, NULL, NULL),
(134, 'Trọng Đạt - Phố Nướng Hải Sản', '126/35a hưng đạo vương, phường 4, thành phố vĩnh long, vĩnh long', '', 'Ăn uống', '08:00:00', '23:30:00', 'ăn uống', 6.50, '35.000đ - 110.000đ', '/images/diadiem133/hinhanh1.jpg', '/images/diadiem133/hinhanh2.jpg', '/images/diadiem133/hinhanh3.jpg', 6, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4263.583588891032!2d105.97608177539269!3d10.24724848987115!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x310a9dd04e7841c9%3A0xa5c4d791d8433ab2!2zTmjDoCBow6BuZyBUcuG7jW5nIMSQ4bqhdA!5e1!3m2!1svi!2s!4v1729003110929!5m2!1svi!2s', 74, 21, '2016-04-02 00:00:00', NULL, NULL, NULL, NULL, NULL),
(136, 'Kichi Kichi Lẩu Băng Chuyền - Vincom Cao Lãnh', 'tầng 5, lô l5 - 03 vincom cao lãnh, đường 30 tháng 4, phường 1, thành phố cao lãnh, đồng tháp', '', 'Ăn uống', '10:00:00', '22:00:00', 'ăn uống', 9.80, '150.000đ - 300.000đ', '/images/diadiem135/hinhanh1.jpg', '/images/diadiem135/hinhanh2.jpg', '/images/diadiem135/hinhanh3.jpg', 40, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4260.746562010357!2d105.63114167539551!3d10.456037189673943!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x310a65f978ab9755%3A0xd512863278ab0bca!2sKichi%20Kichi%20Vincom%20Cao%20L%C3%A3nh!5e1!3m2!1svi!2s!4v1729002875397!5m2!1svi!2s', 88, 26, '2017-02-19 00:00:00', NULL, NULL, NULL, NULL, NULL),
(137, 'Chợ Nổi Long Xuyên', 'nguyễn bỉnh khiêm, thành phố long xuyên, an giang', '', 'Mua sắm', '05:00:00', '17:00:00', 'Mua sắm', 8.00, '10.000đ - 200.000đ', '/images/diadiem136/hinhanh1.jpg', '/images/diadiem136/hinhanh2.jpg', '/images/diadiem136/hinhanh3.jpg', 1, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4261.725785336227!2d105.44158377539459!3d10.384441289741488!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x310a7327d4cc1d21%3A0x3ec5e9a806e6735!2zQ2jhu6MgTuG7lWkgTG9uZyBYdXnDqm4!5e1!3m2!1svi!2s!4v1729002766297!5m2!1svi!2s', 95, 49, '2018-10-13 00:00:00', NULL, NULL, NULL, NULL, NULL),
(138, 'Karaoke Katina', '61 võ thị sáu, phường mỹ xuyên, thành phố long xuyên, an giang', '', 'Giải trí, karaoke', '09:00:00', '23:59:00', 'vui chơi du lịch', 8.00, '100.000đ - 200.000đ', '/images/diadiem137/hinhanh1.jpg', '/images/diadiem137/hinhanh2.jpg', '/images/diadiem137/hinhanh3.jpg', 1, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4261.826797519578!2d105.43529187539446!3d10.377027989748566!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x310a72e241e5b4a3%3A0xd1ff72cb4dcab965!2sKaraoke%20Katina%201!5e1!3m2!1svi!2s!4v1729002718432!5m2!1svi!2s', 59, 41, '2017-08-29 00:00:00', NULL, NULL, NULL, NULL, NULL),
(139, 'Sea Light Hotel', 'a11 đường 3 tháng 2, thành phố rạch giá, tỉnh kiên giang', '', 'Khách sạn-gia đình', '00:00:00', '23:59:00', 'ngủ nghỉ', 6.80, '300.000đ - 700.000đ', '/images/diadiem138/hinhanh1.jpg', '/images/diadiem138/hinhanh2.jpg', '/images/diadiem138/hinhanh3.jpg', 35, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4266.83687455308!2d105.0791670753898!3d10.00252119010304!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a0b380574b973f%3A0x4f79981b3f88fef3!2zS2jDoWNoIHPhuqFuIFNlYSBMaWdodA!5e1!3m2!1svi!2s!4v1729002691460!5m2!1svi!2s', 61, 22, '2024-10-16 00:00:00', NULL, NULL, NULL, NULL, NULL),
(140, 'Gỏi Cá Trích Cây Bàng - Quốc Lộ 80', '273 quốc lộ 80, thị xã hà tiên, kiên giang', '', 'Ăn uống', '11:00:00', '22:00:00', 'ăn uống', 7.80, '30.000đ - 200.000đ', '/images/diadiem139/hinhanh1.jpg', '/images/diadiem139/hinhanh2.jpg', '/images/diadiem139/hinhanh3.jpg', 7, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4262.160009426911!2d104.5095078753941!3d10.352536289771622!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3109d91346b624e3%3A0x3c4d4a1d1722964!2zUXXDoW4gSOG7k25nIEjhuqNpIChDw6J5IELDoG5nKSBH4buPaSBDw6EgVHLDrWNo!5e1!3m2!1svi!2s!4v1729002635777!5m2!1svi!2s', 81, 15, '2019-08-18 00:00:00', NULL, NULL, NULL, NULL, NULL),
(141, 'Nhà Thờ Giáo Xứ Châu Nam', 'vhvh+8jm, tân thới nhì, hóc môn, hồ chí minh, việt nam', '0837131191', 'nhà thờ', '06:00:00', '21:00:00', 'văn hoá', 4.40, '0đ', '/images/diadiem140/hinhanh1.jpg', '/images/diadiem140/hinhanh2.jpg', '/images/diadiem140/hinhanh3.jpg', 143, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d17018.48445930552!2d106.5790373!3d10.893344!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174d579cea13e77%3A0x71e971167a3af144!2zTmjDoCBUaOG7nSBHacOhbyBY4bupIENow6J1IE5hbQ!5e1!3m2!1svi!2s!4v1729002559720!5m2!1svi!2s', 68, 32, '2016-08-11 00:00:00', NULL, NULL, NULL, NULL, NULL),
(142, 'Ngã ba Giồng', 'xuân thới thượng, hóc môn, hồ chí minh, việt nam', '', 'di tích lịch sử', '06:00:00', '21:00:00', 'văn hoá', 4.70, '0đ', '/images/diadiem141/hinhanh1.jpg', '/images/diadiem141/hinhanh2.jpg', '/images/diadiem141/hinhanh3.jpg', 58, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d17019.912778776667!2d106.5611447!3d10.8683288!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a967cd383fb%3A0x4ffaa71b89834c12!2zTmfDoyBiYSBHaeG7k25n!5e1!3m2!1svi!2s!4v1729002537287!5m2!1svi!2s', 98, 30, '2017-01-02 00:00:00', NULL, NULL, NULL, NULL, NULL),
(144, 'Công viên Đá Nhật - RinRin Park', '87/8p xuân thới thượng, 6 ấp xuân thới đông, xuan thoi dong 1, hóc môn, hồ chí minh 700000, việt nam', '', 'công viên công cộng', '07:00:00', '21:00:00', 'vui chơi du lịch', 4.20, '50.000đ', '/images/diadiem143/hinhanh1.jpg', '/images/diadiem143/hinhanh2.jpg', '/images/diadiem143/hinhanh3.jpg', 4574, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4255.120985018759!2d106.5851991!3d10.8583097!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a5e4b0812d7%3A0x5ee92f29dd74db3a!2zQ8O0bmcgdmnDqm4gxJDDoSBOaOG6rXQgLSBSaW5SaW4gUGFyaw!5e1!3m2!1svi!2s!4v1729002470649!5m2!1svi!2s', 70, 11, '2020-02-19 00:00:00', NULL, NULL, NULL, NULL, NULL),
(145, 'Quán Cà phê Trung Nguyên E-Coffee', '16/8, mỹ huề, hóc môn, hồ chí minh, việt nam', '0909949294', 'Quán coffee đậm chất thật', '06:00:00', '21:00:00', 'ăn uống', 4.40, '1-100.000 ₫', '/images/diadiem144/hinhanh1.jpg', '/images/diadiem144/hinhanh2.jpg', '/images/diadiem144/hinhanh3.jpg', 58, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d34039.692081316796!2d106.5925919!3d10.8694989!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bab71b440ed%3A0x197522593b38d454!2zUXXDoW4gQ8OgIHBow6ogVHJ1bmcgTmd1ecOqbiBFLUNvZmZlZQ!5e1!3m2!1svi!2s!4v1729002443764!5m2!1svi!2s', 1291, 15, '2018-03-28 00:00:00', NULL, NULL, NULL, NULL, NULL),
(146, 'Pro Farm', '6/6f tân hiệp 9, ấp thới tây, hóc môn, hồ chí minh, việt nam', '0943172413', 'khu vui chơi thư giản', '06:00:00', '21:00:00', 'vui chơi du lịch', 4.80, '0đ', '/images/diadiem145/hinhanh1.jpg', '/images/diadiem145/hinhanh2.jpg', '/images/diadiem145/hinhanh3.jpg', 342, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d34034.39806465068!2d106.5769825!3d10.9158082!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529737608345b%3A0x4ec9c57f7924441d!2sPro%20Farm!5e1!3m2!1svi!2s!4v1729002419502!5m2!1svi!2s', 54, 8, '2023-08-16 00:00:00', NULL, NULL, NULL, NULL, NULL),
(147, 'Net 269', '1079 đ. nguyễn ảnh thủ, tân chánh hiệp, quận 12, hồ chí minh, việt nam', '0909949223', 'Giải trí-Game', '00:00:00', '23:59:00', 'vui chơi du lịch', 7.10, '10.000-20.000đ', '/images/diadiem146/hinhanh1.jpg', '/images/diadiem146/hinhanh2.jpg', '/images/diadiem146/hinhanh3.jpg', 44, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d2127.484825442668!2d106.6152059!3d10.868928!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b96d8eb3941%3A0x5ff5b40b7ee68498!2sNet%20269!5e1!3m2!1svi!2s!4v1729002402778!5m2!1svi!2s', 61, 5, '2020-11-22 00:00:00', NULL, NULL, NULL, NULL, NULL),
(148, 'Mì Cay Oyasu', '1089c đ. nguyễn ảnh thủ, tân chánh hiệp, quận 12, hồ chí minh 71506, việt nam', '0908585134', 'Ăn uống-Mỳ cay', '09:00:00', '22:30:00', 'ăn uống', 3.90, '1-100.000 ₫', '/images/diadiem147/hinhanh1.jpg', '/images/diadiem147/hinhanh2.jpg', '/images/diadiem147/hinhanh3.jpg', 20, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d531.8722791489481!2d106.6165538!3d10.8683261!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a1073e76113%3A0xdf9d311140bd7fde!2sM%C3%AC%20Cay%20Oyasu!5e1!3m2!1svi!2s!4v1729002353542!5m2!1svi!2s', 92, 8, '2017-08-04 00:00:00', NULL, NULL, NULL, NULL, NULL),
(149, 'Gà Rán Mr Boy', '333 đ. nguyễn ảnh thủ, tân chánh hiệp, quận 12, hồ chí minh, việt nam', '0961569300', 'Ăn uống-Gà rán', '08:00:00', '22:00:00', 'ăn uống', 8.00, '50.000đ - 120.000đ', '/images/diadiem148/hinhanh1.jpg', '/images/diadiem148/hinhanh2.jpg', '/images/diadiem148/hinhanh3.jpg', 11, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d531.8703074832276!2d106.6176373!3d10.8694323!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b93ab7bbd19%3A0xbbae2038162d3f!2zR2HMgCBSYcyBbiBNciBCb3k!5e1!3m2!1svi!2s!4v1729002294477!5m2!1svi!2s', 75, 39, '2018-02-14 00:00:00', NULL, NULL, NULL, NULL, NULL),
(150, 'Quán Lẩu Bò Bình An', '7 đ. nguyễn ảnh thủ, tân chánh hiệp, quận 12, hồ chí minh, việt nam', '0935345444', 'Ăn uống-Lẩu', '16:00:00', '22:00:00', 'ăn uống', 4.90, '200.000-300.000 đ', '/images/diadiem149/hinhanh1.jpg', '/images/diadiem149/hinhanh2.jpg', '/images/diadiem149/hinhanh3.jpg', 5, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d531.8696041091879!2d106.617707!3d10.8698269!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a1ab26ee12b%3A0x3aa0e81cbd11203e!2zUXXDoW4gTOG6qXUgQsOyIELDrG5oIEFu!5e1!3m2!1svi!2s!4v1729002321981!5m2!1svi!2s', 100, 37, '2021-10-31 00:00:00', NULL, NULL, NULL, NULL, NULL),
(151, 'CHÙA TRẤN LONG HUỆ', '36/13, tổ 164 đ. thới tam thôn 17, hóc môn, hồ chí minh, việt nam', '0903787838', 'Chùa phật', '05:00:00', '22:00:00', 'văn hoá', 8.60, '0đ', '/images/diadiem150/hinhanh1.jpg', '/images/diadiem150/hinhanh2.jpg', '/images/diadiem150/hinhanh3.jpg', 56, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d8509.78903782649!2d106.6086915!3d10.8741958!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b7323fcad0f%3A0xe1ad2b904555be0!2zQ0jDmUEgVFLhuqROIExPTkcgSFXhu4Y!5e1!3m2!1svi!2s!4v1729002201505!5m2!1svi!2s', 72, 47, '2021-02-13 00:00:00', NULL, NULL, NULL, NULL, NULL),
(152, 'Chùa Nam Tông - Sư Tuệ Kỳ - Q12', '5/2/61 tổ 49 kp4, tân chánh hiệp, quận 12, hồ chí minh, việt nam', '0909949243', 'Chùa phật', '05:00:00', '21:00:00', 'văn hoá', 7.10, '0đ', '/images/diadiem151/hinhanh1.jpg', '/images/diadiem151/hinhanh2.jpg', '/images/diadiem151/hinhanh3.jpg', 15, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4254.935448176856!2d106.6233487!3d10.8713264!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b80358a9b79%3A0xc1513f9804e42b7d!2zQ2jDuWEgTmFtIFTDtG5nIC0gU8awIFR14buHIEvhu7MgLSBRMTI!5e1!3m2!1svi!2s!4v1729002173637!5m2!1svi!2s', 61, 2, '2024-02-07 00:00:00', NULL, NULL, NULL, NULL, NULL),
(153, 'Nhà Thờ Đức Mẹ Nữ Vương Hòa Bình', '62/3 đ. lê đức thọ, phường 13, gò vấp, hồ chí minh, việt nam', '0283894737', 'Nhà thờ đức mẹ', '07:00:00', '22:00:00', 'văn hoá', 8.80, '0đ', '/images/diadiem152/hinhanh1.jpg', '/images/diadiem152/hinhanh2.jpg', '/images/diadiem152/hinhanh3.jpg', 23, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d34039.772127696655!2d106.6127657!3d10.8687972!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529c075a383f3%3A0x77259cee4efeeb29!2zTmjDoCBUaOG7nSDEkOG7qWMgTeG6uSBO4buvIFbGsMahbmcgSMOyYSBCw6xuaA!5e1!3m2!1svi!2s!4v1729002139217!5m2!1svi!2s', 90, 45, '2023-06-23 00:00:00', NULL, NULL, NULL, NULL, NULL),
(154, 'Khách Sạn Quỳnh Hoa', '80b ht23, p, quận 12, hồ chí minh, việt nam', '0859320210', 'Nghỉ ngơi-Khách sạn', '00:00:00', '23:59:00', 'ngủ nghỉ', 4.70, '200.000đ - 500.000đ', '/images/diadiem153/hinhanh1.jpg', '/images/diadiem153/hinhanh2.jpg', '/images/diadiem153/hinhanh3.jpg', 14, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4254.855038754298!2d106.6410532!3d10.8769629!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529e24fbfe575%3A0x4d2e98436f24c24b!2zS2jDoWNoIFPhuqFuIFF14buzbmggSG9h!5e1!3m2!1svi!2s!4v1729002095196!5m2!1svi!2s', 65, 41, '2020-03-27 00:00:00', NULL, NULL, NULL, NULL, NULL),
(155, 'Khách Sạn Bích Thu', '204 đường hiệp thành 17, hiệp thành, quận 12, hồ chí minh 70780, việt nam', '0283717212', 'Nghỉ ngơi-Khách sạn', '00:00:00', '23:59:00', 'ngủ nghỉ', 7.10, '300.000đ - 500.000đ', '/images/diadiem154/hinhanh1.jpg', '/images/diadiem154/hinhanh2.jpg', '/images/diadiem154/hinhanh3.jpg', 15, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4254.833594520048!2d106.6428833!3d10.8784656!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752915f565770f%3A0xd3e79d8c1f093d84!2zS2jDoWNoIFPhuqFuIELDrWNoIFRodQ!5e1!3m2!1svi!2s!4v1729002084294!5m2!1svi!2s', 55, 46, '2023-08-04 00:00:00', NULL, NULL, NULL, NULL, NULL),
(156, 'Công Viên Lê Thị Riêng Quận 12', '7 đ. lê thị riêng, thới an, quận 12, hồ chí minh, việt nam', '0283717232', 'công viên công cộng', '00:00:00', '23:59:00', 'vui chơi du lịch', 8.80, '200.000đ - 500.000đ', '/images/diadiem155/hinhanh1.jpg', '/images/diadiem155/hinhanh2.jpg', '/images/diadiem155/hinhanh3.jpg', 46, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d2127.511472563402!2d106.6523253!3d10.8651898!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529244d7deb89%3A0x934060c9e781eda8!2zQ8O0bmcgVmnDqm4gTMOqIFRo4buLIFJpw6puZyBRdeG6rW4gMTI!5e1!3m2!1svi!2s!4v1729001979210!5m2!1svi!2s', 82, 16, '2023-07-26 00:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `dia_diem` (`id`, `ten_dia_diem`, `dia_chi`, `so_dien_thoai`, `mo_ta`, `gio_mo_cua`, `gio_dong_cua`, `loai_hinh`, `diem_trung_binh`, `gia_ca_giao_dong`, `hinh_anh1`, `hinh_anh2`, `hinh_anh3`, `so_luot_danh_gia`, `link_dia_diem`, `so_luot_tk`, `id_nguoi_dang`, `ngay_dang`, `hinh_anh4`, `hinh_anh5`, `hinh_anh6`, `hinh_anh7`, `nguoi_tao_id`) VALUES
(157, 'Royal Center', '180/4 đ. song hành, trung chánh, hóc môn, hồ chí minh, việt nam', '02862534006', 'Nhà hàng lớn nhất q12. Vị tri ok. Chất lượng thức ăn và dich vụ tốt.', '08:00:00', '22:00:00', 'ăn uống', 7.10, '200.000đ - 500.000đ', '/images/diadiem156/hinhanh1.jpg', '/images/diadiem156/hinhanh2.jpg', '/images/diadiem156/hinhanh3.jpg', 43, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d2127.5584931534277!2d106.6067538!3d10.8585904!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bfccf85d229%3A0x59227f0f88a603c0!2zVHJ1bmcgVMOibSBI4buZaSBOZ2jhu4sgVGnhu4djIEPGsOG7m2kgUm95YWwgQ2VudGVy!5e1!3m2!1svi!2s!4v1729001865118!5m2!1svi!2s', 92, 47, '2022-03-22 00:00:00', NULL, NULL, NULL, NULL, NULL),
(158, 'Nhà Hàng Ẩm Thực 6 Hòn', '100 tp. hcm, đ. song hành, trung chánh, hóc môn, hồ chí minh, việt nam', '0964545479', 'nhà hàng', '08:00:00', '22:00:00', 'ăn uống', 8.80, '200.000đ - 500.000đ', '/images/diadiem157/hinhanh1.jpg', '/images/diadiem157/hinhanh2.jpg', '/images/diadiem157/hinhanh3.jpg', 22, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4255.021184718768!2d106.6024487!3d10.8653133!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a6b8066b853%3A0xf20f23731d2eb2f1!2zTmjDoCBIw6BuZyDhuqhtIFRo4buxYyA2IEjDsm4!5e1!3m2!1svi!2s!4v1729001809694!5m2!1svi!2s', 65, 27, '2024-05-31 00:00:00', NULL, NULL, NULL, NULL, NULL),
(159, 'Buffet Ba Chàng Trai', '97 nguyễn hữu cầu, trung chánh, hóc môn, hồ chí minh 70000, việt nam', '0984693090', 'nhà hàng món nướng', '08:00:00', '22:00:00', 'ăn uống', 7.20, '300.000đ - 500.000đ', '/images/diadiem158/hinhanh1.jpg', '/images/diadiem158/hinhanh2.jpg', '/images/diadiem158/hinhanh3.jpg', 1, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4254.956202569347!2d106.614154!3d10.8698711!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m', 51, 46, '2021-09-25 00:00:00', NULL, NULL, NULL, NULL, NULL),
(160, 'Lẩu Bò A Thụy', 'ngã tư, tân xuân 6 đ. song hành, ql22, hóc môn, hồ chí minh, việt nam', '0938818055', 'nhà hàng món lẩu', '16:00:00', '02:00:00', 'ăn uống', 7.20, '200.000đ - 500.000đ', '/images/diadiem159/hinhanh1.jpg', '/images/diadiem159/hinhanh2.jpg', '/images/diadiem159/hinhanh3.jpg', 5, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1063.7483379913513!2d106.6016089!3d10.8672657!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a1551d7989f%3A0x9167ace458402dd!2zTOG6qXUgQsOyIEEgVGjhu6V5!5e1!3m2!1svi!2s!4v1729001696459!5m2!1svi!2s', 61, 10, '2019-06-03 00:00:00', NULL, NULL, NULL, NULL, NULL),
(161, 'Sân cầu lông K Sport', '38/2a ấp mỹ hòa 1, trung chánh, hóc môn, hồ chí minh 700000, việt nam', '0876977633', 'sân cầu lông', '08:00:00', '22:00:00', 'vui chơi du lịch', 7.20, '50.000đ - 120.000đ', '/images/diadiem160/hinhanh1.jpg', '/images/diadiem160/hinhanh2.jpg', '/images/diadiem160/hinhanh3.jpg', 2, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4255.068620446228!2d106.6043137!3d10.861985!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752be4b91a2ab1%3A0x180013becf35f3ff!2zU8OibiBj4bqndSBsw7RuZyBLIFNwb3J0!5e1!3m2!1svi!2s!4v1729001667998!5m2!1svi!2s', 53, 22, '2024-09-28 00:00:00', NULL, NULL, NULL, NULL, NULL),
(162, 'Chùa Địa Tạng', '108/5b ql22, ấp mỹ hoà 3, hóc môn, hồ chí minh, việt nam', '02838832718', 'chùa phật', '08:00:00', '22:00:00', 'văn hoá', 6.20, '0đ', '/images/diadiem161/hinhanh1.jpg', '/images/diadiem161/hinhanh2.jpg', '/images/diadiem161/hinhanh3.jpg', 1, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1063.7592337587907!2d106.6019636!3d10.8642083!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a6b9133ff3b%3A0x80fdbf44295ebe02!2zQ2jDuWEgxJDhu4thIFThuqFuZw!5e1!3m2!1svi!2s!4v1729001640097!5m2!1svi!2s', 80, 19, '2022-12-10 00:00:00', NULL, NULL, NULL, NULL, NULL),
(163, 'Nhà Thờ Giáo Xứ Trung Chánh', '128 đ. nguyễn ảnh thủ, trung mỹ tây, hóc môn, hồ chí minh, việt nam', '0964545411', 'nhà thờ công giáo', '08:00:00', '22:00:00', 'văn hoá', 7.10, '0đ', '/images/diadiem162/hinhanh1.jpg', '/images/diadiem162/hinhanh2.jpg', '/images/diadiem162/hinhanh3.jpg', 11, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d8510.157956976953!2d106.6072029!3d10.8612581!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b1f7a7797b9%3A0x960fcf0d48f8d10f!2zTmjDoCBUaOG7nSBHacOhbyBY4bupIFRydW5nIENow6FuaA!5e1!3m2!1svi!2s!4v1729001597490!5m2!1svi!2s', 92, 42, '2024-06-24 00:00:00', NULL, NULL, NULL, NULL, NULL),
(164, 'Nhà Thờ Giáo Xứ Mỹ Hòa', '14/4a ấp trung chánh 2, trung chánh, hóc môn, hồ chí minh, việt nam', '0964545411', 'nhà thờ công giáo', '08:00:00', '22:00:00', 'văn hoá', 7.10, '0đ', '/images/diadiem163/hinhanh1.jpg', '/images/diadiem163/hinhanh2.jpg', '/images/diadiem163/hinhanh3.jpg', 1, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4255.082339824518!2d106.6059537!3d10.8610222!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a6ad2ab2f3b%3A0xd74da78b6d0fb63a!2zTmjDoCBUaOG7nSBHacOhbyBY4bupIE3hu7kgSMOyYQ!5e1!3m2!1svi!2s!4v1729001533026!5m2!1svi!2s', 67, 27, '2019-11-24 00:00:00', NULL, NULL, NULL, NULL, NULL),
(165, 'Cafe Suối Mơ', '146 đ. nguyễn ảnh thủ, tân chánh hiệp, hóc môn, hồ chí minh, việt nam', '0908011182', 'Nước uống-cà phê', '07:00:00', '22:30:00', 'ăn uống', 6.20, '20.000-50.000đ', '/images/diadiem164/hinhanh1.jpg', '/images/diadiem164/hinhanh2.jpg', '/images/diadiem164/hinhanh3.jpg', 22, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4254.868093373282!2d106.623041!3d10.876048!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a04045e6003%3A0x192046c4ab1643f!2zQ2FmZSBTdeG7kWkgTcah!5e1!3m2!1svi!2s!4v1729001503491!5m2!1svi!2s', 60, 16, '2018-11-17 00:00:00', NULL, NULL, NULL, NULL, NULL),
(166, 'Highlands Coffee Nguyen Anh Thu D12-2', '699 đ. nguyễn ảnh thủ, tân chánh hiệp, quận 12, hồ chí minh 70000, việt nam', '02871000699', 'Nước uống-cà phê', '07:00:00', '23:00:00', 'ăn uống', 9.60, '50.000-100.000đ', '/images/diadiem165/hinhanh1.jpg', '/images/diadiem165/hinhanh2.jpg', '/images/diadiem165/hinhanh3.jpg', 55, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4254.8430661914!2d106.6253831!3d10.8778019!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bd6ec16044f%3A0x743e0a1231fc4ec4!2sHighlands%20Coffee!5e1!3m2!1svi!2s!4v1729001479763!5m2!1svi!2s', 52, 17, '2018-09-14 00:00:00', NULL, NULL, NULL, NULL, NULL),
(168, 'Sân Cầu Lông Mai Vàng', '542/3 đ. nguyễn ảnh thủ, tân chánh hiệp, quận 12, hồ chí minh 700000, việt nam', '0922170909', 'Vui chơi-Giải trí- thể thao', '00:00:00', '23:59:00', 'vui chơi du lịch', 7.60, '50.000-70.000đ', '/images/diadiem167/hinhanh1.jpg', '/images/diadiem167/hinhanh2.jpg', '/images/diadiem167/hinhanh3.jpg', 13, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4254.7751151206!2d106.62498757540094!3d10.882562489272678!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b51286e61b9%3A0x9e06b04574c66f9d!2zU8OibiBD4bqndSBMw7RuZyBNYWkgVsOgbmc!5e1!3m2!1svi!2s!4v1729001384101!5m2!1svi!2s', 50, 8, '2023-06-29 00:00:00', NULL, NULL, NULL, NULL, NULL),
(169, 'Câu Lạc Bộ Patin Quận 12', 'vjfq+5fc, d. thị mười, hiệp thành, quận 12, hồ chí minh 70000, việt nam', '0909365011', 'Vui chơi-Giải trí', '07:00:00', '22:30:00', 'vui chơi du lịch', 8.80, '60.000-80.000đ', '/images/diadiem168/hinhanh1.jpg', '/images/diadiem168/hinhanh2.jpg', '/images/diadiem168/hinhanh3.jpg', 10, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d2127.4561637320407!2d106.6386274!3d10.8729474!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529378fe21365%3A0x86ae7d3dedd0ad60!2zQ8OidSBM4bqhYyBC4buZIFBhdGluIFF14bqtbiAxMg!5e1!3m2!1svi!2s!4v1729001272880!5m2!1svi!2s', 57, 17, '2021-02-13 00:00:00', NULL, NULL, NULL, NULL, NULL),
(170, 'Quang Trung Software City', 'tan chanh hiep, district 12, ho chi minh city, vietnam', '02837158888', 'công viên công cộng', '08:00:00', '22:30:00', 'vui chơi du lịch', 8.80, '0đ', '/images/diadiem169/hinhanh1.jpg', '/images/diadiem169/hinhanh2.jpg', '/images/diadiem169/hinhanh3.jpg', 20, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4255.196690544078!2d106.6245014!3d10.852994!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bee0b0ef9e5%3A0x5b4da59e47aa97a8!2zQ8O0bmcgVmnDqm4gUGjhuqduIE3hu4FtIFF1YW5nIFRydW5n!5e1!3m2!1svi!2s!4v1729001247213!5m2!1svi!2s', 86, 45, '2019-02-18 00:00:00', NULL, NULL, NULL, NULL, NULL),
(171, 'Quán lẩu cá 50', '335 đ. tô ký, trung mỹ tây, quận 12, hồ chí minh, vietnam', '0982703517', 'Lẩu cá giá rẻ', '08:00:00', '22:30:00', 'ăn uống', 8.90, '50000đ-200000đ', '/images/diadiem170/hinhanh1.jpg', '/images/diadiem170/hinhanh2.jpg', '/images/diadiem170/hinhanh3.jpg', 2, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d2127.6063447236784!2d106.6254478!3d10.8518703!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a2721070ee9%3A0x3cb70de92c523490!2zUXXDoW4gbOG6qXUgY8AhIDUw!5e1!3m2!1svi!2s!4v1729001215485!5m2!1svi!2s', 57, 33, '2016-04-18 00:00:00', NULL, NULL, NULL, NULL, NULL),
(172, 'Quán dì 6- Ram bắp, ram thịt nướng, bánh xèo', '144 đ. tô ký, đông hưng thuận, quận 12, hồ chí minh, vietnam', '0965024354', 'Chả ram, thịt nướng', '08:00:00', '22:30:00', 'ăn uống', 7.30, '10000đ-30000đ', '/images/diadiem171/hinhanh1.jpg', '/images/diadiem171/hinhanh2.jpg', '/images/diadiem171/hinhanh3.jpg', 3, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d8510.514301763102!2d106.6302784!3d10.8487469!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529e04899b72b%3A0x31c4fd4a9dd0795e!2zUXXDoW4gZMOsIDYtIFJhbSBi4bqvcCwgcmFtIHRo4buLdCBuxrDhu5tuZywgYsOhbmggeMOobw!5e1!3m2!1svi!2s!4v1729001180037!5m2!1svi!2s', 79, 39, '2016-12-03 00:00:00', NULL, NULL, NULL, NULL, NULL),
(173, 'Cơm Gà, Cháo Gà, Gỏi Gà Ta Tường Vy Nguyễn Văn Quá, Quận 12', '661 đ. nguyễn văn quá, đông hưng thuận, quận 12, hồ chí minh 700000, vietnam', '0877710710', 'Cơm gà luộc thơm ngon', '08:00:00', '22:30:00', 'ăn uống', 8.00, '30000đ-200000đ', '/images/diadiem172/hinhanh1.jpg', '/images/diadiem172/hinhanh2.jpg', '/images/diadiem172/hinhanh3.jpg', 50, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4255.2985105511!2d106.6307575!3d10.8458406!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529187af48a79%3A0x9fd28f0ea6ef9c9f!2zQ8ahbSBHw6AsIENow6FvIEfDoCwgR-G7j2kgR8OgIFRhIFTGsOG7nW5nIFZ5IE5ndXnhu4VuIFbEg24gUXXDoSwgUXXhuq1uIDEy!5e1!3m2!1svi!2s!4v1729001152618!5m2!1svi!2s', 73, 9, '2019-09-23 00:00:00', NULL, NULL, NULL, NULL, NULL),
(174, 'Can Phong 2 Restaurant', 'c100 đ. nguyễn văn quá, đông hưng thuận, quận 12, hồ chí minh, vietnam', '', 'Nhà hàng', '08:00:00', '22:30:00', 'ăn uống', 8.30, '100000đ-500000đ', '/images/diadiem173/hinhanh1.jpg', '/images/diadiem173/hinhanh2.jpg', '/images/diadiem173/hinhanh3.jpg', 23, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4255.319972334892!2d106.6303725!3d10.8443322!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752987022c5e3f%3A0xcb7c4e91d5f80813!2zTmjDoCBow6BuZyBD4bqnbiBQaG9uZyAy!5e1!3m2!1svi!2s!4v1729001129314!5m2!1svi!2s', 78, 48, '2023-01-11 00:00:00', NULL, NULL, NULL, NULL, NULL),
(175, 'Janchu - Korean Fast Food', '21 dn11, đông hưng thuận, quận 12, hồ chí minh, vietnam', '0933380520', 'Nhà hàng', '09:00:00', '23:30:00', 'ăn uống', 8.40, '50000đ-500000đ', '/images/diadiem174/hinhanh1.jpg', '/images/diadiem174/hinhanh2.jpg', '/images/diadiem174/hinhanh3.jpg', 12, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4255.354142330925!2d106.6263894!3d10.841930200000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bc2a8b451a1%3A0xf5ed836903ce2e81!2sJanchu%20-%20Korean%20Fast%20Food!5e1!3m2!1svi!2s!4v1729001096134!5m2!1svi!2s', 68, 27, '2022-04-15 00:00:00', NULL, NULL, NULL, NULL, NULL),
(176, 'QUÁN ỐC TÍ 39K', '965/118 quang trung, phường 14, gò vấp, hồ chí minh, vietnam', '0776585447', 'Quán ốc ngon rẻ', '15:00:00', '23:30:00', 'ăn uống', 8.40, '50000đ-500000đ', '/images/diadiem175/hinhanh1.jpg', '/images/diadiem175/hinhanh2.jpg', '/images/diadiem175/hinhanh3.jpg', 12, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15674.25976054604!2d106.6350159!3d10.8445682!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175297a7acfb6e7%3A0x6a4ddb13c230ee52!2zUVXDgU4g4buQQyBUw40gMzlL!5e0!3m2!1svi!2s!4v1729001018797!5m2!1svi!2s', 60, 7, '2017-07-04 00:00:00', NULL, NULL, NULL, NULL, NULL),
(177, 'Vị Biển 2', '2a đường song hành ql 22, thành phố hồ chí minh, hồ chí minh, vietnam', '0931915195', 'Quán bia hơi', '15:00:00', '23:00:00', 'ăn uống', 8.50, '50000đ-500000đ', '/images/diadiem176/hinhanh1.jpg', '/images/diadiem176/hinhanh2.jpg', '/images/diadiem176/hinhanh3.jpg', 40, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1959.2453273022104!2d106.6148183!3d10.8502367!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a3a540b8eb1%3A0x64eb579499612533!2zQmlhIEjGoWkgSMOgIE7hu5lpIEjhuqNpIELDqW8!5e0!3m2!1svi!2s!4v1729000892725!5m2!1svi!2s', 98, 46, '2022-05-08 00:00:00', NULL, NULL, NULL, NULL, NULL),
(178, 'Hoc Mon Eco-tourism Park', '106 xuân thới thượng, 6, hóc môn, hồ chí minh, vietnam', '0932162182', 'Công viên sinh thái', '08:00:00', '16:00:00', 'vui chơi du lịch', 7.50, '0đ', '/images/diadiem177/hinhanh1.jpg', '/images/diadiem177/hinhanh2.jpg', '/images/diadiem177/hinhanh3.jpg', 30, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d62694.273093210504!2d106.5817267!3d10.857755!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bc1df649201%3A0x481db1e94e761443!2zQ8O0bmcgdmnDqm4gZHUgbOG7i2NoIHNpbmggdGjDoWkgSMOzYyBNw7Ru!5e0!3m2!1svi!2s!4v1729000783786!5m2!1svi!2s', 55, 26, '2016-09-20 00:00:00', NULL, NULL, NULL, NULL, NULL),
(179, 'eMart Phan Huy Ich', '385 phan huy ích, phường 14, gò vấp, hồ chí minh 70000, vietnam', '02835882238', 'Trung tâm thương mại', '07:30:00', '22:00:00', 'vui chơi du lịch', 7.60, '0đ', '/images/diadiem178/hinhanh1.jpg', '/images/diadiem178/hinhanh2.jpg', '/images/diadiem178/hinhanh3.jpg', 100, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15674.415365403098!2d106.6375745!3d10.8415986!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175290054499425%3A0x4315797039135bc!2sEmart%20Phan%20Huy%20%C3%8Dch!5e0!3m2!1svi!2s!4v1729000709490!5m2!1svi!2s', 84, 25, '2018-03-25 00:00:00', NULL, NULL, NULL, NULL, NULL),
(180, 'Lâu Đài Thành Phát', '29 d. công khi, xuân thới sơn, hóc môn, hồ chí minh 700000, vietnam', '0964636363', 'Lâu đài ở quận 12', '07:30:00', '22:00:00', 'vui chơi du lịch', 7.70, '0đ', '/images/diadiem179/hinhanh1.jpg', '/images/diadiem179/hinhanh2.jpg', '/images/diadiem179/hinhanh3.jpg', 12, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d31345.101084825357!2d106.5656018!3d10.8771346!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a9beae96373%3A0xbe03bc1953c974e0!2zTMOidSDEkMOgaSBUaMOgbmggUGjDoXQ!5e0!3m2!1svi!2s!4v1729000475768!5m2!1svi!2s', 52, 8, '2016-02-22 00:00:00', NULL, NULL, NULL, NULL, NULL),
(181, 'Sân cầu lông LIO SPORT', '53 tân chánh hiệp 36, tân chánh hiệp, quận 12, hồ chí minh 71500, việt nam', '', 'sân cầu lông chất lượng cao', '05:30:00', '23:00:00', 'vui chơi du lịch', 9.40, '60000đ-100000đ', '/images/diadiem180/hinhanh1.jpg', '/images/diadiem180/hinhanh2.jpg', '/images/diadiem180/hinhanh3.jpg', 52, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1745.4472603393126!2d106.62149284018942!3d10.857398161367302!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b4ffc1977d3%3A0x6716f89f49413794!2zU8OibiBj4bqndSBsw7RuZyBMSU8gU1BPUlQ!5e0!3m2!1svi!2s!4v1729007256126!5m2!1svi!2s', 62, 3, '2018-11-13 00:00:00', NULL, NULL, NULL, NULL, NULL),
(182, 'Bệnh Viện Quận 12', '111 d. thị mười, tân chánh hiệp, quận 12, hồ chí minh 700000, việt nam', '', 'bệnh viện q12', '07:00:00', '16:30:00', 'y tế', 4.80, '', '/images/diadiem181/hinhanh1.jpg', '/images/diadiem181/hinhanh2.jpg', '/images/diadiem181/hinhanh3.jpg', 349, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d13565.663265133848!2d106.6170922862462!3d10.866191949947272!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175294388cf7971%3A0x63eaecc944c04ef1!2zQuG7h25oIFZp4buHbiBRdeG6rW4gMTI!5e0!3m2!1svi!2s!4v1729007227828!5m2!1svi!2s', 52, 27, '2021-01-27 00:00:00', NULL, NULL, NULL, NULL, NULL),
(183, 'Maori Billiards Club | Billiards Tân Chánh Hiệp | Billiards Quận 12 |', '133 đ. trần thị năm, tân chánh hiệp, quận 12, hồ chí minh 700000, việt nam', '', '', '09:00:00', '23:00:00', 'vui chơi du lịch', 10.00, '50000đ-100000đ', '/images/diadiem182/hinhanh1.jpg', '/images/diadiem182/hinhanh2.jpg', '/images/diadiem182/hinhanh3.jpg', 3, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7836.59057012853!2d106.6238193586914!3d10.8651308!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bbe6c2ac2e7%3A0xc02368273d960fb8!2zTWFvcmkgQmlsbGlhcmRzIENsdWIgfCBCaWxsaWFyZHMgVMOibiBDaMOhbmggSGnhu4dwIHwgQmlsbGlhcmRzIFF14bqtbiAxMiB8!5e0!3m2!1svi!2s!4v1729006152381!5m2!1svi!2s', 76, 30, '2023-12-05 00:00:00', NULL, NULL, NULL, NULL, NULL),
(184, 'Green Hills', 'lot 25 quang trung software city, quận 12, hồ chí minh, việt nam', '0971585859', 'khách sạn 3sao', '00:01:00', '23:59:00', 'ngủ nghỉ', 7.80, '500000đ-1000000đ', '/images/diadiem183/hinhanh1.jpg', '/images/diadiem183/hinhanh2.jpg', '/images/diadiem183/hinhanh3.jpg', 95, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7836.794364864675!2d106.61824437587451!3d10.857365118991103!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a208b2b763b%3A0x2de63f35eb391b32!2sGreen%20Hills!5e0!3m2!1svi!2s!4v1729007345418!5m2!1svi!2s', 74, 36, '2022-09-29 00:00:00', NULL, NULL, NULL, NULL, NULL),
(185, 'Sân Bóng Đá Cầu Suối Quận 12', '52 dương thị mười kp1 tch q12, hồ chí minh, hồ chí minh, việt nam', '0965093575', 'sân bóng nhân tạo 5 người', '00:01:00', '23:59:00', 'vui chơi du lịch', 8.60, '150000đ-300000đ', '/images/diadiem184/hinhanh1.jpg', '/images/diadiem184/hinhanh2.jpg', '/images/diadiem184/hinhanh3.jpg', 68, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.3678805658606!2d106.62846715001382!3d10.859598799999993!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529cbb676cec7%3A0xa1a9b50ce98b5046!2zU8OibiBCw7NuZyDEkMOhIEPhuqd1IFN14buRaSBRdeG6rW4gMTI!5e0!3m2!1svi!2s!4v1729008118178!5m2!1svi!2s', 91, 13, '2017-02-05 00:00:00', NULL, NULL, NULL, NULL, NULL),
(186, 'Cà Phê Bàng Cổ', '34 đông bắc, tân hưng thuận, quận 12, hồ chí minh, việt nam', '', 'cà phê thư giãn', '06:00:00', '21:00:00', 'ăn uống', 8.20, '1-100000đ', '/images/diadiem186/hinhanh1.jpg', '/images/diadiem186/hinhanh2.jpg', '/images/diadiem186/hinhanh3.jpg', 48, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d979.5987027832555!2d106.62684999999999!3d10.8575459!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a20375a1f37%3A0x7591afd68a781619!2zQ8OgIFBow6ogQsOgbmcgQ-G7lQ!5e0!3m2!1svi!2s!4v1729008374805!5m2!1svi!2s', 80, 40, '2018-12-08 00:00:00', NULL, NULL, NULL, NULL, NULL),
(187, 'Yvette Coffee', '87 d. thị mười, tân chánh hiệp, quận 12, hồ chí minh, việt nam', '0909278209', 'cà phê văn phòng', '06:30:00', '22:00:00', 'ăn uống', 8.00, '1-100000đ', '/images/diadiem187/hinhanh1.jpg', '/images/diadiem187/hinhanh2.jpg', '/images/diadiem187/hinhanh3.jpg', 141, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d979.591775643914!2d106.63055729999999!3d10.859658099999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529a89ca4461f%3A0x99b4b3046b8a62f2!2sYvette%20Coffee!5e0!3m2!1svi!2s!4v1729008670588!5m2!1svi!2s', 78, 46, '2018-07-18 00:00:00', NULL, NULL, NULL, NULL, NULL),
(188, 'Giáo xứ Tân Hưng', '1 ql1a, tân thới hiệp, quận 12, hồ chí minh, việt nam', '', 'nhà thờ công giáo', '08:00:00', '22:00:00', 'văn hoá', 9.00, '0đ', '/images/diadiem188/hinhanh1.jpg', '/images/diadiem188/hinhanh2.jpg', '/images/diadiem188/hinhanh3.jpg', 470, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d531.8703074832276!2d106.6176373!3d10.8694323!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b93ab7bbd19%3A0xbbae2038162d3f!2zR2HMgCBSYcyBbiBNciBCb3k!5e1!3m2!1svi!2s!4v1729002294477!5m2!1svi!2s', 100, 49, '2019-12-03 00:00:00', NULL, NULL, NULL, NULL, NULL),
(189, 'Cơm chay Thiện Nhẫn', '63 đường d. thị mười, tân hưng thuận, quận 12, hồ chí minh, việt nam', '0987354897', 'cơm chay', '06:00:00', '21:00:00', 'ăn uống', 9.00, '1-100000đ', '/images/diadiem189/hinhanh1.jpg', '/images/diadiem189/hinhanh2.jpg', '/images/diadiem189/hinhanh3.jpg', 412, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1959.1874988675145!2d106.62999140000001!3d10.859056299999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529f54ff70979%3A0xc7087643ba884a54!2zQ8ahbSBjaGF5IFRoaeG7h24gTmjhuqtu!5e0!3m2!1svi!2s!4v1729009329879!5m2!1svi!2s', 66, 39, '2019-02-17 00:00:00', NULL, NULL, NULL, NULL, NULL),
(190, 'Beefsteak 100g CN Quận 12', '206 đông bắc, tân hưng thuận, quận 12, hồ chí minh, việt nam', '0818331378', 'beefsteak 100g chất lượng tuyệt vời', '08:00:00', '22:00:00', 'ăn uống', 9.60, '1-100000đ', '/images/diadiem190/hinhanh1.jpg', '/images/diadiem190/hinhanh2.jpg', '/images/diadiem190/hinhanh3.jpg', 42, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d489.79903428344653!2d106.62875179999999!3d10.857739299999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b00483a8a17%3A0x3c261d681e905ce0!2sBeefsteak%20100g%20CN%20Qu%E1%BA%ADn%2012!5e0!3m2!1svi!2s!4v1729009820548!5m2!1svi!2s', 1504, 24, '2019-11-22 00:00:00', NULL, NULL, NULL, NULL, NULL),
(191, 'Nhà hàng Hội Ngộ | Cơm Niêu Văn Phòng Quận 12 | Cơm Niêu Đông Bắc', '248/c7 đông bắc, tân hưng thuận, quận 12, hồ chí minh, việt nam', '', '', '06:00:00', '23:59:00', 'ăn uống', 9.90, '200000đ-500000đ', '/images/diadiem191/hinhanh1.jpg', '/images/diadiem191/hinhanh2.jpg', '/images/diadiem191/hinhanh3.jpg', 16, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.4142991718586!2d106.62114047934568!3d10.856060100000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bc030be14a9%3A0xf95b330792523784!2zTmjDoCBow6BuZyBI4buZaSBOZ-G7mSB8IEPGoW0gTmnDqnUgVsSDbiBQaMOybmcgUXXhuq1uIDEyIHwgQ8ahbSBOacOqdSDEkMO0bmcgQuG6r2M!5e0!3m2!1svi!2s!4v1729010440717!5m2!1svi!2s', 82, 9, '2017-03-26 00:00:00', NULL, NULL, NULL, NULL, NULL),
(192, 'test810', 'ABCADF', '0123456789f', 'aa', '08:20:00', '20:20:00', 'Du lịch', 0.00, '1111 - 2222', '/images/diadiem192/Screenshot 2024-11-11 104538.png', '/images/diadiem192/Screenshot 2024-11-11 104229.png', '/images/diadiem192/Screenshot 2024-11-14 190331.png', 0, 'gffg', 0, 51, '2024-11-18 08:52:16', '/images/diadiem192/Screenshot 2024-10-30 210014.png', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ls_tk`
--

CREATE TABLE `ls_tk` (
  `ten_dang_nhap` varchar(50) NOT NULL,
  `tim_kiem` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ls_tk`
--

INSERT INTO `ls_tk` (`ten_dang_nhap`, `tim_kiem`) VALUES
('tranthithuy', 'Quán ăn vặt'),
('leminhcuong', 'khu vui chơi giải trí'),
('phamquanghuy', 'khách sạn'),
('hoangngoclan', 'Nhà hàng Nhật'),
('vuongthanhdat', 'Quán cơm gần nhất'),
('dangquangdai', 'Quán phở'),
('nguyentuananh', 'khu vui chơi giải trí'),
('tranlethu', 'Quán trà sữa'),
('leminhcuong', 'khách sạn giá rẻ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tai_khoan`
--

CREATE TABLE `tai_khoan` (
  `id` int(11) NOT NULL,
  `ten_dang_nhap` varchar(50) NOT NULL,
  `mat_khau` varchar(50) NOT NULL,
  `phan_quyen` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `so_dien_thoai` varchar(20) DEFAULT NULL,
  `trang_thai` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tai_khoan`
--

INSERT INTO `tai_khoan` (`id`, `ten_dang_nhap`, `mat_khau`, `phan_quyen`, `email`, `so_dien_thoai`, `trang_thai`) VALUES
(2, 'Tester', '25d55ad283aa400af464c76d713c07ad', 1, 'tester@example.com', '0901234568', 'khóa'),
(3, 'tranthithuy', '0344f8af71760118078a14a419e458d7', 2, 'tranthithuy@example.com', '0912345678', 'khóa'),
(4, 'leminhcuong', 'ef265e2ebcca1e216116e66ff1d9f3a4', 2, 'leminhcuong@example.com', '0912345679', 'hoạt động'),
(5, 'phamquanghuy', '638aab7c222f878b7ad0371ee42d4e22', 2, 'phamquanghuy@example.com', '0912345680', 'hoạt động'),
(6, 'hoangngoclan', 'dfb18cd1749697c94b45b9c381c2050e', 2, 'hoangngoclan@example.com', '0912345681', 'khóa'),
(7, 'vuongthanhdat', 'be647fe53c3532b9c04fa4960b719977', 2, 'vuongthanhdat@example.com', '0912345682', 'hoạt động'),
(8, 'dangquangdai', '28a75eeae3f8070222f5db2c9890d66f', 2, 'dangquangdai@example.com', '0912345683', 'hoạt động'),
(9, 'nguyentuananh', '32af6edf4674a2b61d68ab49ab68ac06', 2, 'nguyentuananh@example.com', '0912345684', 'khóa'),
(10, 'tranlethu', 'ffe4260391de85076f88dc586ce87b5d', 2, 'tranlethu@example.com', '0912345685', 'hoạt động'),
(11, 'phamminhthang', '58d4cabecfd3f15c3615e5ff4ba6370b', 2, 'phamminhthang@example.com', '0912345686', 'hoạt động'),
(12, 'nguyenlan', 'e6af8fec5fd3c4fb09aad5b039a97bf6', 2, 'nguyenlan@example.com', '0912345687', 'hoạt động'),
(13, 'lethanhhoang', 'e9c3bb5c23c4cc40c94eb0eda5ada472', 2, 'lethanhhoang@example.com', '0912345688', 'hoạt động'),
(14, 'trinhthihanh', 'a7418a10cbe0e06ec38db65c4320f436', 2, 'trinhthihanh@example.com', '0912345689', 'khóa'),
(15, 'vuongdinhkhoa', '98b9303c228818f9d46f7377422a58c5', 2, 'vuongdinhkhoa@example.com', '0912345690', 'hoạt động'),
(16, 'hoangtrongdat', '2a0d853b704186c608aa4d950c5980c0', 2, 'hoangtrongdat@example.com', '0912345691', 'hoạt động'),
(17, 'phamthanhcong', '68f3d99e69854e20bd4808eb05bc9c6f', 2, 'phamthanhcong@example.com', '0912345692', 'khóa'),
(18, 'dangthanhha', 'e7da3e04a7d37432d1a33139b9be317e', 2, 'dangthanhha@example.com', '0912345693', 'hoạt động'),
(19, 'tranthehuong', 'd0c074290303c95ae372bcb861900063', 2, 'tranthehuong@example.com', '0912345694', 'hoạt động'),
(21, 'vuthanh', '7f43c15533388a688377bd69db8e724e', 2, 'vuthanh@example.com', '0912345696', 'hoạt động'),
(22, 'phamnhut', '1074c40b2d6b22302bb43d0f51b1f35b', 2, 'phamnhut@example.com', '0912345697', 'hoạt động'),
(23, 'lethanhtruong', '6de6a6e2ff810f13d534436a9a21ace9', 2, 'lethanhtruong@example.com', '0912345698', 'hoạt động'),
(24, 'tranhongson', '8ed85d213a282dec32f71386061bd5d0', 2, 'tranhongson@example.com', '0912345699', 'hoạt động'),
(25, 'vuonghong', '87ce60680b83a1952286739393a9f68a', 2, 'vuonghong@example.com', '0912345700', 'Khóa'),
(26, 'nguyenquocdat', '727ae7fec3a92eaeb2ab45e178cc58a6', 2, 'nguyenquocdat@example.com', '0912345701', 'hoạt động'),
(27, 'tranquocbinh', '2969a9707bf5cdaedc03c1e316bc5a31', 2, 'tranquocbinh@example.com', '0912345702', 'hoạt động'),
(28, 'hoangcuong', '72e927becf646ef51d01b1baa1950aba', 2, 'hoangcuong@example.com', '0912345703', 'hoạt động'),
(29, 'dangquynh', '1e4ec1d59b46cba66c14816aa0db2925', 2, 'dangquynh@example.com', '0912345704', 'hoạt động'),
(30, 'vuthikim', '130f18982a4cd6404a59ad1c0e4730e1', 2, 'vuthikim@example.com', '0912345705', 'hoạt động'),
(31, 'trangvan', '7f6601f90585f48c63817d8d5d37bcb1', 2, 'trangvan@example.com', '0912345706', 'hoạt động'),
(32, 'minhthuy', 'f9c42da4dc68314cd80d32f1c7da6ba0', 2, 'minhthuy@example.com', '0912345707', 'hoạt động'),
(33, 'huyentran', '9ee363c9dfbc5fe5bde4411969a1c5c6', 2, 'huyentran@example.com', '0912345708', 'hoạt động'),
(34, 'thanhnhan', '6796496f00a2dad1482c947d49e9bf65', 2, 'thanhnhan@example.com', '0912345709', 'hoạt động'),
(35, 'vananh', 'aa2b6726c763b5571d4abea9e20689f0', 2, 'vananh@example.com', '0912345710', 'hoạt động'),
(36, 'trangnhat', '76d7ebe73e8e91047359d88469f266e9', 2, 'trangnhat@example.com', '0912345711', 'hoạt động'),
(37, 'lanhuong', 'f1be70cb5f5fb2a4b08c67fb7e9afa54', 2, 'lanhuong@example.com', '0912345712', 'khóa'),
(38, 'thaithuy', 'f461493bd803438ac553031d75b24d86', 2, 'thaithuy@example.com', '0912345713', 'hoạt động'),
(39, 'lindang', '1df96cd0330ff69142ad4c5e6e85fef3', 2, 'lindang@example.com', '0912345714', 'hoạt động'),
(40, 'thanhha', 'a38e6d826ba998fb384535075bed6743', 2, 'thanhha@example.com', '0912345715', 'hoạt động'),
(41, 'kimngoc', 'c7f0ba70275b88758820b4d8b79dd5d4', 2, 'kimngoc@example.com', '0912345716', 'hoạt động'),
(42, 'thuynhi', '4e8295c98912b506b063631170faae7b', 2, 'thuynhi@example.com', '0912345717', 'khóa'),
(43, 'vanchau', '2dd1a2a33c60a3f29674b2c953eae451', 2, 'vanchau@example.com', '0912345718', 'hoạt động'),
(44, 'hongsang', '28b50c16adab4928240bcf778ab30e3c', 2, 'hongsang@example.com', '0912345719', 'hoạt động'),
(45, 'hoangson', '24ca43c7f02d50e1b0882485e9859a31', 2, 'hoangson@example.com', '0912345720', 'hoạt động'),
(46, 'nhatminh', '5067b3cf972a5dd6b344959a7174eb5d', 2, 'nhatminh@example.com', '0912345721', 'hoạt động'),
(47, 'thanhkhoan', 'f71cd3b484c51791e668b67008167b1d', 2, 'thanhkhoan@example.com', '0912345722', 'hoạt động'),
(48, 'duonghuong', 'b300616f5a24392f6367501e110838e9', 2, 'duonghuong@example.com', '0912345723', 'hoạt động'),
(49, 'trucdo', 'efbe50bcccd2fb9b4c6aab10fd048ea8', 2, 'trucdo@example.com', '0912345724', 'hoạt động'),
(50, 'namthanh', 'e49f0f3821172c8542139537134008d9', 2, 'namthanh@example.com', '0912345725', 'hoạt động'),
(51, 'teonv', '78d1fe0f0064cf6654940c87d99d4456', 2, 'kdt@gmail.com', '00000000000', 'hoạt động'),
(53, 'khoadt', '25f9e794323b453885f5181f1b624d0b', 2, 'maikhoa2015@gmail.com', '0949770349', 'hoạt động'),
(55, 'Admin', 'e64b78fc3bc91bcbc7dc232ba8ec59e0', 2, 'maikhoa205@gmail.com', '0123456780', 'hoạt động');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `yeu_thich`
--

CREATE TABLE `yeu_thich` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dia_diem_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `yeu_thich`
--

INSERT INTO `yeu_thich` (`id`, `user_id`, `dia_diem_id`) VALUES
(6, 51, 1),
(1, 51, 2),
(5, 55, 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bao_cao`
--
ALTER TABLE `bao_cao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dia_diem` (`id_dia_diem`),
  ADD KEY `id_tai_khoan` (`id_tai_khoan`);

--
-- Chỉ mục cho bảng `binh_luan`
--
ALTER TABLE `binh_luan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_nguoi_dung` (`id_nguoi_dung`),
  ADD KEY `id_dia_diem` (`id_dia_diem`);

--
-- Chỉ mục cho bảng `danh_gia`
--
ALTER TABLE `danh_gia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dia_diem` (`id_dia_diem`);

--
-- Chỉ mục cho bảng `dia_diem`
--
ALTER TABLE `dia_diem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_nguoi_dang` (`id_nguoi_dang`),
  ADD KEY `nguoi_tao_id` (`nguoi_tao_id`);

--
-- Chỉ mục cho bảng `ls_tk`
--
ALTER TABLE `ls_tk`
  ADD KEY `ten_dang_nhap` (`ten_dang_nhap`);

--
-- Chỉ mục cho bảng `tai_khoan`
--
ALTER TABLE `tai_khoan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ten_dang_nhap` (`ten_dang_nhap`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `yeu_thich`
--
ALTER TABLE `yeu_thich`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`dia_diem_id`),
  ADD KEY `dia_diem_id` (`dia_diem_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bao_cao`
--
ALTER TABLE `bao_cao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `binh_luan`
--
ALTER TABLE `binh_luan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT cho bảng `danh_gia`
--
ALTER TABLE `danh_gia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT cho bảng `dia_diem`
--
ALTER TABLE `dia_diem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT cho bảng `tai_khoan`
--
ALTER TABLE `tai_khoan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `yeu_thich`
--
ALTER TABLE `yeu_thich`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bao_cao`
--
ALTER TABLE `bao_cao`
  ADD CONSTRAINT `bao_cao_ibfk_1` FOREIGN KEY (`id_dia_diem`) REFERENCES `dia_diem` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bao_cao_ibfk_2` FOREIGN KEY (`id_tai_khoan`) REFERENCES `tai_khoan` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `binh_luan`
--
ALTER TABLE `binh_luan`
  ADD CONSTRAINT `binh_luan_ibfk_1` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `tai_khoan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `binh_luan_ibfk_2` FOREIGN KEY (`id_dia_diem`) REFERENCES `dia_diem` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `danh_gia`
--
ALTER TABLE `danh_gia`
  ADD CONSTRAINT `danh_gia_ibfk_1` FOREIGN KEY (`id_dia_diem`) REFERENCES `dia_diem` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `dia_diem`
--
ALTER TABLE `dia_diem`
  ADD CONSTRAINT `dia_diem_ibfk_1` FOREIGN KEY (`nguoi_tao_id`) REFERENCES `tai_khoan` (`id`),
  ADD CONSTRAINT `fk_id_nguoi_dang` FOREIGN KEY (`id_nguoi_dang`) REFERENCES `tai_khoan` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `ls_tk`
--
ALTER TABLE `ls_tk`
  ADD CONSTRAINT `ls_tk_ibfk_1` FOREIGN KEY (`ten_dang_nhap`) REFERENCES `tai_khoan` (`ten_dang_nhap`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `yeu_thich`
--
ALTER TABLE `yeu_thich`
  ADD CONSTRAINT `yeu_thich_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tai_khoan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `yeu_thich_ibfk_2` FOREIGN KEY (`dia_diem_id`) REFERENCES `dia_diem` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
