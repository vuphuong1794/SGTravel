<?php
session_start(); 

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sgtravel";
$port = '3306';

$conn = new mysqli($servername, $username, $password, $dbname, $port);

if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}
// Khởi tạo tên người dùng mặc định
$userNameFromDB = 'Khách';

if (isset($_SESSION['user_id'])) {
    // Lấy tên người dùng từ cơ sở dữ liệu
    $userId = $_SESSION['user_id'];
    $query = "SELECT ten_dang_nhap FROM tai_khoan WHERE id = '$userId'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        $userNameFromDB = $user['ten_dang_nhap']; 
    }
}

$conn->close();
?>

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
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        const navbarCSS = document.createElement('link');
        navbarCSS.rel = 'stylesheet';
        navbarCSS.href = '../style/navbar.css';
        document.head.appendChild(navbarCSS);

        // Đưa tên người dùng vào JavaScript từ PHP
        const username = "<?php echo $userNameFromDB; ?>"; // Lấy tên người dùng từ PHP

        const navbar = `
            <div class="navbar" id="navbar">
                <div class="nav-container">
                    <h2 class="nav-logo" onclick="window.location.href='Trangchu1.php'"><b>SGTravel</b></h2>
                    <div class="searchbox-container">
                        <input type="text" id="searchbox" placeholder="Tìm kiếm" />
                        <box-icon name='search-alt-2' class="icon"></box-icon>
                    </div>
                    <label class="switch">
                        <input type="checkbox" id="theme-toggle">
                        <span class="slider-navbar" for="theme-toggle"></span>
                    </label>
                    
                    <div class="user-container">
                        <span class="hello-message">Hello, ${username} !</span> 
                        <button class="login-btn"><a href="Logout.php" style="text-decoration: none; color: black">Đăng Xuất</a></button>
                        <box-icon name='bell'></box-icon>
                    </div>
                </div>
            </div>
        `;

        document.body.insertAdjacentHTML('afterbegin', navbar);
    });
</script>


