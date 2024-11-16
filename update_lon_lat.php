<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "SGtravel";
$port = '3307'; 

// Kết nối tới database
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

$sql = "SELECT id, link_dia_diem FROM dia_diem";
$result = $conn->query($sql);

if ($result === false) {
    die("Lỗi truy vấn: " . $conn->error);
}

while ($row = $result->fetch_assoc()) {
    $id = $row['id'];
    $link_dia_diem = $row['link_dia_diem'];

    // Dùng regex để lấy lat và lon từ link_dia_diem
    if (preg_match('/!2d([-+]?[0-9]*\.?[0-9]+)!3d([-+]?[0-9]*\.?[0-9]+)/', $link_dia_diem, $matches)) {
        $longitude = $matches[1];
        $latitude = $matches[2];

        // Kiểm tra xem tọa độ có phải là số hợp lệ trước khi cập nhật
        if (is_numeric($latitude) && is_numeric($longitude)) {
            // Cập nhật lat và lon vào bảng dia_diem
            $update_sql = "UPDATE dia_diem SET latitude = $latitude, longitude = $longitude WHERE id = $id";
            if (!$conn->query($update_sql)) {
                echo "Lỗi cập nhật cho id $id: " . $conn->error . "<br>";
            }
        }
    }
}

echo "Cập nhật tọa độ thành công!";
$conn->close();
?>
