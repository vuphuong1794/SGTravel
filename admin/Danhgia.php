<?php
include '../connect.php';

$sd = 10; // Số đánh giá trên mỗi trang

// Lấy giá trị lọc từ URL (nếu có)
$diem_trung_binh = isset($_GET['diem_trung_binh']) ? $_GET['diem_trung_binh'] : '';

// Xây dựng phần câu lệnh WHERE để lọc theo điểm trung bình
$whereCondition = '';
if ($diem_trung_binh) {
    // Tách khoảng điểm trung bình thành 2 giá trị min và max
    list($min, $max) = explode('-', $diem_trung_binh);
    $whereCondition = "WHERE dg.diem_trung_binh BETWEEN $min AND $max";
}

// Tính tổng số đánh giá
$sql_count = "SELECT COUNT(*) AS total FROM danh_gia dg JOIN dia_diem dd ON dg.id_dia_diem = dd.id $whereCondition";
$result_count = $conn->query($sql_count);
$row_count = $result_count->fetch_assoc();
$tsp = $row_count['total'];

// Tính tổng số trang
$tst = ceil($tsp / $sd);

// Kiểm tra nếu có tham số 'page' trong URL, nếu không, gán mặc định là trang 1
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;

// Tính vị trí bắt đầu của sản phẩm trên trang hiện tại
$vt = ($page - 1) * $sd;

// Câu lệnh SQL để lấy dữ liệu đánh giá với điều kiện lọc và phân trang
$sql = "SELECT dg.id_dia_diem, dd.ten_dia_diem, dg.phuc_vu, dg.khong_gian, dg.chat_luong, dg.gia_ca, dg.diem_trung_binh
        FROM danh_gia dg
        JOIN dia_diem dd ON dg.id_dia_diem = dd.id
        $whereCondition
        LIMIT $vt, $sd";

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

    .Trang a.active {
        background-color: #007bff;
        color: white;
        pointer-events: none;
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
    <form id="form_loc" name="form_loc" method="get">
      <label for="diem_trung_binh">Lọc theo điểm trung bình:</label>
      <select name="diem_trung_binh" id="diem_trung_binh" onChange="form_loc.submit()">
      <option value="">Chọn điểm trung bình</option>
          <option value="0-1" <?php if (isset($_GET['diem_trung_binh']) && $_GET['diem_trung_binh'] == '0-1') echo 'selected'; ?>>0 - 1</option>
          <option value="1-2" <?php if (isset($_GET['diem_trung_binh']) && $_GET['diem_trung_binh'] == '1-2') echo 'selected'; ?>>1 - 2</option>
          <option value="2-3" <?php if (isset($_GET['diem_trung_binh']) && $_GET['diem_trung_binh'] == '2-3') echo 'selected'; ?>>2 - 3</option>
          <option value="3-4" <?php if (isset($_GET['diem_trung_binh']) && $_GET['diem_trung_binh'] == '3-4') echo 'selected'; ?>>3 - 4</option>
          <option value="4-5" <?php if (isset($_GET['diem_trung_binh']) && $_GET['diem_trung_binh'] == '4-5') echo 'selected'; ?>>4 - 5</option>
          <option value="5-6" <?php if (isset($_GET['diem_trung_binh']) && $_GET['diem_trung_binh'] == '5-6') echo 'selected'; ?>>5 - 6</option>
          <option value="6-7" <?php if (isset($_GET['diem_trung_binh']) && $_GET['diem_trung_binh'] == '6-7') echo 'selected'; ?>>6 - 7</option>
          <option value="7-8" <?php if (isset($_GET['diem_trung_binh']) && $_GET['diem_trung_binh'] == '7-8') echo 'selected'; ?>>7 - 8</option>
          <option value="8-9" <?php if (isset($_GET['diem_trung_binh']) && $_GET['diem_trung_binh'] == '8-9') echo 'selected'; ?>>8 - 9</option>
          <option value="9-10" <?php if (isset($_GET['diem_trung_binh']) && $_GET['diem_trung_binh'] == '9-10') echo 'selected'; ?>>9 - 10</option>
      </select>
    </form>


    <table>
      <thead>
        <tr>
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
          while ($row = $result->fetch_assoc()) {
            echo "<tr>
                                <td>{$row['id_dia_diem']}</td>
                                <td>{$row['ten_dia_diem']}</td>
                                <td>{$row['phuc_vu']}</td>
                                <td>{$row['khong_gian']}</td>
                                <td>{$row['chat_luong']}</td>
                                <td>{$row['gia_ca']}</td>
                                <td>{$row['diem_trung_binh']}</td>
                              </tr>";
          }
        } else {
          echo "<tr><td colspan='8'>Không có dữ liệu</td></tr>";
        }
        ?>
      </tbody>
    </table>
    <p>Trang</p>
    <div class="Trang">
      <?php
      for ($i = 1; $i <= $tst; $i++) {
        echo "<a href='Danhgia.php?page=$i&diem_trung_binh=$diem_trung_binh'";
        if ($i == $page) echo " class='active'";
        echo ">$i</a> ";
      }
      ?>
    </div>
  </div>
  <?php
  $conn->close();
  ?>
</body>

</html>