<html>
  <head>
    <title>SGTravel Dashboard</title>
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
      rel="stylesheet"
    />
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
            <h3>3</h3>
            <p class="arrow">
              Hôm nay
              <i class="fas fa-arrow-right"> </i>
            </p>
          </div>
          <div class="card">
            <i class="fas fa-comments"> </i>
            <p>Bình luận</p>
            <h3>3</h3>
            <p class="arrow">
              Hôm nay
              <i class="fas fa-arrow-right"> </i>
            </p>
          </div>
          <div class="card">
            <i class="fas fa-file-alt"> </i>
            <p>Report</p>
            <h3>2</h3>
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
            <h3>3</h3>
            <p class="arrow">
              Tháng này
              <i class="fas fa-arrow-right"> </i>
            </p>
          </div>
          <div class="card">
            <i class="fas fa-comments"> </i>
            <p>Bình luận</p>
            <h3>10</h3>
            <p class="arrow">
              Tháng này
              <i class="fas fa-arrow-right"> </i>
            </p>
          </div>
          <div class="card">
            <i class="fas fa-file-alt"> </i>
            <p>Report</p>
            <h3>2</h3>
            <p class="arrow">
              Tháng này
              <i class="fas fa-arrow-right"> </i>
            </p>
          </div>
        </div>
      
        <div class="charts">
          <h2>Tháng trước</h2>
          <div class="chart">
            <h3>Bài đăng</h3>
            <!-- <img
            /> -->
          </div>
          <div class="chart">
            <h3>Bình luận</h3>
            <!-- <img
            /> -->
          </div>
          <div class="chart">
            <h3>Report</h3>
            <!-- <img
            /> -->
          </div>
        </div>
      </div>
        <div class="charts">
          <h2>Tháng trước</h2>
          <div class="chart">
            <h3>Bài đăng</h3>
            <!-- <img
            /> -->
          </div>
          <div class="chart">
            <h3>Bình luận</h3>
            <!-- <img
            /> -->
          </div>
          <div class="chart">
            <h3>Report</h3>
            <!-- <img
            /> -->
          </div>
        </div>
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
