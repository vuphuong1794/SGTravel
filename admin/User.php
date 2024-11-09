<!DOCTYPE html>
<html>
  <head>
    <title>Quản lý người dùng</title>
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
      rel="stylesheet"
    />
    <style>
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
      /* Nhã hiệu SGTravel */
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

      /* Định dạng chung cho bảng */
      table {
        border-collapse: collapse;
        width: 100%;
        margin-bottom: 20px;
      }

      /* Định dạng cho hàng tiêu đề */
      th {
        background-color: #f0f0f0;
        color: #333;
        padding: 10px;
        border: 1px solid #ddd;
        text-align: left;
      }

      /* Định dạng cho hàng dữ liệu */
      td {
        padding: 10px;
        border: 1px solid #ddd;
      }

      /* Định dạng cho nút xem, sửa, khóa, xóa */
      button {
        background-color: #4caf50;
        color: #fff;
        padding: 5px 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }

      button:hover {
        background-color: #3e8e41;
      }

      /* Định dạng cho nút xem */
      button.xem {
        background-color: #03a9f4;
      }

      button.xem:hover {
        background-color: #039be5;
      }

      /* Định dạng cho nút sửa */
      button.sua {
        background-color: #ff9800;
      }

      button.sua:hover {
        background-color: #ffa07a;
      }

      /* Định dạng cho nút khóa */
      button.khoa {
        background-color: #ff0000;
      }

      button.khoa:hover {
        background-color: #ff3737;
      }

      /* Định dạng cho nút xóa */
      button.xoa {
        background-color: #ff0000;
      }

      button.xoa:hover {
        background-color: #ff3737;
      }

      /* Định dạng cho trang */
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
      }

      .container {
        width: 1000px;
        margin: 0 auto;
        padding: 20px;
        background-color: #f9f9f9;
        border: 1px solid #ddd;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }

      h1 {
        text-align: center;
        margin-bottom: 20px;
      }
      /* Style cho container của phân trang */
      .Trang {
          text-align: center;
          margin-top: 20px;
      }

      .Trang a {
          color: #007bff;
          padding: 8px 16px;
          margin: 0 5px;
          border: 1px solid #007bff;
          border-radius: 5px;
          text-decoration: none;
          font-weight: bold;
          transition: background-color 0.3s, color 0.3s;
      }

      .Trang a:hover {
          background-color: #007bff;
          color: white;
          border-color: #0056b3;
      }

      .Trang .pnow {
          background-color: #007bff;
          color: white;
          padding: 8px 16px;
          margin: 0 5px;
          border-radius: 5px;
          font-weight: bold;
      }

      .Trang a:first-child, .Trang a:last-child {
          font-weight: bold;
      }    
  </style>
  </head>
  <body>
    <div class="sidebar">
    <a href="./Dashboard.php"><h2>SGTravel</h2></a>
      <div class="menu-section">
        <a href="../admin/Dashboard.php">
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
    <div class="container">
      <h1>Quản lý người dùng</h1>
      <form method="GET" action="">
            <label>Tìm kiếm:</label>
            <input type="text" name="keyword" value="<?php echo isset($_GET['keyword']) ? htmlspecialchars($_GET['keyword']) : ''; ?>">
            <input type="submit" value="Tìm">
        </form>
      <?php
      include '../connect.php';
      // Số lượng bản ghi mỗi trang
      $sd = 20;

      // Lấy từ khóa tìm kiếm từ form
      $keyword = isset($_GET['keyword']) ? $_GET['keyword'] : '';

      // Truy vấn tổng số bản ghi có từ khóa tìm kiếm
      $sql_count = "SELECT COUNT(*) AS total FROM tai_khoan";
      if (!empty($keyword)) {
          $sql_count .= " WHERE ten_dang_nhap LIKE '%" . $conn->real_escape_string($keyword) . "%' 
                          OR email LIKE '%" . $conn->real_escape_string($keyword) . "%'";
      }

      $result_count = $conn->query($sql_count);
      $row_count = $result_count->fetch_assoc();
      $tus = $row_count['total']; // Tổng số bản ghi

      // Tính tổng số trang
      $tst = ceil($tus / $sd);

      // Lấy trang hiện tại, nếu không có thì mặc định trang 1
      $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
      $vt = ($page - 1) * $sd; // Vị trí bắt đầu của trang

      // Truy vấn dữ liệu với phân trang và tìm kiếm
      $sql = "SELECT * FROM tai_khoan";
      if (!empty($keyword)) {
          $sql .= " WHERE ten_dang_nhap LIKE '%" . $conn->real_escape_string($keyword) . "%' 
                    OR email LIKE '%" . $conn->real_escape_string($keyword) . "%'";
      }
      $sql .= " LIMIT $vt, $sd";

      $result = $conn->query($sql);

      // Hiển thị kết quả
      if ($result->num_rows > 0) {
          echo "<table border='1'>";
          echo "<tr>
                  <th>ID</th>
                  <th>Tên đăng nhập</th>
                  <th>Phân quyền</th>
                  <th>Email</th>
                  <th>Số điện thoại</th>
                  <th>Trạng thái</th>
                  <th>Thao tác</th>
                </tr>";
          while ($row = $result->fetch_assoc()) {
              echo "<tr>
                      <td>" . htmlspecialchars($row["id"]) . "</td>
                      <td>" . htmlspecialchars($row["ten_dang_nhap"]) . "</td>
                      <td>" . htmlspecialchars($row["phan_quyen"]) . "</td>
                      <td>" . htmlspecialchars($row["email"]) . "</td>
                      <td>" . htmlspecialchars($row["so_dien_thoai"]) . "</td>
                      <td>" . htmlspecialchars($row["trang_thai"]) . "</td>
                      <td>
                          <button onclick=\"if(confirm('Bạn có chắc chắn muốn xóa tài khoản này?')) { window.location.href='xoa_taikhoan.php?id=" . urlencode($row["id"]) . "'; }\">Xóa</button>
                          <button onclick=\"window.location.href='thaydoi_statusUser.php?id=" . urlencode($row['id']) . "'\">" . 
                              ($row['trang_thai'] === 'hoạt động' ? 'Khóa' : 'Mở khóa') . 
                          "</button>
                      </td>
                    </tr>";
          }
          echo "</table>";
      } else {
          echo "Không có tài khoản nào để hiển thị.";
      }

      // Đóng kết nối
      $conn->close();
      ?>

      <!-- Phân trang -->
      <p>Trang 
      <div class="Trang">
      <?php 
      for ($i = 1; $i <= $tst; $i++) {
          if ($page == $i) {
              echo "<span class='pnow'>$i</span> ";
          } else {
              echo "<a href='?page=$i&keyword=" . urlencode($keyword) . "'>$i</a> ";
          }
      }
      ?>
      </div>
      </p>
  </body>
</html>