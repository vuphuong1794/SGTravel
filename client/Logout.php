<?php
session_start();

// Xóa tất cả cookie liên quan đến đăng nhập
if (isset($_COOKIE['user_login'])) {
    unset($_COOKIE['user_login']);
    setcookie('user_login', '', time() - 3600, '/'); // Xóa cookie bằng cách set thời gian hết hạn trong quá khứ
}

// Xóa tất cả dữ liệu trong session
session_unset();

// Hủy session
session_destroy();

// Chuyển hướng về trang chủ
header("Location: Trangchu.php");
exit();
?>