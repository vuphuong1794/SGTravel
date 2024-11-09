<?php
include'../connect.php';

if (isset($_GET['id'])) {
    $userId = $_GET['id'];

    // Lấy trạng thái hiện tại của tài khoản
    $sql = "SELECT trang_thai FROM tai_khoan WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();

    // Đổi trạng thái
    $newStatus = ($row['trang_thai'] === 'hoạt động') ? 'khóa' : 'hoạt động';
    $updateSql = "UPDATE tai_khoan SET trang_thai = ? WHERE id = ?";
    $updateStmt = $conn->prepare($updateSql);
    $updateStmt->bind_param("si", $newStatus, $userId);
    $updateStmt->execute();

    $updateStmt->close();
    $stmt->close();
}

$conn->close();

// Quay lại trang quản lý người dùng
header("Location: User.php");
exit();
?>
