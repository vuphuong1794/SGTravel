<?php
include '../connect.php';

// Kiểm tra nếu có `id` được truyền vào qua URL
if (isset($_GET['id'])) {
    $id = intval($_GET['id']);

    // Thực hiện câu lệnh DELETE để xóa địa điểm
    $sql = "DELETE FROM dia_diem WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        echo "Xóa địa điểm thành công.";
    } else {
        echo "Lỗi khi xóa địa điểm: " . $conn->error;
    }

    $stmt->close();
    $conn->close();

    // Chuyển hướng về trang quản lý địa điểm sau khi xóa
    header("Location: baidanghomnay.php");
    exit;
} else {
    echo "ID địa điểm không hợp lệ.";
}
?>
