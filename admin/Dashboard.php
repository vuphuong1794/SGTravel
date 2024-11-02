<?php
session_start(); 

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sgtravel";
$port = '3307';

$conn = new mysqli($servername, $username, $password, $dbname, $port);

if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}
// Lấy số lượng bài đăng hôm nay
$sql = "SELECT COUNT(*) as so_luong_bai_dang_d FROM dia_diem WHERE DATE(ngay_dang) = CURDATE()";
$result = $conn->query($sql);
$row = $result->fetch_assoc();
$tong_so_luong_bai_dang_d = $row['so_luong_bai_dang_d'];

// Lấy số lượng bình luận hôm nay
$sql = "SELECT COUNT(*) AS so_luong_binh_luan_d FROM binh_luan WHERE DATE(ngay_binh_luan) = CURDATE()";
$result = $conn->query($sql);
$so_luong_binh_luan_d = 0;
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $so_luong_binh_luan_d = $row["so_luong_binh_luan_d"];
}
// Lấy số bài báo cáo hôm nay
$sql = "SELECT COUNT(*) AS so_luong_bao_cao_d FROM bao_cao WHERE DATE(ngay_bao_cao) = CURDATE()";
$result = $conn->query($sql);
$so_luong_bao_cao_d = 0;
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $so_luong_bao_cao_d = $row["so_luong_bao_cao_d"];
}
// Đếm số lượng bài đăng trong tháng này
$sql = "SELECT COUNT(*) AS so_luong_bai_dang_m
        FROM dia_diem 
        WHERE MONTH(ngay_dang) = MONTH(CURDATE()) 
        AND YEAR(ngay_dang) = YEAR(CURDATE())";
$result = $conn->query($sql);
$so_luong_bai_dang_m = 0;
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $so_luong_bai_dang_m = $row["so_luong_bai_dang_m"];
}

// Đếm số lượng bình luận trong tháng này
$sql = "SELECT COUNT(*) AS so_luong_binh_luan_m
        FROM binh_luan 
        WHERE MONTH(ngay_binh_luan) = MONTH(CURDATE()) 
        AND YEAR(ngay_binh_luan) = YEAR(CURDATE())";

$result = $conn->query($sql);
$so_luong_binh_luan_m = 0; 

if ($result && $result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $so_luong_binh_luan_m = $row["so_luong_binh_luan_m"];
} else {
    echo "Lỗi: " . $conn->error;
}

// Đếm số lượng báo cáo trong tháng này
$sql = "SELECT COUNT(*) AS so_luong_bao_cao_m
        FROM bao_cao
        WHERE MONTH(ngay_bao_cao) = MONTH(CURDATE()) 
        AND YEAR(ngay_bao_cao) = YEAR(CURDATE())";

$result = $conn->query($sql);
$so_luong_bao_cao_m = 0; 

if ($result && $result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $so_luong_bao_cao_m = $row["so_luong_bao_cao_m"];
} else {
    echo "Lỗi: " . $conn->error;
}
// Truy vấn số lượng bài đăng trong tháng trước
$sql_bai_dang = "SELECT COUNT(*) AS so_luong_bai_dang FROM dia_diem WHERE MONTH(ngay_dang) = MONTH(CURDATE() - INTERVAL 1 MONTH) AND YEAR(ngay_dang) = YEAR(CURDATE())";
$result_bai_dang = $conn->query($sql_bai_dang);
$so_luong_bai_dang = ($result_bai_dang->num_rows > 0) ? $result_bai_dang->fetch_assoc()["so_luong_bai_dang"] : 0;

// Truy vấn số lượng bình luận trong tháng trước
$sql_binh_luan = "SELECT COUNT(*) AS so_luong_binh_luan FROM binh_luan WHERE MONTH(ngay_binh_luan) = MONTH(CURDATE() - INTERVAL 1 MONTH) AND YEAR(ngay_binh_luan) = YEAR(CURDATE())";
$result_binh_luan = $conn->query($sql_binh_luan);
$so_luong_binh_luan = ($result_binh_luan->num_rows > 0) ? $result_binh_luan->fetch_assoc()["so_luong_binh_luan"] : 0;

// Truy vấn số lượng report trong tháng trước
$sql_report = "SELECT COUNT(*) AS so_luong_report 
               FROM bao_cao 
               WHERE MONTH(ngay_bao_cao) = MONTH(CURDATE() - INTERVAL 1 MONTH) 
               AND YEAR(ngay_bao_cao) = YEAR(CURDATE() - INTERVAL 1 MONTH)";

$result_report = $conn->query($sql_report);

if ($result_report && $result_report->num_rows > 0) {
    $row = $result_report->fetch_assoc();
    $so_luong_report = $row["so_luong_report"];
} else {
    $so_luong_report = 0; 
}
?>
<html>
  <head>
    <title>SGTravel Dashboard</title>
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
   <style>
    /* Nội dung chính */
