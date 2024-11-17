<?php
session_start();
include '../connect.php';

// Kiểm tra xem người dùng đã đăng nhập chưa
if (!isset($_SESSION['user_id'])) {
    echo "Bạn cần đăng nhập để xóa tài khoản.";
    exit();
}

// Lấy ID người dùng từ session
$user_id = $_SESSION['user_id']; // Hoặc lấy từ form/input

// Xóa các địa điểm liên quan đến tài khoản
$sql_delete_places = "DELETE FROM dia_diem WHERE nguoi_tao_id = $user_id";
$conn->query($sql_delete_places);

// Sau đó, xóa tài khoản
$sql_delete_user = "DELETE FROM tai_khoan WHERE id = $user_id";
if ($conn->query($sql_delete_user)) {
    echo "Xóa tài khoản thành công!";
} else {
    echo "Lỗi khi xóa tài khoản: " . $conn->error;
}

?>
