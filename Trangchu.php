<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/Trangchu.css">
    <link rel="stylesheet" href="style/ThemeColor.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css">
    <title>SGTravel - Trang chủ</title>
</head>

<body class="light-theme">
    <!-- Navbar -->
    <script src="navbar.js"></script>

    <!-- Swiper for advertisement images -->
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <img src="images/background1.png" alt="Quảng cáo 1">
            </div>
            <div class="swiper-slide">
                <img src="images/background2.png" alt="Quảng cáo 2">
            </div>
            <div class="swiper-slide">
                <img src="images/background3.png" alt="Quảng cáo 3">
            </div>
            <div class="swiper-slide">
                <img src="images/background4.png" alt="Quảng cáo 4">
            </div>
            <div class="swiper-slide">
                <img src="images/background5.png" alt="Quảng cáo 5">
            </div>
        </div>
        <!-- Slider buttons -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script>
        const swiper = new Swiper('.swiper-container', {
            loop: true,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            autoplay: {
                delay: 3000, // Auto-slide every 3 seconds
                disableOnInteraction: false,
            },
        });
    </script>

    <!-- Filter bar -->
    <div class="content">
        <div class="filter-bar">
            <div class="filter-group-left">
                <button>Mới nhất</button>
                <button>Gần tôi</button>
                <button>Đã lưu</button>
            </div>
            <div class=" filter-group-right">
                <select class="filter-bar select">
                    <option value="">Danh mục</option>
                </select>
                <select class="filter-bar select">
                    <option value="">Ẩm Thực</option>
                    <option value="">Khách Sạn</option>
                    <option value="">Vui Chơi</option>
                </select>
                <select class="filter-bar select" id="citySelect">
                    <option value="">Thành phố</option>
                    <option value="HCM">TP. Hồ Chí Minh</option>
                    <option value="HN">TP. Hà Nội</option>
                    <option value="DN">TP. Đà Nẵng</option>
                    <option value="CT">TP. Cần Thơ</option>
                    <option value="HP">TP. Hải Phòng</option>
                    <!-- Có thể thêm các thành phố khác -->
                </select>
                <select class="filter-bar select">
                    <option value="" selected>Quận / Huyện</option>
                    <option value="quận 1">Quận 1</option>
                    <option value="Quận 2">Quận 2</option>
                    <option value="quận 3">Quận 3</option>
                    <option value="quận 4">Quận 4</option>
                    <option value="quận 5">Quận 5</option>S
                    <option value="quận 6">Quận 6</option>
                    <option value="quận 7">Quận 7</option>
                    <option value="quận 8">Quận 8</option>
                    <option value="quận 9">Quận 9</option>
                    <option value="quận 10">Quận 10</option>
                    <option value="quận 11">Quận 11</option>
                    <option value="quận 12">Quận 12</option>
                    <option value="bình tân">Quận Bình Tân</option>
                    <option value="Bình thạnh">Quận Bình Thạnh</option>
                    <option value="Gò Vấp">Quận Gò Vấp</option>
                    <option value="phú nhuận">Quận Phú Nhuận</option>
                    <option value="tân bình">Quận Tân Bình</option>
                    <option value="Tân phú">Quận Tân Phú</option>
                    <option value="thủ đức">Quận Thủ Đức</option>
                    <option value="bình chánh">Huyện Bình Chánh</option>
                    <option value="cần giòw">Huyện Cần Giờ</option>
                    <option value="củ chi">Huyện Củ Chi</option>
                    <option value="hóc môn">Huyện Hóc Môn</option>
                    <option value="nhà bè">Huyện Nhà Bè</option>
                </select>
            </div>
        </div>


        <!-- Explore section -->
        <section class="explore">
            <div class="sidebar">
                <h3>Khám phá</h3>
                <ul>
                    <li><a href="#">Ở đâu</a></li>
                    <li><a href="#">Ăn gì</a></li>
                    <li><a href="#">Sưu tập</a></li>
                    <li><a href="#">TV</a></li>
                    <li><a href="#">Bình luận</a></li>
                    <li><a href="#">Blogs</a></li>
                    <li><a href="#">Khuyến mãi</a></li>
                </ul>
            </div>

            <div class="grid-container">
                <?php
                $servername = "localhost";
                $username = "root";
                $password = "";
                $dbname = "sgtravel";
                $port = '3306';

                // Tạo kết nối
                $conn = new mysqli($servername, $username, $password, $dbname, $port);

                // Kiểm tra kết nối
                if ($conn->connect_error) {
                    die("Kết nối thất bại: " . $conn->connect_error);
                }

                // MySQL query to fetch location data
                $sql = "SELECT ten_dia_diem, dia_chi, hinh_anh1 FROM dia_diem";

                if (isset($_GET['district']) && !empty($_GET['district'])) {
                    $district = $conn->real_escape_string($_GET['district']);
                    $sql .= " WHERE dia_chi LIKE '%$district%'";
                }
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo "<div class='card'>";
                        echo "<img src='" . $row["hinh_anh1"] . "' alt='" . $row["ten_dia_diem"] . "'>";
                        echo "<div class='card-info'>";
                        echo "<h4>" . $row["ten_dia_diem"] . "</h4>";
                        echo "<p>" . $row["dia_chi"] . "</p>";
                        echo "<button>Lưu vào yêu thích</button>";
                        echo "</div></div>";
                    }
                } else {
                    echo "<p>Không có kết quả nào để hiển thị</p>";
                }

                // Close the connection
                $conn->close();
                ?>

            </div>
        </section>

    </div>
    <!-- Footer -->
    <script src="footer.js"></script>
    <script src="themeToggle.js"></script>

    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelector('.filter-group-right select:last-child').addEventListener('change', function() {
                const selectedDistrict = this.value;
                if (selectedDistrict) {
                    window.location.href = '?district=' + selectedDistrict;
                }
            });
        });
    </script>
</body>

</html>