<!DOCTYPE html>
<html lang="vi">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
  <title>Báo cáo tháng này</title>
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
    .Trang {
    text-align: center;
    margin-top: 20px;
    }
    .Trang a.page-link {
        color: #007bff;
        padding: 8px 16px;
        margin: 0 5px;
        border: 1px solid #007bff;
        border-radius: 5px;
        text-decoration: none;
        font-weight: bold;
        transition: background-color 0.3s, color 0.3s;
    }

    .Trang a.page-link:hover {
        background-color: #007bff;
        color: white;
        border-color: #0056b3;
    }

    .Trang a.page-link.active {
        background-color: #007bff;
        color: white;
        border-color: #0056b3;
        font-weight: bold;
    }

    .Trang .pnow {
        color: white;
        background-color: #007bff;
        padding: 8px 16px;
        border-radius: 5px;
        font-weight: bold;
    }

    .Trang p {
        font-size: 16px;
        font-weight: bold;
        margin-bottom: 10px;
        color: #333;
    }
  </style>
</head>

<body>
  <!-- Sidebar -->
  <div class="sidebar">
    <a href="./Dashboard.php"><h2>SGTravel</h2></a>
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
    <h2>Báo cáo tháng này</h2>
    <?php
    include '../connect.php';

    // Lấy từ khóa tìm kiếm
    $search = isset($_GET['search']) ? $_GET['search'] : '';

    // Phân trang
    $sd = 5;
    $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
    $vt = ($page - 1) * $sd;
    // Truy vấn danh sách báo cáo trong tháng này
    $sql = "SELECT bc.id, bc.id_dia_diem, bc.noi_dung_bao_cao, bc.id_tai_khoan, 
    tk.ten_dang_nhap AS nguoi_bao_cao, bc.ngay_bao_cao, bc.trang_thai
    FROM bao_cao bc
    JOIN tai_khoan tk ON bc.id_tai_khoan = tk.id
    WHERE (bc.noi_dung_bao_cao LIKE '%$search%' 
    OR tk.ten_dang_nhap LIKE '%$search%' 
    OR bc.id_dia_diem LIKE '%$search%')
    AND MONTH(bc.ngay_bao_cao) = MONTH(CURDATE()) 
    AND YEAR(bc.ngay_bao_cao) = YEAR(CURDATE())
    LIMIT $sd OFFSET $vt";

    // Truy vấn tổng số báo cáo trong tháng này
    $tong_sql = "SELECT COUNT(*) AS total 
    FROM bao_cao bc
    JOIN tai_khoan tk ON bc.id_tai_khoan = tk.id
    WHERE (bc.noi_dung_bao_cao LIKE '%$search%' 
        OR tk.ten_dang_nhap LIKE '%$search%' 
        OR bc.id_dia_diem LIKE '%$search%')
    AND MONTH(bc.ngay_bao_cao) = MONTH(CURDATE()) 
    AND YEAR(bc.ngay_bao_cao) = YEAR(CURDATE())";

    $tong_result = $conn->query($tong_sql);
    $tong_row = $tong_result->fetch_assoc();
    $tong_records = $tong_row['total'];
    $tong_pages = ceil($tong_records / $sd);

    $result = $conn->query($sql);
    ?>

    <form method="GET" action="">
      <input type="text" name="search" placeholder="Tìm kiếm báo cáo..." value="<?php echo isset($_GET['search']) ? $_GET['search'] : ''; ?>" />
      <button type="submit">Tìm kiếm</button>
    </form>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>ID địa điểm</th>
          <th>Nội dung báo cáo</th>
          <th>ID người dùng</th>
          <th>Người báo cáo</th>
          <th>Ngày báo cáo</th>
          <th>Hành động</th>
        </tr>
      </thead>
      <tbody>
        <?php
        if ($result->num_rows > 0) {
          while ($row = $result->fetch_assoc()) {
            echo "<tr>
              <td>{$row['id']}</td>
              <td>{$row['id_dia_diem']}</td>
              <td>{$row['noi_dung_bao_cao']}</td>
              <td>{$row['id_tai_khoan']}</td>
              <td>{$row['nguoi_bao_cao']}</td>
              <td>{$row['ngay_bao_cao']}</td>
              <td>
                <button onclick=\"if(confirm('Bạn có chắc chắn muốn xóa báo cáo này?')) { window.location.href='xoa_report_thang.php?id=" . urlencode($row["id"]) . "'; }\">Xóa báo cáo</button>
              </td>
            </tr>";
          }
        } else {
          echo "<tr><td colspan='8'>Không có dữ liệu báo cáo</td></tr>";
        }
        ?>
      </tbody>
    </table>
    <p>Trang</p>
    <div class="Trang">
        <?php
        for ($i = 1; $i <= $tong_pages; $i++) {
            if ($page == $i) {
                echo "<span class='pnow'>$i</span> ";  // Trang hiện tại
            } else {
                echo "<a href='?page=$i&search=$search' class='page-link'>$i</a> ";  // Các trang còn lại
            }
        }
        ?>
    </div>
  </div>
</body>
</html>
