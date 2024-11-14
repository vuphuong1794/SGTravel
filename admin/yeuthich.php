<?php
session_start();

include '../connect.php';

if (isset($_POST['dia_diem_id']) && isset($_SESSION['user_id'])) {
    $diaDiemId = $conn->real_escape_string($_POST['dia_diem_id']);
    $userId = $_SESSION['user_id'];

    // Kiểm tra xem địa điểm đã lưu trước đó chưa
    $checkQuery = "SELECT * FROM yeu_thich WHERE id_nguoi_dung = '$userId' AND id_dia_diem = '$diaDiemId'";
    $checkResult = $conn->query($checkQuery);

    if ($checkResult->num_rows == 0) {
        // Chưa lưu, thực hiện lưu địa điểm
        $insertQuery = "INSERT INTO yeu_thich (id_nguoi_dung, id_dia_diem) VALUES ('$userId', '$diaDiemId')";
        if ($conn->query($insertQuery) === TRUE) {
            echo "Đã lưu địa điểm vào danh sách yêu thích!";
        } else {
            echo "Lỗi: " . $conn->error;
        }
    } else {
        echo "Địa điểm đã được lưu trước đó.";
    }
} else {
    echo "Lỗi: Không tìm thấy ID địa điểm hoặc người dùng chưa đăng nhập.";
}

$conn->close();

?>