.main-content {
  margin-left: 250px;
  padding: 20px;
}
/* header */
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #00bcd4;
  padding: 10px 20px;
  color: white;
}

/* Thanh header */
.header .icons {
  display: flex;
  margin-left: auto;
  align-items: center;
}

/* Các icon thanh header */
.header .icons i {
  margin-left: 30px;
  font-size: 20px;
}

/* class doahboard */
.dashboard {
  margin-top: 20px;
}
.dashboard h1 {
  font-size: 24px;
}
.dashboard p {
  font-size: 16px;
  color: gray;
}
/* Class chung cho ô thống kê vàng */
.cards {
  display: flex;
  gap: 20px;
  margin-top: 20px;
}

/* Class cho từng ô thống kê vàng */
.card {
  background-color: #ffcc80;
  padding: 20px;
  border-radius: 5px;
  flex: 1;
  min-width: 200px;
  position: relative;
}
.card i {
  font-size: 24px;
  color: #1565c0;
}
.card h3 {
  margin: 10px 0;
  font-size: 24px;
  color: #d32f2f;
}
.card p {
  font-size: 16px;
  color: gray;
}
/* Hôm nay và dấu múi tên phải */
.card .arrow {
  position: absolute;
  bottom: 10px;
  right: 10px;
  font-size: 16px;
  color: gray;
}
/* Biểu đồ */
.charts {
  margin-top: 40px;
}
.charts h2 {
  font-size: 20px;
  margin-bottom: 20px;
}
.chart {
  background-color: white;
  padding: 20px;
  border-radius: 5px;
  margin-bottom: 20px;
}
.footer {
  display: flex;
  justify-content: space-between;
  padding: 20px;
  background-color: #f5f5f5;
  margin-top: 40px;
}
.footer div {
  flex: 1;
}
.footer div h3 {
  font-size: 16px;
  margin-bottom: 10px;
}
.footer div p {
  font-size: 14px;
  color: gray;
}
.footer div a {
  display: block;
  color: #00bcd4;
  text-decoration: none;
  margin-bottom: 5px;
}
/* Giấy phép */
.footer .license img {
  width: 100px;
}
body {
  margin: 0;
  font-family: Arial, sans-serif;
}
/* Sidebar cột bên trái */
.sidebar {
  width: 250px;
  background-color: #00bcd4;
  height: 200vh;
  position: fixed;
  padding-top: 20px;
  color: white;
}
/* Nhãn hiệu SGTravel */
.sidebar h2 {
  text-align: center;
  margin-bottom: 30px;
}
/* Các lựa chọn bên sidebar */
.sidebar a {
  display: block;
  color: white;
  padding: 10px;
  text-decoration: none;
  font-size: 18px;
}
.sidebar a:hover {
  background-color: #0097a7;
}
.sidebar .menu-section {
  margin-bottom: 20px;
}
.sidebar .menu-section h3 {
  margin-left: 15px;
  font-size: 16px;
}
.sidebar .menu-section a {
  padding-left: 30px;
}
   </style>
  </head>
  <body>
    <div class="sidebar">
      <h2>SGTravel</h2>
      <div class="menu-section">
        <a href="./Dashboard.php">
          <i class="fas fa-home"> </i>
          Dashboard
        </a>
      </div>
      <div class="menu-section">
        <h3>Người dùng</h3>
        <a href="../admin/User.php">
          <i class="fas fa-users"> </i>
          Người dùng
        </a>
      </div>
      <div class="menu-section">
        <h3>Địa điểm</h3>
        <a href="../admin/Diadiem.php">
          <i class="fas fa-map-marker-alt"> </i>
          Địa điểm
        </a>
      </div>

      <div class="menu-section">
        <h3>Bình luận</h3>
        <a href="../admin/comment.php">
          <i class="fas fa-comments"> </i>
          Bình luận
        </a>
      </div>
      <div class="menu-section">
        <h3>Đánh giá</h3>
        <a href="../admin/Danhgia.php">
          <i class="fas fa-thumbs-up"> </i>
          Đánh giá
        </a>
      </div>

      <div class="menu-section">
        <h3>Report</h3>
        <a href="../admin/Report.php">
          <i class="fas fa-file-alt"> </i>
          Report
        </a>
      </div>
    </div>
    <div class="main-content">
      <div class="header">
        <div class="icons">
         <button class="login-btn"><a href="Logout1.php" style="text-decoration: none; color: black">Đăng Xuất</a></button>
          <i class="fas fa-bell"> </i>
          <i class="fas fa-user"> </i>
          <span> admin </span>
          <i class="fas fa-cog"> </i>
        </div>
      </div>
      <div class="dashboard">
        <h1>Dashboard</h1>
        <p>Welcome to dashboard !</p>
        <div class="cards">
          <div class="card">
            <i class="fas fa-arrow-up"> </i>
            <p>Bài đăng</p>
              <h3><?php echo $tong_so_luong_bai_dang_d; ?></h3>
            <p class="arrow">
              Hôm nay
              <i class="fas fa-arrow-right"> </i>
            </p>
          </div>
          <div class="card">
            <i class="fas fa-comments"> </i>
            <p>Bình luận</p>
            <h3><?php echo $so_luong_binh_luan_d; ?></h3>
            <p class="arrow">
              Hôm nay
              <i class="fas fa-arrow-right"> </i>
            </p>
          </div>
          <div class="card">
            <i class="fas fa-file-alt"> </i>
            <p>Report</p>
            <h3><?php echo $so_luong_bao_cao_d; ?></h3>
            <p class="arrow">
              Hôm nay
              <i class="fas fa-arrow-right"> </i>
            </p>
          </div>
        </div>
      
        <!-- Hàng ô "Tháng này" -->
        <div class="cards">
          <div class="card">
            <i class="fas fa-arrow-up"> </i>
            <p>Bài đăng</p>
            <h3><?php echo $so_luong_bai_dang_m; ?></h3>
            <p class="arrow">
              Tháng này
              <i class="fas fa-arrow-right"> </i>
            </p>
          </div>
          <div class="card">
            <i class="fas fa-comments"> </i>
            <p>Bình luận</p>
            <h3><?php echo $so_luong_binh_luan_m; ?></h3>
            <p class="arrow">
              Tháng này
              <i class="fas fa-arrow-right"> </i>
            </p>
          </div>
          <div class="card">
            <i class="fas fa-file-alt"> </i>
            <p>Report</p>
            <h3><?php echo $so_luong_bao_cao_m; ?></h3>
            <p class="arrow">
              Tháng này
              <i class="fas fa-arrow-right"> </i>
            </p>
          </div>
        </div>
  
          <h2>Thống kê</h2>
          <div class="chart">
              <h3>Bài đăng</h3>
              <canvas id="baiDangChart_n"></canvas>
          </div>

          <!-- Biểu đồ bình luận -->
          <div class="chart">
              <h3>Bình luận</h3>
              <canvas id="binhLuanChart_n"></canvas>
          </div>

          <!-- Biểu đồ report -->
          <div class="chart">
              <h3>Report</h3>
              <canvas id="reportChart_n"></canvas>
          </div>
      </div>

     
        <script>
          // Lấy dữ liệu từ PHP
              const soLuongBaiDang = <?php echo $so_luong_bai_dang; ?>;
              const soLuongBinhLuan = <?php echo $so_luong_binh_luan; ?>;
              const soLuongReport = <?php echo $so_luong_report; ?>;
        // Biểu đồ Bài đăng
        new Chart(document.getElementById('baiDangChart_n'), {
            type: 'bar',
            data: {
                labels: ['Tháng này', 'Tháng trước'],
                datasets: [{
                    label: 'Số lượng',
                    data: [<?php echo $so_luong_bai_dang_m; ?>, <?php echo $so_luong_bai_dang; ?>], 
                    backgroundColor: '#ffcc80'
                }]
            }
        });

        // Biểu đồ Bình luận
        new Chart(document.getElementById('binhLuanChart_n'), {
            type: 'bar',
            data: {
                labels: ['Tháng này', 'Tháng trước'],
                datasets: [{
                    label: 'Số lượng',
                    data: [<?php echo $so_luong_binh_luan_m; ?>,<?php echo $so_luong_binh_luan; ?>], // Remains the same
                    backgroundColor: '#81c784'
                }]
            }
        });

        // Biểu đồ Report
        new Chart(document.getElementById('reportChart_n'), {
            type: 'bar',
            data: {
              labels: ['Tháng này', 'Tháng trước'],
                datasets: [{
                    label: 'Số lượng',
                    data: [<?php echo $so_luong_bao_cao_m; ?>,<?php echo $so_luong_report; ?>], // Remains the same
                    backgroundColor: '#ff8a65'
                }]
            }
        });
      </script>
      </div>
      <div class="footer">
        <div>
          <h3>Khám phá</h3>
          <a href="#"> Ứng dụng Mobile </a>
          <a href="#"> Tạo bộ sưu tập </a>
          <a href="#"> Bài viết thông tin </a>
          <a href="#"> Quy định </a>
        </div>
        <div>
          <h3>Công ty</h3>
          <a href="#"> Giới thiệu </a>
          <a href="#"> Trợ giúp </a>
          <a href="#"> Việc làm </a>
          <a href="#"> Quy chế </a>
          <a href="#"> Chính sách sử dụng dịch vụ </a>
          <a href="#"> Liên hệ </a>
        </div>
        <div>
          <h3>Tham gia trên</h3>
          <a href="#"> Facebook </a>
          <a href="#"> Instagram </a>
          <a href="#"> Youtube </a>
          <a href="#"> Google </a>
          <a href="#"> SaigonTravel.vn </a>
        </div>
        <div class="license">
          <h3>Giấy phép</h3>
          <img src="../images/giayphep.png" alt="Chứng nhận" />
        </div>
      </div>
    </div>
  </body>
</html>