<body class="light-theme">

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
                <button  onclick="showFavorites()">Đã lưu</button>
            </div>
            <div class="filter-group-right">
                <select class="filter-bar select">
                    <option value="">Danh mục</option>
                </select>
                <select class="filter-bar select">
                    <option value="ăn uống">Ẩm Thực</option>
                    <option value="khách sạn">Khách Sạn</option>
                    <option value="vui chơi">Vui Chơi</option>
                </select>
                <div class="location-selectors">
                    <div class="select-group">
                        <label for="provinceSelect">Tỉnh/Thành phố</label>
                        <select id="provinceSelect" onchange="getProvinces(event)">
                            <a href="./Trangchu.php">
                                <option value="">Tỉnh/Thành phố </option>
                            </a>
                        </select>
                    </div>

                    <div class="select-group">
                        <label for="districtSelect">Quận/Huyện</label>
                        <select id="districtSelect">
                            <option value="">Chọn Quận/Huyện</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>

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

            <div class="grid-container" id=locationGrid>
                <?php
                $servername = "localhost";
                $username = "root";
                $password = "";
                $dbname = "sgtravel";
                $port = '3306';

                $conn = new mysqli($servername, $username, $password, $dbname, $port);

                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                $sql = "SELECT id, ten_dia_diem, dia_chi, hinh_anh1 FROM dia_diem";
                $conditions = []; // Mảng để lưu các điều kiện lọc

                // Kiểm tra xem có tham số 'district' trong URL hay không
                if (isset($_GET['district']) && !empty($_GET['district'])) {

                    // Làm sạch tham số để tránh SQL injection
                    $district = $conn->real_escape_string($_GET['district']);
                    
                    // Tách chuỗi district thành các từ, chỉ giữ lại các từ có độ dài lớn hơn 1
                    $district_conditions = array_filter(explode(' ', $district), function ($word) {
                        return strlen($word) > 1;
                    });
                    // Nếu có từ hợp lệ, tạo điều kiện cho câu truy vấn
                    if (!empty($district_conditions)) {
                        $conditions[] = "(" . implode(" AND ", array_map(function ($word) {
                            return "LOWER(dia_chi) LIKE LOWER('%$word%')";
                        }, $district_conditions)) . ")";
                    }
                }
                
                // Kiểm tra xem có tham số 'province' trong URL hay không
                if (isset($_GET['province']) && !empty($_GET['province'])) {
                    $province = $conn->real_escape_string($_GET['province']);
                    // Làm sạch tham số
                    // Thêm điều kiện kiểm tra cho province
                    $conditions[] = "LOWER(dia_chi) LIKE LOWER('%" . strtolower($province) . "%')";
                }

                
                // Kiểm tra xem có tham số 'category' trong URL hay không
                if (isset($_GET['category']) && !empty($_GET['category'])) {
                    $category = $conn->real_escape_string($_GET['category']);
                    // Làm sạch tham số
                    // Tách chuỗi category thành các từ, chỉ giữ lại các từ có độ dài lớn hơn 1
                    $category_conditions = array_filter(explode(' ', $category), function ($word) {
                        return strlen($word) > 1;
                    });
                    if (!empty($category_conditions)) {
                        $conditions[] = "(" . implode(" AND ", array_map(function ($word) {
                            return "LOWER(loai_hinh) LIKE LOWER('%$word%')";
                        }, $category_conditions)) . ")";
                    }
                }

                // Nếu có bất kỳ điều kiện nào được tạo, thêm chúng vào câu truy vấn
                if (!empty($conditions)) {
                    $sql .= " WHERE " . implode(" AND ", $conditions); // Kết hợp các điều kiện với nhau
                }

                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo "<div class='card'>";
                        $imagePath = "../" . htmlspecialchars($row["hinh_anh1"]); 
                        echo "<img src='$imagePath' alt='" . htmlspecialchars($row["ten_dia_diem"]) . "'>";
                        echo "<div class='card-info'>";
                        echo "<h4>" . htmlspecialchars($row["ten_dia_diem"]) . "</h4>";
                        echo "<p>" . htmlspecialchars($row["dia_chi"]) . "</p>";
                        echo "<button  onclick='saveFavorite(" . $row["id"] . ")'>Lưu vào yêu thích</button>";
                        echo "</div></div>";
                    }
                } else {
                    echo "<p>Không có kết quả nào để hiển thị</p>";
                }

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
            const districtSelect = document.getElementById('districtSelect');
            const categorySelect = document.querySelector('.filter-bar select:nth-of-type(2)');
            const provinceSelect = document.getElementById('provinceSelect');

            const savedCategory = localStorage.getItem('selectedCategory');
            const savedProvince = localStorage.getItem('selectedProvince');
            const savedDistrict = localStorage.getItem('selectedDistrict');

            if (savedCategory) {
                categorySelect.value = savedCategory;
            }
            if (savedProvince) {
                provinceSelect.value = savedProvince;
            }
            if (savedDistrict) {
                districtSelect.value = savedDistrict;
            }

            // Hàm cập nhật URL
            function updateURLParams() {
                const currentParams = new URLSearchParams(window.location.search);
                currentParams.set('category', categorySelect.value);
                //currentParams.set('province', provinceSelect.value);
                currentParams.set('district', districtSelect.value);
                window.location.href = '?' + currentParams.toString();
            }

            // Xử lý thay đổi loại hình
            categorySelect.addEventListener('change', function() {
                localStorage.setItem('selectedCategory', this.value);
                updateURLParams();
            });

            // Xử lý thay đổi tỉnh
            provinceSelect.addEventListener('change', function() {
                localStorage.setItem('selectedProvince', this.value);
                districtSelect.value = ''; // Đặt lại quận
                localStorage.removeItem('selectedDistrict'); // Xóa quận khỏi local storage
                //updateURLParams();
            });

            // Xử lý thay đổi quận
            districtSelect.addEventListener('change', function() {
                localStorage.setItem('selectedDistrict', this.value);
                updateURLParams();
            });
        });


        // Function to save favorite location
        function saveFavorite(diaDiemId) {
            fetch('yeuthich.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: `dia_diem_id=${diaDiemId}`
            })
            .then(response => response.text())
            .then(data => {
                alert(data); // Hiển thị kết quả
            })
            .catch(error => console.error('Lỗi:', error));
        }


        // Function to show favorite locations
        function showFavorites() {
        // Kiểm tra xem người dùng đã đăng nhập hay chưa
        const isLoggedIn = "<?php echo isset($_SESSION['user_id']) ? 'true' : 'false'; ?>";

        if (isLoggedIn === 'false') {
            alert("Bạn cần đăng nhập để xem địa điểm yêu thích.");
            return; // Ngừng thực hiện hàm nếu chưa đăng nhập
        }

        fetch('favorite.php') // favorite.php hiển thị địa điểm yêu thích
            .then(response => response.text())
            .then(data => {
                document.querySelector('#locationGrid').innerHTML = data; // Cập nhật danh sách địa điểm
            })
            .catch(error => console.error('Lỗi:', error));
        }
    // Xóa địa điểm đã lưu
        function removeFavorite(diaDiemId) {
            if (confirm('Bạn có chắc chắn muốn xóa địa điểm này khỏi yêu thích không?')) {
                fetch('remove_favorite.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: `dia_diem_id=${diaDiemId}`
                })
                .then(response => response.text())
                .then(data => {
                    alert(data); // Hiển thị kết quả
                    showFavorites(); // Cập nhật danh sách địa điểm yêu thích
                })
                .catch(error => console.error('Lỗi:', error));
            }
        }
    </script>

</body>
</html>