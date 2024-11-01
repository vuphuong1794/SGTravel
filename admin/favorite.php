<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sgtravel";
$port = '3307';

$conn = new mysqli($servername, $username, $password, $dbname, $port);
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Giả sử ID người dùng là 1 (có thể thay đổi theo nhu cầu)
$user_id = 1;

// Truy vấn để lấy danh sách địa điểm yêu thích
$sql = "SELECT dia_diem.id, dia_diem.ten_dia_diem, dia_diem.dia_chi, dia_diem.hinh_anh1 
        FROM dia_diem 
        JOIN yeu_thich ON dia_diem.id = yeu_thich.dia_diem_id 
        WHERE yeu_thich.user_id = '$user_id'";

$result = $conn->query($sql);

if ($result) {
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<div class='card'>";
            echo "<img src='" . $row["hinh_anh1"] . "' alt='" . $row["ten_dia_diem"] . "'>";
            echo "<div class='card-info'>";
            echo "<h4>" . $row["ten_dia_diem"] . "</h4>";
            echo "<p>" . $row["dia_chi"] . "</p>";
            echo "</div></div>";
        }
    } else {
        echo "<p>Chưa có địa điểm nào trong danh sách yêu thích.</p>";
    }
} else {
    echo "<p>Lỗi truy vấn: " . $conn->error . "</p>";
}
$conn->close();
?>
