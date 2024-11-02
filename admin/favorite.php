<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sgtravel";
$port = '3307';

$conn = new mysqli($servername, $username, $password, $dbname, $port);

if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

if (isset($_SESSION['user_id'])) {
    $userId = $_SESSION['user_id'];
    $sql = "SELECT d.id, d.ten_dia_diem, d.dia_chi, d.hinh_anh1 FROM dia_diem d JOIN yeu_thich y ON d.id = y.id_dia_diem WHERE y.id_nguoi_dung = '$userId'";
    
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<div class='card'>";
            $imagePath = "../" . htmlspecialchars($row["hinh_anh1"]); 
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

$conn->close();
?>
