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

// Truy vấn SQL để lấy dữ liệu từ bảng bao_cao và tên đăng nhập từ bảng tai_khoan
$sql = "SELECT bc.id, bc.id_dia_diem, bc.noi_dung_bao_cao, bc.id_tai_khoan, tk.ten_dang_nhap AS nguoi_bao_cao, bc.ngay_bao_cao, bc.trang_thai
        FROM bao_cao bc
        JOIN tai_khoan tk ON bc.id_tai_khoan = tk.id";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="vi">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    rel="stylesheet" />
  <title>Bảng quản lý báo cáo bài viết</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      display: flex;
    }

    /* Sidebar cột bên trái */
    .sidebar {
      width: 250px;
      background-color: #00bcd4;
      height: 100vh;
      position: fixed;
      top: 0;
      left: 0;
      padding-top: 20px;
      color: white;
      box-sizing: border-box;
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

    /* Nội dung chính */
    .container {
      margin-left: 250px;
      padding: 20px;
      width: calc(100% - 250px);
      background: #fff;
      box-sizing: border-box;
    }

    h2 {
      text-align: center;
      margin-bottom: 20px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th,
    td {
      text-align: left;
      padding: 8px;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color: #4caf50;
      color: white;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    .xem:hover {
      background-color: aquamarine;
    }

    .xoa:hover {
      background-color: red;
    }
  </style>
</head>

<body>
  <!-- Sidebar -->
  <div class="sidebar">
    <h2>SGTravel</h2>
    <div class="menu-section">
      <a href="../admin/Dashboard.php"><i class="fas fa-home"></i> Dashboard</a>
    </div>
    <div class="menu-section">
      <h3>Người dùng</h3>
      <a href="../admin/User.php"><i class="fas fa-users"></i> Người dùng</a>
    </div>
    <div class="menu-section">
      <h3>Địa điểm</h3>
      <a href="../admin/Diadiem.php"><i class="fas fa-map-marker-alt"></i> Địa điểm</a>
    </div>
    <div class="menu-section">
      <h3>Bình luận</h3>
      <a href="../admin/comment.php"><i class="fas fa-comments"></i> Bình luận</a>
    </div>
    <div class="menu-section">
      <h3>Đánh giá</h3>
      <a href="../admin/Danhgia.php"><i class="fas fa-thumbs-up"></i> Đánh giá</a>
    </div>
    <div class="menu-section">
      <h3>Report</h3>
      <a href="../admin/Report.php"><i class="fas fa-file-alt"></i> Report</a>
    </div>
  </div>
  <div class="container">
    <h2>Bảng quản lý báo cáo bài viết</h2>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>ID địa điểm</th>
          <th>Nội dung báo cáo</th>
          <th>ID người dùng</th>
          <th>Người báo cáo</th>
          <th>Ngày báo cáo</th>
          <th>Trạng thái</th>
          <th>Hành động</th>
        </tr>
      </thead>
      <tbody>
        <?php
        // Kiểm tra và hiển thị dữ liệu từ truy vấn
        if ($result->num_rows > 0) {
          while ($row = $result->fetch_assoc()) {
            echo "<tr>
                          <td>{$row['id']}</td>
                          <td>{$row['id_dia_diem']}</td>
                          <td>{$row['noi_dung_bao_cao']}</td>
                          <td>{$row['id_tai_khoan']}</td>
                          <td>{$row['nguoi_bao_cao']}</td>
                          <td>{$row['ngay_bao_cao']}</td>
                          <td>{$row['trang_thai']}</td>
                          <td>
                              <button class='xem'>Xem chi tiết</button>
                              <button class='xoa'>Xóa báo cáo</button>
                          </td>
                        </tr>";
          }
        } else {
          echo "<tr><td colspan='8'>Không có dữ liệu báo cáo</td></tr>";
        }
        ?>
      </tbody>
    </table>
  </div>
</body>

</html>