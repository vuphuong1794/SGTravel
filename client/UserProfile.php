<?php
session_start();
include "../connect.php";

// Kiểm tra đăng nhập
if (!isset($_SESSION['user_id'])) {
    header("Location: Login.php");
    exit();
}

$user_id = $_SESSION['user_id'];

// Lấy danh sách địa điểm của người dùng
$sql = "SELECT * FROM dia_diem WHERE nguoi_tao_id = $user_id";
$result = $conn->query($sql);

// Lấy thông tin người dùng
$user_query = "SELECT id,ten_dang_nhap, email, so_dien_thoai FROM tai_khoan WHERE id = $user_id";
$user_result = $conn->query($user_query);

if ($user_result && $user_result->num_rows > 0) {
    $user_info = $user_result->fetch_assoc();
    $user_id = $user_info['id'];
    $user_name = $user_info['ten_dang_nhap'];
    $user_email = $user_info['email'];
    $user_sdt = $user_info['so_dien_thoai'];
} else {
    $user_name = "Người dùng";
    $user_email = "Không có email";
    $user_sdt = "không có sđt";
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Địa điểm</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            padding: 30px;
            background-color: #f8f9fa;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .header {
            background-color: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
            position: relative;
        }

        .header a {
            position: absolute;
            left: 25px;
            top: 50%;
            transform: translateY(-50%);
            color: #333;
            text-decoration: none;
        }

        .header h1 {
            text-align: center;
            color: #2c3e50;
            font-size: 2.2em;
            margin-bottom: 10px;
        }

        .header p {
            text-align: center;
            color: #666;
            font-size: 1.1em;
        }

        .add-button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-bottom: 30px;
            font-size: 1.1em;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(76, 175, 80, 0.2);
        }

        .add-button:hover {
            background-color: #45a049;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(76, 175, 80, 0.3);
        }

        .places-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 25px;
        }

        .place-card {
            background-color: #fff;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .place-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .place-image {
            width: 100%;
            height: 220px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .place-info h3 {
            color: #2c3e50;
            font-size: 1.4em;
            margin-bottom: 15px;
        }

        .place-details {
            margin-bottom: 20px;
        }

        .place-details p {
            margin-bottom: 8px;
            color: #666;
        }

        .place-details i {
            width: 20px;
            margin-right: 10px;
            color: #4CAF50;
        }

        .place-actions {
            display: flex;
            gap: 10px;
        }

        .action-button {
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .edit-button {
            background-color: #3498db;
            color: white;
        }

        .edit-button:hover {
            background-color: #2980b9;
        }

        .delete-button {
            background-color: #e74c3c;
            color: white;
        }

        .delete-button:hover {
            background-color: #c0392b;
        }

        /* Style cho message khi không có địa điểm */
        .no-places-message {
            text-align: center;
            padding: 60px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            margin: 20px auto;
            max-width: 600px;
        }

        .no-places-message i {
            font-size: 64px;
            color: #4CAF50;
            margin-bottom: 20px;
            display: block;
        }

        .no-places-message h2 {
            color: #2c3e50;
            font-size: 1.8em;
            margin-bottom: 15px;
        }

        .no-places-message p {
            color: #666;
            font-size: 1.1em;
            line-height: 1.6;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            body {
                padding: 15px;
            }

            .header {
                padding: 20px;
            }

            .places-grid {
                grid-template-columns: 1fr;
            }

            .add-button {
                width: 100%;
                text-align: center;
            }
        }

        .user-info {
            background-color: #f1f1f1;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .user-info p {
            margin: 5px 0;
            color: #333;
        }

        .user-info strong {
            color: #2c3e50;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="header">
            <a href="Trangchu1.php"><box-icon name='arrow-back'></box-icon></a>
            <h1>Địa điểm của bạn</h1>
            <p>Quản lý các địa điểm bạn đã tạo</p>
        </div>

        <a href="ThemDiaDiem.php">
            <button class="add-button">
                <i class="fas fa-plus"></i> Thêm địa điểm mới
            </button>
        </a>
        <div class="user-info">     
            <p>Chào, <strong><?php echo htmlspecialchars($user_name); ?></strong></p>
            <p>Email: <strong><?php echo htmlspecialchars($user_email); ?></strong></p>
            <p>SĐT: <strong><?php echo htmlspecialchars($user_sdt);?></strong></p>
            <a href="EditUser.php?id=<?php echo $user_id; ?>" class="edit-button">Sửa thông tin</a>
            <a href="DeleteUser.php?id=<?php echo $user_id; ?>" class="delete-button" onclick="return confirm('Bạn có chắc chắn muốn xóa tài khoản không?')">Xóa tài khoản</>
        </div>

        <div class="places-grid">
            <?php
            if ($result->num_rows > 0):
                while ($row = $result->fetch_assoc()):
            ?>
                    <div class="place-card" id="place-<?php echo $row['id']; ?>">
                        <?php
                        $imagePath = "../" . htmlspecialchars($row["hinh_anh1"]);
                        $defaultImagePath = "../images/locations/" . htmlspecialchars($row["hinh_anh1"]); // Đường dẫn ảnh mặc định

                        // Kiểm tra xem ảnh có tồn tại hay không
                        if (!file_exists($imagePath) || empty($row["hinh_anh1"])) {
                            $imagePath = $defaultImagePath; // Sử dụng ảnh mặc định nếu ảnh không tồn tại
                        }
                        ?>
                        <img src="<?php echo $imagePath; ?>" alt="<?php echo htmlspecialchars($row["ten_dia_diem"]); ?>" class="place-image">

                        <div class="place-info">
                            <h3><?php echo $row['ten_dia_diem']; ?></h3>
                            <div class="place-details">
                                <p><i class="fas fa-map-marker-alt"></i> <?php echo $row['dia_chi']; ?></p>
                                <p><i class="fas fa-phone"></i> <?php echo $row['so_dien_thoai']; ?></p>
                                <p><i class="fas fa-clock"></i> <?php echo $row['gio_mo_cua']; ?> - <?php echo $row['gio_dong_cua']; ?></p>
                                <p><i class="fas fa-tag"></i> <?php echo $row['loai_hinh']; ?></p>
                            </div>
                            <div class="place-actions">
                                <button class="action-button edit-button"
                                    onclick="openEditModal(<?php echo $row['id']; ?>)">
                                    <i class="fas fa-edit"></i> Sửa
                                </button>
                                <button class="action-button delete-button"
                                    onclick="confirmDelete(<?php echo $row['id']; ?>)">
                                    <i class="fas fa-trash"></i> Xóa
                                </button>
                            </div>
                        </div>
                    </div>
                <?php
                endwhile;
            else:
                ?>
                <div class="no-places-message" style="text-align: center;  padding: 40px;">
                    <i class="fas fa-map-marker-alt" style="font-size: 48px; color: #ccc; margin-bottom: 20px;"></i>
                    <h2>Bạn chưa có địa điểm nào</h2>
                    <p>Hãy thêm địa điểm đầu tiên của bạn bằng cách nhấn nút "Thêm địa điểm mới" ở trên</p>
                </div>
            <?php endif; ?>
        </div>


    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
    <script>
        function openEditModal(id) {
            document.getElementById('modalTitle').textContent = 'Chỉnh sửa địa điểm';
            // Lấy thông tin địa điểm
            fetch('get_place.php?id=' + id)
                .then(response => response.json())
                .then(data => {
                    document.getElementById('place_id').value = data.id;
                    document.getElementById('ten_dia_diem').value = data.ten_dia_diem;
                    document.getElementById('dia_chi').value = data.dia_chi;
                    document.getElementById('so_dien_thoai').value = data.so_dien_thoai;
                    document.getElementById('mo_ta').value = data.mo_ta;
                    document.getElementById('gio_mo_cua').value = data.gio_mo_cua;
                    document.getElementById('gio_dong_cua').value = data.gio_dong_cua;
                    document.getElementById('loai_hinh').value = data.loai_hinh;
                    document.getElementById('gia_ca_giao_dong').value = data.gia_ca_giao_dong;
                    document.getElementById('placeModal').style.display = 'block';
                });
        }

        function closeModal() {
            document.getElementById('placeModal').style.display = 'none';
        }

        function confirmDelete(id) {
            if (confirm('Bạn có chắc chắn muốn xóa địa điểm này?')) {
                fetch('delete_place.php', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify({
                            id: id
                        })
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            document.getElementById('place-' + id).remove();
                            toastr.success('Xóa địa điểm thành công');
                        } else {
                            toastr.error('Có lỗi xảy ra');
                        }
                    });
            }
        }

        document.getElementById('placeForm').addEventListener('submit', function(e) {
            e.preventDefault();

            let formData = new FormData(this);

            fetch('save_place.php', {
                    method: 'POST',
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        closeModal();
                        location.reload(); // Reload để hiển thị changes
                        toastr.success('Lưu địa điểm thành công');
                    } else {
                        toastr.error('Có lỗi xảy ra');
                    }
                });
        });
    </script>
</body>

</html>
