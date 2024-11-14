<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý bình luận</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../style/admin/comment.css" />
</head>
<style>
    .trang {
    text-align: center;
    margin-top: 20px;
    }

    .trang a {
        color: #007bff;
        padding: 8px 16px;
        margin: 0 5px;
        border: 1px solid #007bff;
        border-radius: 5px;
        text-decoration: none;
        font-weight: bold;
    }

    .trang a:hover {
        background-color: #007bff;
        color: white;
        border-color: #0056b3;
    }

    .trang a.active {
        background-color: #007bff;
        color: white;
        pointer-events: none;
    }

    .trang a:first-child, .trang a:last-child {
        font-weight: bold;
}

</style>
<body>
    <?php
    include '../connect.php';
    // Kiểm tra nếu có yêu cầu xóa bình luận
    if (isset($_GET['delete_id'])) {
        $deleteId = intval($_GET['delete_id']);
        $deleteQuery = "DELETE FROM binh_luan WHERE id = $deleteId";
        
        if ($conn->query($deleteQuery) === TRUE) {
            echo "<script>alert('Bình luận đã được xóa thành công!'); window.location.href = 'comment.php';</script>";
        } else {
            echo "Lỗi khi xóa bình luận: " . $conn->error;
        }
    }
    // Số lượng bản ghi hiển thị trên mỗi trang
    $sd = 15;

    // Lấy trang hiện tại từ URL hoặc mặc định là trang 1
    $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
    if ($page < 1) $page = 1;

    // Tính vị trí bắt đầu của bản ghi cho trang hiện tại
    $vt = ($page - 1) * $sd;

    // Lọc bình luận theo địa điểm nếu id_dia_diem được chọn
    $id_DD = isset($_GET['id_dia_diem']) ? intval($_GET['id_dia_diem']) : 0;
    $Loc_Query = "SELECT binh_luan.id, binh_luan.noi_dung, binh_luan.id_dia_diem, 
                            dia_diem.ten_dia_diem, tai_khoan.ten_dang_nhap AS nguoi_dung, 
                            binh_luan.ngay_binh_luan 
                    FROM binh_luan 
                    LEFT JOIN dia_diem ON binh_luan.id_dia_diem = dia_diem.id 
                    LEFT JOIN tai_khoan ON binh_luan.id_nguoi_dung = tai_khoan.id";
    if ($id_DD > 0) {
        $Loc_Query .= " WHERE binh_luan.id_dia_diem = $id_DD";
    }
    $Loc_Query .= " LIMIT $vt, $sd";

    // Thực thi truy vấn lọc và phân trang
    $Loc_Comments = $conn->query($Loc_Query);

    // Đếm tổng số bản ghi để phân trang
    $countQuery = "SELECT COUNT(*) AS total FROM binh_luan";
    if ($id_DD > 0) {
        $countQuery .= " WHERE id_dia_diem = $id_DD";
    }
    $result_count = $conn->query($countQuery);
    $row_count = $result_count->fetch_assoc();
    $tus = $row_count['total']; // Tổng số bản ghi

    // Tính tổng số trang
    $tst = ceil($tus / $sd);
    ?>

    <div class="sidebar">
        <a href="./Dashboard.php"><h2>SGTravel</h2></a>
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
        <form id="form_loc" name="form_loc" method="get">
            <label for="id_dia_diem">Lọc bình luận theo tên địa điểm:</label>
            <select name="id_dia_diem" id="id_dia_diem" onChange="form_loc.submit()">
                <option value=""> Chọn địa điểm </option>
                <?php
                // Truy vấn danh sách địa điểm
                $locations = $conn->query("SELECT DISTINCT id, ten_dia_diem FROM dia_diem");
                while ($location = $locations->fetch_assoc()) {
                ?>
                    <option value="<?php echo $location["id"]; ?>"
                        <?php if ($id_DD == $location['id']) echo "selected"; ?>>
                        <?php echo $location["ten_dia_diem"]; ?>
                    </option>
                <?php } ?>
            </select>
        </form>

        <table width="500" border="1" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nội dung bình luận</th>
                    <th>ID địa điểm</th>
                    <th>Địa điểm</th>
                    <th>Người dùng</th>
                    <th>Ngày bình luận</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if ($Loc_Comments && $Loc_Comments->num_rows > 0) {
                    while ($comment = $Loc_Comments->fetch_assoc()) { ?>
                        <tr>
                            <td><?php echo $comment["id"]; ?></td>
                            <td><?php echo $comment["noi_dung"]; ?></td>
                            <td><?php echo $comment["id_dia_diem"]; ?></td>
                            <td><?php echo $comment["ten_dia_diem"]; ?></td>
                            <td><?php echo $comment["nguoi_dung"]; ?></td>
                            <td><?php echo $comment["ngay_binh_luan"]; ?></td>
                            <td>
                                <a href="comment.php?delete_id=<?php echo $comment['id']; ?>" onclick="return confirm('Bạn có chắc muốn xóa bình luận này?');">
                                    <button>Xóa</button>
                                </a>
                            </td>
                        </tr>
                    <?php }
                } else { ?>
                    <tr>
                        <td colspan="7">Không có bình luận nào.</td>
                    </tr>
                <?php }
                ?>
            </tbody>
        </table>
        <p>Trang
        <div class="trang">
            <?php if ($page > 1) { ?>
                <a href="comment.php?page=<?php echo $page - 1; ?>&id_dia_diem=<?php echo $id_DD; ?>">Trang trước</a>
            <?php } ?>
            
            <?php for ($i = 1; $i <= $tst; $i++) { ?>
                <a href="comment.php?page=<?php echo $i; ?>&id_dia_diem=<?php echo $id_DD; ?>" <?php if ($page == $i) echo 'class="active"'; ?>>
                    <?php echo $i; ?>
                </a>
            <?php } ?>
            
            <?php if ($page < $tst) { ?>
                <a href="comment.php?page=<?php echo $page + 1; ?>&id_dia_diem=<?php echo $id_DD; ?>">Trang sau</a>
            <?php } ?>
        </div>
        </p>
    </div>

</body>
</html>
