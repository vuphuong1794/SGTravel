<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản Lý Địa Điểm</title>
    
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
  height: 100vh;
  position: fixed;
  padding-top: 20px;
  color: white;
  left: 0; /* Đảm bảo sidebar luôn nằm bên trái */
  top: 0;
}

/* Container chính (nội dung chính bên phải) */
.container {
  max-width: calc(
    100% - 250px
  ); /* Tự động điều chỉnh kích thước container dựa trên chiều rộng của sidebar */
  margin-left: 250px; /* Đẩy container sang bên phải để không bị che bởi sidebar */
  padding: 20px;
  box-sizing: border-box;
}

/* Bảng */
table {
  width: 100%;
  border-collapse: collapse;
}

table,
th,
td {
  border: 1px solid #ddd;
}

th,
td {
  padding: 12px;
  text-align: left;
}

th {
  background-color: #f2f2f2;
}

/* Tiêu đề */
h2 {
  text-align: center;
  margin-bottom: 20px;
}

/* Các nút hành động */
.action-buttons {
  display: flex;
  gap: 10px;
  justify-content: center;
}

.action-buttons button {
  padding: 8px 16px;
  border: none;
  color: white;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 4px;
}

.action-buttons .them {
  background-color: #45a049;
}
.action-buttons .sua {
  background-color: rgb(228, 181, 24);
}
.action-buttons .xoa {
  background-color: red;
}
.action-buttons button:hover {
  background-color: #5a45a0;
}

@media screen and (max-width: 768px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
  .container {
    margin-left: 0;
    padding: 10px;
  }
  table,
  th,
  td {
    font-size: 14px;
  }
}

@media screen and (max-width: 480px) {
  .sidebar a {
    font-size: 16px;
    padding: 8px;
  }

  .action-buttons button {
    font-size: 12px;
    padding: 6px 12px;
  }
}
.xem_them {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 50vh;
  background-color: #f9f9f9;
}

.xem_them1 {
  background-color: #00bcd4;
  color: white;
  padding: 15px 30px;
  border-radius: 5px;
  text-decoration: none;
  font-size: 20px;
  transition: background-color 0.3s;
}

.xem_them1:hover {
  background-color: #0097a7;
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
    <a href="./Dashboard.php"><h2>SGTravel</h2></a>
      <div class="menu-section">
        <a href="Dashboard.php">
          <i class="fas fa-home"> </i>
          Dashboard
        </a>
      </div>
      <div class="menu-section">
        <h3>Người dùng</h3>
        <a href="User.php">
          <i class="fas fa-users"> </i>
          Người dùng
        </a>
      </div>
      <div class="menu-section">
        <h3>Địa điểm</h3>
        <a href="Diadiem.php">
          <i class="fas fa-map-marker-alt"> </i>
          Địa điểm
        </a>
      </div>
      <div class="menu-section">
        <h3>Bình luận</h3>
        <a href="comment.php">
          <i class="fas fa-comments"> </i>
          Bình luận
        </a>
      </div>
      <div class="menu-section">
        <h3>Đánh giá</h3>
        <a href="Danhgia.php">
          <i class="fas fa-thumbs-up"> </i>
          Đánh giá
        </a>
      </div>

      <div class="menu-section">
        <h3>Report</h3>
        <a href="Report.php">
          <i class="fas fa-file-alt"> </i>
          Report
        </a>
      </div>
    </div>
    <div class="container">
      <h2>Quản Lý Địa Điểm</h2>
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
      // Truy vấn MySQL để lấy dữ liệu từ bảng dia_diem
      $sql = "SELECT * FROM dia_diem";
      $result = $conn->query($sql);

      // Kiểm tra và hiển thị dữ liệu
      if ($result->num_rows > 0) {
          echo "<table border='1'>";
          echo "<tr>
                  <th>ID</th>
                  <th>Tên địa điểm</th>
                  <th>Địa chỉ</th>
                  <th>Số điện thoại</th>
                  <th>Mô tả</th>
                  <th>Giờ mở cửa</th>
                  <th>Giờ đóng cửa</th>
                  <th>Loại hình</th>
                  <th>Điểm trung bình</th>
                  <th>Giá cả giao động</th>
                  <th>Hình ảnh</th>
                  <th>Số lượt đánh giá</th>
                  <th>Link địa điểm</th>
                  <th>Số lượt tìm kiếm</th>
                  <th>Thao tác</th>
                </tr>";
          while ($row = $result->fetch_assoc()) {
              echo "<tr>
                      <td>" . htmlspecialchars($row["id"]) . "</td>
                      <td>" . htmlspecialchars($row["ten_dia_diem"]) . "</td>
                      <td>" . htmlspecialchars($row["dia_chi"]) . "</td>
                      <td>" . htmlspecialchars($row["so_dien_thoai"]) . "</td>
                      <td>" . htmlspecialchars($row["mo_ta"]) . "</td>
                      <td>" . htmlspecialchars($row["gio_mo_cua"]) . "</td>
                      <td>" . htmlspecialchars($row["gio_dong_cua"]) . "</td>
                      <td>" . htmlspecialchars($row["loai_hinh"]) . "</td>
                      <td>" . htmlspecialchars($row["diem_trung_binh"]) . "</td>
                      <td>" . htmlspecialchars($row["gia_ca_giao_dong"]) . "</td>
                      <td>";
              if ($row["hinh_anh1"]) {
                  echo "<img src='" . htmlspecialchars($row["hinh_anh1"]) . "' alt='Hình ảnh 1' width='100' height='100'><br>";
              }
              if ($row["hinh_anh2"]) {
                  echo "<img src='" . htmlspecialchars($row["hinh_anh2"]) . "' alt='Hình ảnh 2' width='100' height='100'><br>";
              }
              if ($row["hinh_anh3"]) {
                  echo "<img src='" . htmlspecialchars($row["hinh_anh3"]) . "' alt='Hình ảnh 3' width='100' height='100'><br>";
              }
              echo "</td>
                      <td>" . htmlspecialchars($row["so_luot_danh_gia"]) . "</td>
                      <td><a href='" . htmlspecialchars($row["link_dia_diem"]) . "' target='_blank'>Link</a></td>
                       <td>" . htmlspecialchars($row["so_luot_tk"]) . "</td>
                        <td>
                          <button onclick=\"if(confirm('Bạn có chắc chắn muốn duyệt địa điểm này?')) { window.location.href='approve.php?id=" . htmlspecialchars($row['id']) . "'; }\">Duyệt</button>
                          <button onclick=\"if(confirm('Bạn có chắc chắn muốn không duyệt địa điểm này?')) { window.location.href='disapprove.php?id=" . htmlspecialchars($row['id']) . "'; }\">Không Duyệt</button>
                        </td>
                    </tr>";
          }
          echo "</table>";
      } else {
          echo "Không có địa điểm nào để hiển thị.";
      }
$conn->close();
?>

    </div>
  </body>
</html>
