<?php
session_start();
include '../connect.php';

// Kiểm tra xem người dùng đã đăng nhập chưa
if (!isset($_SESSION['user_id'])) {
    echo "Bạn cần đăng nhập để chỉnh sửa thông tin.";
    exit();
}

// Lấy ID người dùng từ session
$user_id = $_SESSION['user_id'];

// Truy vấn thông tin người dùng hiện tại
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $user_query = "SELECT * FROM tai_khoan WHERE id = '$user_id'";
    $user_result = mysqli_query($conn, $user_query);
    $user_info = mysqli_fetch_assoc($user_result);
}

// Xử lý khi người dùng nhấn nút cập nhật
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $ten_dang_nhap = $_POST['ten_dang_nhap'];
    $email = $_POST['email'];
    $so_dien_thoai = $_POST['so_dien_thoai'];

    $update_query = "
        UPDATE tai_khoan 
        SET ten_dang_nhap = '$ten_dang_nhap', email = '$email', so_dien_thoai = '$so_dien_thoai' 
        WHERE id = '$user_id'";

    if (mysqli_query($conn, $update_query)) {
        echo "Cập nhật thông tin thành công!";
        header('Location: UserProfile.php'); // Quay về trang thông tin cá nhân
        exit();
    } else {
        echo "Lỗi khi cập nhật thông tin: " . mysqli_error($conn);
    }
}
?>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh Sửa Thông Tin</title>
    <style>
        /* General reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            line-height: 1.6;
        }

        /* Profile container styling */
        .profile-container-edit {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        /* Heading styling */
        h2 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* Table styling */
        table {
            width: 100%;
            border-spacing: 15px;
        }

        table td {
            padding: 8px;
        }

        table label {
            font-size: 16px;
            color: #555;
        }

        table input {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Button styling */
        .button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #45a049;
        }

        /* Responsive styling */
        @media (max-width: 768px) {
            .profile-container-edit {
                width: 90%;
            }
        }
    </style>
</head>

<body>
    <!-- Navbar -->
    <script src="../javascript/navbar.js"></script>
    <div class="profile-container-edit">
        <h2>Chỉnh Sửa Thông Tin</h2>
        <form action="EditUser.php" method="POST">
            <table>
                <tr>
                    <td><label for="ten_dang_nhap">Tên đăng nhập:</label></td>
                    <td><input type="text" id="ten_dang_nhap" name="ten_dang_nhap" value="<?php echo htmlspecialchars($user_info['ten_dang_nhap']); ?>" required></td>
                </tr>
                <tr>
                    <td><label for="email">Email:</label></td>
                    <td><input type="email" id="email" name="email" value="<?php echo htmlspecialchars($user_info['email']); ?>" required></td>
                </tr>
                <tr>
                    <td><label for="so_dien_thoai">Số điện thoại:</label></td>
                    <td><input type="text" id="so_dien_thoai" name="so_dien_thoai" value="<?php echo htmlspecialchars($user_info['so_dien_thoai']); ?>"></td>
                </tr>

            </table>
            <button type="submit" class="button">Cập nhật</button>
        </form>
    </div>
</body>

</html>