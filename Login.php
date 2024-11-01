<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/Login.css">
    <title>Đăng Nhập</title>
</head>

<body>
<?php
session_start();
require("connect.php");

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $username = $_POST['username'];
    $password = md5($_POST['password']); // Hash the password

    $sql = "SELECT count(*) FROM tai_khoan WHERE ten_dang_nhap='$username' AND mat_khau='$password'";
    $result = mysqli_query($conn, $sql); // Pass $conn as the connection

    if ($result && mysqli_fetch_array($result)[0] > 0) { // Check if user exists
        echo 'Đăng nhập thành công';
        header("Location: Trangchu.php");
        $_SESSION["user"] = $username; // Save username to session

        exit(); // Stop further execution after redirection
    } else {
        echo 'Đăng nhập thất bại';
        header("Location: login.php"); // Redirect to login page if credentials are wrong
        exit(); // Stop further execution after redirection
    }
}
?>
    <!-- Navbar -->
    <div class="navbar">
        <box-icon name='left-arrow-alt' class="BackIcon" onclick="window.location.href='Trangchu.php'"></box-icon>
        <h2 class="logo">SGTravel</h2>
    </div>
    <div class="SignIn-container">

        <!-- Login -->
        <div class="login-container">
            <form class="login-form" method="$_POST">
                <h2>Đăng Nhập</h2>

                <div class="input-group">
                    <label for="username">
                        <box-icon name='user'></box-icon>
                        <input type="text" name="username" id="username" placeholder="Tên đăng nhập hoặc email" required>
                    </label>
                </div>

                <div class="input-group">
                    <label for="password">
                        <box-icon name='lock-alt'></box-icon>
                        <input type="password" name="password" id="password" placeholder="Mật khẩu" required>
                    </label>
                </div>

                <div class="options">
                    <label class="remember">
                        <input type="checkbox"> Lưu đăng nhập
                    </label>
                    <a href="#" class="forgot-password">Quên mật khẩu</a>
                </div>

                <button type="submit" class="login-btn">Đăng nhập</button>

                <p class="register">chưa có tài khoản SGTravel? <a href="Signup.html">Đăng kí tại đây</a></p>
            </form>
        </div>

        <!-- policy -->
        <p class="Policy">Chúng tôi không sử dụng thông tin của bạn với bất kỳ mục đích nào. Bằng cách đăng nhập hoặc
            đăng ký, bạn đồng ý với chính sách của SGTravel</p>
    </div>
    <?php

    ?>
    <!-- Footer -->    
    <script src="footer.js"></script>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
</body>

</html>