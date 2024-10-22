<?php
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
echo "Kết nối thành công";
?>