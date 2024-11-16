<?php
session_start();

include '../connect.php';

// Kiểm tra nếu người dùng đã đăng nhập
if (isset($_GET['lat']) && isset($_GET['lon'])) {
    $lat = $_GET['lat'];
    $lon = $_GET['lon'];

    // Câu truy vấn để tìm các địa điểm gần tọa độ hiện tại
    $sql = "SELECT ten_dia_diem, dia_chi, 
            (6371 * ACOS(COS(RADIANS($lat)) * COS(RADIANS(latitude_column)) * 
            COS(RADIANS(longitude_column) - RADIANS($lon)) + SIN(RADIANS($lat)) * SIN(RADIANS(latitude_column)))) AS distance 
            FROM dia_diem 
            HAVING distance < 10 
            ORDER BY distance ASC";

    // Thực hiện truy vấn
    $result = $conn->query($sql);

    // Kiểm tra kết quả truy vấn
    if (!$result) {
        // In lỗi truy vấn
        echo "Lỗi truy vấn: " . $conn->error;
    } elseif ($result->num_rows > 0) {
        // Hiển thị các kết quả
        echo "<h2>Các địa điểm gần bạn:</h2>";
        echo "<ul>";
        while ($row = $result->fetch_assoc()) {
            echo "<div class='card-info'>";
            echo "<img src='" . $row["hinh_anh1"] . "' alt='" . $row["ten_dia_diem"] . "'>";
            echo "<div class='card-info'>";
            echo "<h4>" . $row["ten_dia_diem"] . "</h4>";
            echo "<p>" . $row["dia_chi"] . "</p>";
            echo "<button>Lưu vào yêu thích</button>";
            echo "</div></div>";                }
        } else {
        echo "Không tìm thấy địa điểm nào gần bạn.";
    }
    echo "<p>Bạn cần đăng nhập để xem địa điểm gần bạn.</p>";
}

// Đóng kết nối
$conn->close();
