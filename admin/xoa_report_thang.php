<?php
// Kết nối cơ sở dữ liệu
include '../connect.php';

// Lấy ID báo cáo từ URL, đảm bảo là một số hợp lệ
$report_id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

if ($report_id > 0) {
    // Câu lệnh SQL để xóa báo cáo theo ID
    $sql = "DELETE FROM bao_cao WHERE id = ?";

    // Kiểm tra xem câu truy vấn có được chuẩn bị thành công không
    if ($stmt = $conn->prepare($sql)) {
        // Liên kết tham số, truyền giá trị ID vào câu lệnh SQL
        $stmt->bind_param("i", $report_id);

        // Thực thi câu truy vấn
        if ($stmt->execute()) {
            // Nếu xóa thành công, chuyển hướng về trang quản lý báo cáo với thông báo thành công
            header("Location: reportthangnay.php?message=Báo cáo đã được xóa thành công");
        } else {
            // Nếu xóa thất bại, chuyển hướng về trang với thông báo lỗi
            header("Location: reportthangnay.php?message=Lỗi khi xóa báo cáo");
        }

        // Đóng kết nối sau khi thực thi xong
        $stmt->close();
    }
} else {
    // Nếu ID không hợp lệ, chuyển hướng về trang với thông báo lỗi
    header("Location: reportthangnay.php?message=ID báo cáo không hợp lệ");
}
// Đóng kết nối cơ sở dữ liệu
$conn->close();
?>
