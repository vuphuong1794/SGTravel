<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sgtravel";
$port = '3306';

$conn = new mysqli($servername, $username, $password, $dbname, $port);

if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Set default username
$userNameFromDB = 'Khách';

if (isset($_SESSION['user_id'])) {
    $userId = $_SESSION['user_id'];
    $query = "SELECT ten_dang_nhap FROM tai_khoan WHERE id = '$userId'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        $userNameFromDB = $user['ten_dang_nhap'];
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $ten_dia_diem = $_POST['ten_dia_diem'];
    $dia_chi = $_POST['dia_chi'];
    $so_dien_thoai = $_POST['so_dien_thoai'];
    $mo_ta = $_POST['mo_ta'];
    $gia_nho_nhat = $_POST['gia_nho_nhat'];
    $gia_lon_nhat = $_POST['gia_lon_nhat'];
    $gio_mo_cua = $_POST['gio_mo_cua'];
    $gio_dong_cua = $_POST['gio_dong_cua'];

    $hinh_anh1 = $_FILES['hinh_anh1']['name'];
    $hinh_anh2 = $_FILES['hinh_anh2']['name'];
    $hinh_anh3 = $_FILES['hinh_anh3']['name'];

    move_uploaded_file($_FILES['hinh_anh1']['tmp_name'], "../images/locations/" . $hinh_anh1);
    move_uploaded_file($_FILES['hinh_anh2']['tmp_name'], "../images/locations/" . $hinh_anh2);
    move_uploaded_file($_FILES['hinh_anh3']['tmp_name'], "../images/locations/" . $hinh_anh3);

    $sql = "INSERT INTO dia_diem (ten_dia_diem, dia_chi, so_dien_thoai, mo_ta, gio_mo_cua, gio_dong_cua, gia_ca_giao_dong, hinh_anh1, hinh_anh2, hinh_anh3)
            VALUES ('$ten_dia_diem', '$dia_chi', '$so_dien_thoai', '$mo_ta', '$gio_mo_cua', '$gio_dong_cua', '$gia_nho_nhat - $gia_lon_nhat', '$hinh_anh1', '$hinh_anh2', '$hinh_anh3')";

    if ($conn->query($sql) === TRUE) {
        echo "Địa điểm mới đã được tạo thành công!";
    } else {
        echo "Lỗi: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../style/client/ThemSp.css">
    <title>Thêm Địa Điểm</title>
</head>
<body>
    <div class="nav-container">
        <a href="Trangchu1.php" style="text-decoration: none; color: black"><h2 class="nav-logo"><b>SGTravel</b></h2></a>
        <div class="nav-right">
            <a href="#"><box-icon name="bell"></box-icon></a>
            <span class="userName"><?php echo htmlspecialchars($userNameFromDB); ?></span>
        </div>
    </div>

    <div class="body">
        <form action="" method="post" enctype="multipart/form-data">
            <div class="body-left">
                <h3>Hình ảnh địa điểm</h3>
                <div class="image-container">
                    <label>
                        <input type="file" name="hinh_anh1" accept="image/*" onchange="previewImage(event, 'preview1')" style="display:none;">
                        <img id="preview1" src="#" alt="Hình ảnh 1" style="display: none;">
                        <p>Thêm ảnh 1</p>
                    </label>
                    <label>
                        <input type="file" name="hinh_anh2" accept="image/*" onchange="previewImage(event, 'preview2')" style="display:none;">
                        <img id="preview2" src="#" alt="Hình ảnh 2" style="display: none;">
                        <p>Thêm ảnh 2</p>
                    </label>
                    <label>
                        <input type="file" name="hinh_anh3" accept="image/*" onchange="previewImage(event, 'preview3')" style="display:none;">
                        <img id="preview3" src="#" alt="Hình ảnh 3" style="display: none;">
                        <p>Thêm ảnh 3</p>
                    </label>
                </div>
            </div>

            <div class="body-mid">
                <input type="text" name="ten_dia_diem" placeholder="Tên địa điểm">
                <input type="text" name="dia_chi" placeholder="Địa chỉ">
                <input type="text" name="so_dien_thoai" placeholder="Số điện thoại">
                <input type="text" name="mo_ta" placeholder="Mô tả">
            </div>

            <div class="body-right">
                <input type="text" name="gia_nho_nhat" placeholder="Giá nhỏ nhất">
                <input type="text" name="gia_lon_nhat" placeholder="Giá lớn nhất">
                <input type="time" name="gio_mo_cua" placeholder="Giờ mở cửa">
                <input type="time" name="gio_dong_cua" placeholder="Giờ đóng cửa">
            </div>

            <button type="submit">Tạo địa điểm</button>
        </form>
    </div>

    <script>
        function previewImage(event, previewId) {
            const preview = document.getElementById(previewId);
            preview.src = URL.createObjectURL(event.target.files[0]);
            preview.style.display = 'block';
        }
    </script>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
</body>
</html>
