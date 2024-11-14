<?php
session_start();

include '../connect.php';

// Kiểm tra nếu người dùng đã đăng nhập
if (isset($_SESSION['user_id'])) {
    $userId = $_SESSION['user_id'];

    // Sử dụng prepared statements để tránh SQL Injection
    $sql = "SELECT d.id, d.ten_dia_diem, d.dia_chi, d.hinh_anh1 
            FROM dia_diem d 
            JOIN yeu_thich y ON d.id = y.dia_diem_id 
            WHERE y.user_id = ?";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    $result = $stmt->get_result();

    // Kiểm tra số lượng địa điểm yêu thích
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<div class='card'>";
            $imagePath = "../" . htmlspecialchars($row["hinh_anh1"]);
            $defaultImagePath = "../images/locations/" . htmlspecialchars($row["hinh_anh1"]); // Default image path if the image doesn't exist

            // Check if the image exists
            if (!file_exists($imagePath)) {
                $imagePath = $defaultImagePath; // Use the default image if the file doesn't exist
            }
            echo "<img src='$imagePath' alt='" . htmlspecialchars($row["ten_dia_diem"]) . "'>";
            echo "<div class='card-info'>";
            echo "<h4>" . htmlspecialchars($row["ten_dia_diem"]) . "</h4>";
            echo "<p>" . htmlspecialchars($row["dia_chi"]) . "</p>";
            echo "<button onclick='removeFavorite(" . $row["id"] . ")'>Xóa yêu thích</button>";
            echo "</div></div>";
        }
    } else {
        echo "<p>Không có địa điểm yêu thích nào được lưu.</p>";
    }
} else {
    echo "<p>Bạn cần đăng nhập để xem địa điểm yêu thích.</p>";
}

// Đóng kết nối
$stmt->close();
$conn->close();
