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
$userLoggedIn = false;

if (isset($_SESSION['user_id'])) {
    // Lấy tên người dùng từ cơ sở dữ liệu
    $userId = $_SESSION['user_id'];
    $query = "SELECT ten_dang_nhap FROM tai_khoan WHERE id = '$userId'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        $userNameFromDB = $user['ten_dang_nhap'];
        $userLoggedIn = true; // Cập nhật trạng thái đăng nhập
    }
}
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
<style>
    .swiper-container {
        width: 100%;
        height: 500px;
        margin-bottom: 30px;
    }

    .swiper-slide {
        position: relative;
    }

    .slide-content {
        position: relative;
        width: 100%;
        height: 100%;
    }

    .slide-content img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .slide-info {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        background: rgba(0, 0, 0, 0.7);
        color: white;
        padding: 20px;
    }

    .slide-info h3 {
        margin: 0 0 10px 0;
        font-size: 24px;
    }

    .slide-info p {
        margin: 0 0 15px 0;
        font-size: 16px;
        max-height: 60px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
    }

    .explore-btn {
        display: inline-block;
        padding: 10px 20px;
        background-color: #007bff;
        color: white !important;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    .explore-btn:hover {
        background-color: #0056b3;
    }

    .swiper-button-next,
    .swiper-button-prev {
        color: white;
    }

    .swiper-pagination-bullet {
        background: white;
    }
</style>
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        const navbarCSS = document.createElement('link');
        navbarCSS.rel = 'stylesheet';
        navbarCSS.href = '../style/navbar.css';
        document.head.appendChild(navbarCSS);

        // Đưa tên người dùng vào JavaScript từ PHP
        const username = "<?php echo $userNameFromDB; ?>"; // Lấy tên người dùng từ PHP
        const userLoggedIn = "<?php echo $userLoggedIn ? 'true' : 'false'; ?>";

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
                        <span class="hello-message">Hello, ${username}!</span>
                        ${userLoggedIn === 'true' ? `<button class="create-btn"><a href="ThemDiaDiem.php" style="text-decoration: none; color: black">Tạo địa điểm</a></button>` : ''}
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
            <?php
            // Truy vấn để lấy các địa điểm nổi bật
            $sql = "SELECT ten_dia_diem, hinh_anh1, mo_ta FROM dia_diem ORDER BY RAND() LIMIT 5";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo '<div class="swiper-slide">';
                    echo '<div class="slide-content">';
                    echo '<img src="../' . htmlspecialchars($row["hinh_anh1"]) . '" alt="' . htmlspecialchars($row["ten_dia_diem"]) . '">';
                    echo '<div class="slide-info">';
                    echo '<h3>' . htmlspecialchars($row["ten_dia_diem"]) . '</h3>';
                    echo '<p>' . htmlspecialchars($row["mo_ta"]) . '</p>';
                    echo '<a href="ProductDeatail.html" class="explore-btn">Khám phá ngay</a>';
                    echo '</div>'; // .slide-info
                    echo '</div>'; // .slide-content
                    echo '</div>'; // .swiper-slide
                }
            }
            ?>
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
                <button onclick="showFavorites()">Đã lưu</button>
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
                        $defaultImagePath = "../images/locations/" . htmlspecialchars($row["hinh_anh1"]); // Default image path if the image doesn't exist

                        // Check if the image exists
                        if (!file_exists($imagePath)) {
                            $imagePath = $defaultImagePath; // Use the default image if the file doesn't exist
                        }

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
                <button id="scrollToTopBtn" onclick="scrollToTop()">↑</button>
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

        function saveFavorite(diaDiemId) {
            // Kiểm tra xem người dùng đã đăng nhập hay chưa
            const isLoggedIn = Boolean(localStorage.getItem('userLoggedIn')); // Giả sử bạn lưu trạng thái đăng nhập

            if (!isLoggedIn) {
                alert("Bạn cần đăng nhập để lưu địa điểm vào yêu thích.");
                return;
            }

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

        function showFavorites() {
            // Kiểm tra xem người dùng đã đăng nhập hay chưa
            const isLoggedIn = "<?php echo isset($_SESSION['user_id']) ? 'true' : 'false'; ?>";

            if (isLoggedIn === 'false') {
                alert("Bạn cần đăng nhập để xem địa điểm yêu thích.");
                return; // Ngừng thực hiện hàm nếu chưa đăng nhập
            }

            fetch('favorite.php') // Tạo một tệp PHP để truy vấn và hiển thị địa điểm yêu thích
                .then(response => response.text())
                .then(data => {
                    document.querySelector('#locationGrid').innerHTML = data; // Cập nhật danh sách địa điểm
                })
                .catch(error => console.error('Lỗi:', error));
        }
    </script>

    <script>
        // Show or hide the button based on scroll position
        window.onscroll = function() {
            toggleScrollToTopButton();
        };

        function toggleScrollToTopButton() {
            const scrollToTopBtn = document.getElementById("scrollToTopBtn");
            if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
                scrollToTopBtn.style.display = "block"; // Show button
            } else {
                scrollToTopBtn.style.display = "none"; // Hide button
            }
        }

        // Function to scroll to the top
        function scrollToTop() {
            window.scrollTo({
                top: 0,
                behavior: "smooth"
            });
        }
    </script>

    <script>
        let offset = 20; // Bắt đầu từ sau 30 địa điểm đầu tiên
        const limit = 20;

        function loadMoreLocations() {

            document.getElementById('loadMoreBtn').style.display = 'none';
            // Tạo URL với offset mới
            const url = `Trangchu.php?offset=${offset}`;
            fetch(url)
                .then(response => response.text())
                .then(data => {
                    // Thêm kết quả vào cuối danh sách
                    const parser = new DOMParser();
                    const doc = parser.parseFromString(data, 'text/html');
                    const newLocations = doc.querySelectorAll('#locationGrid .card');

                    if (newLocations.length > 0) {
                        newLocations.forEach(location => {
                            document.getElementById('locationGrid').appendChild(location);
                        });
                        offset += limit; // Cập nhật offset cho lần tải tiếp theo
                    } else {
                        // Ẩn nút nếu không còn địa điểm nào để tải
                        document.getElementById('loadMoreBtn').style.display = 'none';
                    }
                })
                .catch(error => console.error('Lỗi tải thêm địa điểm:', error));
        }
    </script>

</body>

</html>