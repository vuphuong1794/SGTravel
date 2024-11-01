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

// Câu lệnh SQL để lấy dữ liệu đánh giá
$sql = "SELECT dg.id_dia_diem, dd.ten_dia_diem, dg.phuc_vu, dg.khong_gian, dg.chat_luong, dg.gia_ca, dg.diem_trung_binh
        FROM danh_gia dg
        JOIN dia_diem dd ON dg.id_dia_diem = dd.id";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="../style/admin/Danhgia.css" />
  <link rel="stylesheet" href="../style/admin/sidebardash.css" />
  <title>Quản lý đánh giá địa điểm</title>
  <style>
    /* .container {
  width: 1600px;
  float: right;
} */

    body {
      margin: 0;
      font-family: Arial, sans-serif;
    }

    /* Sidebar cột bên trái */
    .sidebar {
      width: 250px;
      background-color: #00bcd4;
      height: 100vh;
      position: fixed;
      padding-top: 20px;
      color: white;
      left: 0;
      /* Đảm bảo sidebar luôn nằm bên trái */
      top: 0;
    }

    .container {
      max-width: calc(100% - 250px);
      margin-left: 250px;
      padding: 20px;
      box-sizing: border-box;
    }

    .container h2 {
      text-align: center;
      margin-bottom: 20px;
      color: rgb(255, 174, 127);
    }

    table {
      border-collapse: collapse;
      width: 100%;
      max-width: 1200px;
      margin: 0 auto;
      /* float: right; */
    }

    th,
    td {
      border: 1px solid #ddd;
      padding: 10px;
      text-align: left;
    }

    th {
      background-color: #f5f5f5;
      font-weight: bold;
    }

    tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    tr:hover {
      background-color: #f0f0f0;
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
  </style>
</head>

<body>
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
    <h2>Quản lý đánh giá địa điểm</h2>
    <table>
      <thead>
        <tr>
          <th>STT</th>
          <th>ID địa điểm</th>
          <th>Tên địa điểm</th>
          <th>Phục vụ</th>
          <th>Không gian</th>
          <th>Chất lượng</th>
          <th>Giá cả</th>
          <th>Điểm trung bình</th>
        </tr>
      </thead>
      <tbody>
        <?php
        if ($result->num_rows > 0) {
          $stt = 1; // Biến đếm thứ tự
          while ($row = $result->fetch_assoc()) {
            echo "<tr>
                                <td>{$stt}</td>
                                <td>{$row['id_dia_diem']}</td>
                                <td>{$row['ten_dia_diem']}</td>
                                <td>{$row['phuc_vu']}</td>
                                <td>{$row['khong_gian']}</td>
                                <td>{$row['chat_luong']}</td>
                                <td>{$row['gia_ca']}</td>
                                <td>{$row['diem_trung_binh']}</td>
                              </tr>";
            $stt++; // Tăng biến đếm
          }
        } else {
          echo "<tr><td colspan='8'>Không có dữ liệu</td></tr>";
        }
        ?>
      </tbody>
    </table>
  </div>
  <?php
  $conn->close();
  ?>
</body>

</html>