<?php
session_start();

// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sgtravel";
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Retrieve form data and sanitize
$tenDiaDiem = $conn->real_escape_string($_POST['ten_dia_diem']);
$moTa = $conn->real_escape_string($_POST['mo_ta']);
$soDienThoai = $conn->real_escape_string($_POST['so_dien_thoai']);
$giaMin = $conn->real_escape_string($_POST['gia_min']);
$giaMax = $conn->real_escape_string($_POST['gia_max']);
$gioMoCua = $conn->real_escape_string($_POST['gio_mo_cua']);
$gioDongCua = $conn->real_escape_string($_POST['gio_dong_cua']);
$tinh = $conn->real_escape_string($_POST['tinh']);
$huyen = $conn->real_escape_string($_POST['huyen']);
$xa = $conn->real_escape_string($_POST['xa']);
$diaChi = $conn->real_escape_string($_POST['dia_chi']);

/// Handle image upload
$targetDir = "uploads/";  // Make sure this directory exists and has write permissions

$hinhAnh1 = null;
if (isset($_FILES['hinh_anh1']) && $_FILES['hinh_anh1']['error'] == UPLOAD_ERR_OK) {
    $hinhAnh1 = $targetDir . basename($_FILES['hinh_anh1']['name']);
    move_uploaded_file($_FILES['hinh_anh1']['tmp_name'], $hinhAnh1);
}

$hinhAnh2 = null;
if (isset($_FILES['hinh_anh2']) && $_FILES['hinh_anh2']['error'] == UPLOAD_ERR_OK) {
    $hinhAnh2 = $targetDir . basename($_FILES['hinh_anh2']['name']);
    move_uploaded_file($_FILES['hinh_anh2']['tmp_name'], $hinhAnh2);
}

// Create SQL query to insert data
$query = "INSERT INTO dia_diem (ten_dia_diem, mo_ta, gia_ca_giao_dong, gio_mo_cua, gio_dong_cua, dia_chi, hinh_anh1, hinh_anh2) 
          VALUES ('$tenDiaDiem', '$moTa', '$soDienThoai', '$giaMin - $giaMax', '$gioMoCua', '$gioDongCua', '$diaChi', '$hinhAnh1', '$hinhAnh2')";

if ($conn->query($query) === TRUE) {
    echo "Địa điểm đã được thêm thành công!";
} else {
    echo "Lỗi: " . $conn->error;
}

$conn->close();
?>
