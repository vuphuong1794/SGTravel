<?php
include '../connect.php';

// Kiểm tra nếu có ID được truyền từ URL
if (isset($_GET['id'])) {
    // Lấy ID từ URL
    $id = $_GET['id'];
    // Truy vấn để xóa tài khoản theo ID
    $sql = "DELETE FROM tai_khoan WHERE id = ?";

    // Chuẩn bị câu lệnh SQL
    if ($stmt = $conn->prepare($sql)) {
        // Gắn giá trị cho tham số ID (kiểu int)
        $stmt->bind_param("i", $id);

        // Thực thi câu lệnh xóa
        if ($stmt->execute()) {
            // Nếu xóa thành công, chuyển hướng về trang quản lý người dùng
            header("Location: User.php");
            exit;
        } else {
            echo "Có lỗi xảy ra khi xóa tài khoản. Lỗi: " . $stmt->error;
        }
    } else {
        // Nếu không thể chuẩn bị câu lệnh SQL
        echo "Không thể chuẩn bị câu lệnh SQL. Lỗi: " . $conn->error;
    }
} else {
    // Nếu không có ID được cung cấp từ URL
    echo "ID không được cung cấp.";
}
$conn->close();
?>
