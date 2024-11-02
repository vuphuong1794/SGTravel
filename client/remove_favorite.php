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

// Lấy id địa điểm từ request
if (isset($_POST['dia_diem_id'])) {
    $diaDiemId = $conn->real_escape_string($_POST['dia_diem_id']);
    $userId = $_SESSION['user_id'];

    // Xóa địa điểm yêu thích
    $sql = "DELETE FROM yeu_thich WHERE dia_diem_id = '$diaDiemId' AND user_id = '$userId'";
    if ($conn->query($sql) === TRUE) {
        echo "Địa điểm đã được xóa khỏi danh sách yêu thích.";
    } else {
        echo "Lỗi: " . $conn->error;
    }
} else {
    echo "Không có ID địa điểm.";
}

$conn->close();
?>


