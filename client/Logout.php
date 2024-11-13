<?php
session_start();

// Xóa tất cả dữ liệu trong session
session_unset();
// Hủy session
session_destroy();
header("Location: Trangchu.php");
exit();
?>
