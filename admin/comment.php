<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý bình luận</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../style/admin/comment.css" />
</head>
<body>
    <?php
     // Kết nối tới cơ sở dữ liệu
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
  
    // Lấy dữ liệu bình luận
    $sql = "SELECT binh_luan.id, binh_luan.noi_dung, binh_luan.id_dia_diem, dia_diem.ten_dia_diem, tai_khoan.ten_dang_nhap AS nguoi_dung, binh_luan.ngay_binh_luan
            FROM binh_luan
            LEFT JOIN dia_diem ON binh_luan.id_dia_diem = dia_diem.id
            LEFT JOIN tai_khoan ON binh_luan.id_nguoi_dung = tai_khoan.id";
    $result = $conn->query($sql);

    // Kiểm tra và lưu kết quả
    $comments = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $comments[] = $row;
        }
    }

    $conn->close();
    ?>

    <div class="sidebar">
        <h2>SGTravel</h2>
        <div class="menu-section">
            <a href="../admin/Dashboard.php"><i class="fas fa-home"></i> Dashboard</a>
            <h3>Người dùng</h3>
            <a href="../admin/User.php"><i class="fas fa-users"></i> Người dùng</a>
            <h3>Địa điểm</h3>
            <a href="../admin/Diadiem.php"><i class="fas fa-map-marker-alt"></i> Địa điểm</a>
            <h3>Bình luận</h3>
            <a href="../admin/comment.php"><i class="fas fa-comments"></i> Bình luận</a>
            <h3>Đánh giá</h3>
            <a href="../admin/Danhgia.php"><i class="fas fa-thumbs-up"></i> Đánh giá</a>
            <h3>Report</h3>
            <a href="../admin/Report.php"><i class="fas fa-file-alt"></i> Report</a>
        </div>
    </div>
    
    <div class="container">
        <h2 align="center">Quản Lý Bình Luận</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Nội dung bình luận</th>
                <th>ID địa điểm</th>
                <th>Địa điểm</th>
                <th>Người dùng</th>
                <th>Ngày bình luận</th>
                <th>Hành động</th>
            </tr>
            <?php foreach ($comments as $comment): ?>
            <tr>
                <td><?php echo $comment['id']; ?></td>
                <td class="comment-content"><?php echo htmlspecialchars($comment['noi_dung']); ?></td>
                <td><?php echo $comment['id_dia_diem']; ?></td>
                <td><?php echo htmlspecialchars($comment['ten_dia_diem']); ?></td>
                <td class="user-info"><?php echo htmlspecialchars($comment['nguoi_dung']); ?></td>
                <td><?php echo $comment['ngay_binh_luan']; ?></td>
                <td>
                    <button>Chỉnh sửa</button>
                    <button>Xóa</button>
                </td>
            </tr>
            <?php endforeach; ?>
        </table>
    </div>
</body>
</html>
