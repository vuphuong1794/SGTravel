<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../style/client/Trangchu.css">
    <link rel="stylesheet" href="../style/ThemeColor.css">
    <link rel="stylesheet" href="../style/provinces.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css">
    <title>SGTravel - Trang chủ</title>
</head>

<body class="light-theme">
    <!-- Navbar -->
    <script src="../javascript/navbar.js"></script>

    <!-- Swiper for advertisement images -->
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <img src="../images/background1.png" alt="Quảng cáo 1">
            </div>
            <div class="swiper-slide">
                <img src="../images/background2.png" alt="Quảng cáo 2">
            </div>
            <div class="swiper-slide">
                <img src="../images/background3.png" alt="Quảng cáo 3">
            </div>
            <div class="swiper-slide">
                <img src="../images/background4.png" alt="Quảng cáo 4">
            </div>
            <div class="swiper-slide">
                <img src="../images/background5.png" alt="Quảng cáo 5">
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
                <div class="location-selectors">
                    <!-- Select for Provinces -->
                    <div class="select-group">
                        <label for="provinceSelect">Tỉnh/Thành phố</label>
                        <select id="provinceSelect" onchange="getProvinces(event)" >
                            <option value="">Chọn Tỉnh/Thành phố</option>
                        </select>
                    </div>

                    <!-- Select for Districts -->
                    <div class="select-group">
                        <label for="districtSelect">Quận/Huyện</label>
                        <select id="districtSelect" onchange="">
                            <option value="">Chọn Quận/Huyện</option>
                        </select>
                    </div>
                </div>
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
    <script src="../javascript/footer.js"></script>
    <script src="../javascript/themeToggle.js"></script>
    <script src="../javascript/provinces.js"></script>

    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        // Get the district select element
        const districtSelect = document.getElementById('districtSelect');
        
        // Add change event listener to the district select
        districtSelect.addEventListener('change', function() {
            const selectedDistrict = this.value;
            console.log(selectedDistrict);
            if (selectedDistrict) {
                // Reload the page with the selected district as a query parameter
                window.location.href = '?district=' + encodeURIComponent(selectedDistrict);
            }
        });
    });
</script>

</body>

</html>