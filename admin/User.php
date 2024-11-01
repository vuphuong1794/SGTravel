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

    </style>
  </head>
  <body>
    <div class="sidebar">
      <h2>SGTravel</h2>
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
      <!-- <table>
        <thead>
          <tr>
            <th>STT</th>
            <th>Tên người dùng</th>
            <th>Email</th>
            <th>Số điện thoại</th>
            <th>Trạng thái</th>
            <th>Thao tác</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>Nguyễn Văn A</td>
            <td>userA@example.com</td>
            <td>0123456789</td>
            <td>Hoạt động</td>
            <td>
              <button class="xem">Xem</button>
              <button class="sua">Sửa</button>
              <button class="khoa">Khóa</button>
              <button class="xoa">Xóa</button>
            </td>
          </tr>
          <tr>
            <td>2</td>
            <td>Nguyễn Văn B</td>
            <td>userB@example.com</td>
            <td>0123456789</td>
            <td>Khóa</td>
            <td>
              <button class="xem">Xem</button>
              <button class="sua">Sửa</button>
              <button class="khoa">Mở khóa</button>
              <button class="xoa">Xóa</button>
            </td>
            <tr>
              <td>2</td>
              <td>Nguyễn Văn C</td>
              <td>userC@example.com</td>
              <td>01234562323</td>
              <td>Khóa</td>
              <td>
                <button class="xem">Xem</button>
                <button class="sua">Sửa</button>
                <button class="khoa">Mở khóa</button>
                <button class="xoa">Xóa</button>
              </td>
            </tr>
          </tr>
        </tbody>
      </table> -->
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

// Truy vấn MySQL để lấy dữ liệu từ bảng tai_khoan
$sql = "SELECT * FROM tai_khoan";
$result = $conn->query($sql);

// Kiểm tra và hiển thị dữ liệu
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
                     <button onclick=\"window.location.href='view.php?id=" . htmlspecialchars($row["id"]) . "'\">Xem</button>
                    <button onclick=\"window.location.href='edit.php?id=" . htmlspecialchars($row["id"]) . "'\">Sửa</button>
                    <button onclick=\"if(confirm('Bạn có chắc chắn muốn xóa tài khoản này?')) { window.location.href='delete.php?id=" . htmlspecialchars($row["id"]) . "'; }\">Xóa</button>
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

    </div>
  </body>
</html>
