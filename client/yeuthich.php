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

// Giả sử ID người dùng là 1 (có thể thay đổi theo nhu cầu)
$user_id = 1;

if (isset($_POST['dia_diem_id'])) {
    $dia_diem_id = $conn->real_escape_string($_POST['dia_diem_id']);

    // Thực hiện truy vấn để lưu vào bảng yêu thích
    $sql = "INSERT INTO yeu_thich (user_id, dia_diem_id) VALUES ('$user_id', '$dia_diem_id')";

    if ($conn->query($sql) === TRUE) {
        echo "Đã lưu vào yêu thích thành công!";
    } else {
        echo "Lỗi: " . $conn->error;
    }
}

// Đóng kết nối
$conn->close();
?>