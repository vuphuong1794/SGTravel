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
      /* Container phân trang */
      .Trang {
          margin-top: 20px; 
      }

      .pnow {
          background-color: #007bff; 
          color: white;
          padding: 8px 16px; 
          border-radius: 5px; 
          font-weight: bold; 
          margin: 0 5px; 
          text-decoration: none; 
      }

      .Trang a {
          color: #007bff; 
          padding: 8px 16px; 
          margin: 0 5px; 
          border: 1px solid #007bff;
          border-radius: 5px;
          text-decoration: none; 
      }

      /* Hiệu ứng khi hover qua liên kết trang */
      .Trang a:hover {
          background-color: #007bff; 
          color: white; 
          border-color: #0056b3; 
      }

      /* Các trang phân trang sẽ được căn giữa */
      .Trang a, .pnow {
          display: inline-block;
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
      <form method="GET" action="">
            <label>Tìm kiếm:</label>
            <input type="text" name="keyword" value="<?php echo isset($_GET['keyword']) ? htmlspecialchars($_GET['keyword']) : ''; ?>">
            <input type="submit" value="Tìm">
        </form>
      <?php
      include '../connect.php';
      $keyword = isset($_GET['keyword']) ? $_GET['keyword'] : '';

      // Đếm số lượng bản ghi cho phân trang
      $sql_count = "SELECT COUNT(*) AS total FROM dia_diem";
      if (!empty($keyword)) {
          $sql_count .= " WHERE ten_dia_diem LIKE '%" . $conn->real_escape_string($keyword) . "%' 
                        OR dia_chi LIKE '%" . $conn->real_escape_string($keyword) . "%'
                        OR mo_ta LIKE '%" . $conn->real_escape_string($keyword) . "%'
                        OR loai_hinh LIKE '%" . $conn->real_escape_string($keyword) . "%'";
      }
      $result_count = $conn->query($sql_count);
      $tdd = $result_count->fetch_assoc()['total'];

      $sd = 10;
      $tst = ceil($tdd / $sd);
      $page = isset($_GET['page']) ? $_GET['page'] : 1;
      $vt = ($page - 1) * $sd;

      // Truy vấn chính với phân trang
      $sql = "SELECT * FROM dia_diem";
      if (!empty($keyword)) {
          $sql .= " WHERE ten_dia_diem LIKE '%" . $conn->real_escape_string($keyword) . "%' 
                  OR dia_chi LIKE '%" . $conn->real_escape_string($keyword) . "%'
                  OR mo_ta LIKE '%" . $conn->real_escape_string($keyword) . "%'
                  OR loai_hinh LIKE '%" . $conn->real_escape_string($keyword) . "%'";
      }
      $sql .= " LIMIT $vt, $sd";
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
                        echo "<img src='../" . htmlspecialchars($row["hinh_anh1"]) . "' alt='Hình ảnh 1' width='100' height='100'><br>";
                      }
                      if ($row["hinh_anh2"]) {
                        echo "<img src='../" . htmlspecialchars($row["hinh_anh2"]) . "' alt='Hình ảnh 2' width='100' height='100'><br>";
                      }
                      if ($row["hinh_anh3"]) {
                        echo "<img src='../" . htmlspecialchars($row["hinh_anh3"]) . "' alt='Hình ảnh 3' width='100' height='100'><br>";
                      }
                      echo "</td>
                      <td>" . htmlspecialchars($row["so_luot_danh_gia"]) . "</td>
                      <td><a href='" . htmlspecialchars($row["link_dia_diem"]) . "' target='_blank'>Link</a></td>
                      <td>" . htmlspecialchars($row["so_luot_tk"]) . "</td>
                      <td>
                        <button onclick='xoa(" . $row['id'] . ")'>Xóa địa điểm</button>
                      </td>
                    </tr>";
          }
          echo "</table>";
      } else {
          echo "Không có địa điểm nào để hiển thị.";
      }
      $conn->close();
      ?>
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
    </div>
  </body>
</html>
