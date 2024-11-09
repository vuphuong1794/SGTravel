<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sgtravel";
$port = '3306';

$conn = new mysqli($servername, $username, $password, $dbname, $port);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$error = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate and sanitize input
    $username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_STRING);
    $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
    $phoneNumber = filter_input(INPUT_POST, 'phoneNumber', FILTER_SANITIZE_STRING);
    $password = $_POST['password'];
    $confirmPassword = $_POST['confirmPassword'];
    
    // Set default values
    $phanQuyen = 2;
    $trangThai = 'hoạt động';

    // Validation
    if (empty($username) || empty($email) || empty($phoneNumber) || empty($password) || empty($confirmPassword)) {
        $error = "Vui lòng điền đầy đủ thông tin";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Email không hợp lệ";
    } elseif ($password !== $confirmPassword) {
        $error = "Mật khẩu không khớp";
    } elseif (strlen($password) < 8) {
        $error = "Mật khẩu phải có ít nhất 8 ký tự";
    } else {
        // Check if username already exists
        $stmt = $conn->prepare("SELECT ten_dang_nhap FROM tai_khoan WHERE ten_dang_nhap = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();
        
        if ($result->num_rows > 0) {
            $error = "Tên đăng nhập đã tồn tại";
        } else {
            // Hash password
            $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
            
            // Prepare and bind
            $stmt = $conn->prepare("INSERT INTO tai_khoan (ten_dang_nhap, mat_khau, phan_quyen, email, so_dien_thoai, trang_thai) VALUES (?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("ssisss", $username, $hashedPassword, $phanQuyen, $email, $phoneNumber, $trangThai);
            
            if ($stmt->execute()) {
                header("Location: Login.php");
                exit();
            } else {
                $error = "Đăng ký thất bại: " . $stmt->error;
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../style/client/Signup.css">
    <title>Đăng Ký</title>
</head>
<body>
    <div class="navbar">
        <box-icon name='left-arrow-alt' class="BackIcon" onclick="window.location.href='Trangchu.php'"></box-icon>
        <h2 class="logo">SGTravel</h2>
    </div>
    
    <div class="Register-container">
        <div class="Signup-container">
            <form class="Signup-form" method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
                <?php if (!empty($error)): ?>
                    <div class="error-message"><?php echo htmlspecialchars($error); ?></div>
                <?php endif; ?>

                <h2>Đăng Ký</h2>

                <div class="input-group">
                    <label for="email">
                        <box-icon name='envelope'></box-icon>
                        <input type="email" id="email" name="email" placeholder="Email" required>
                    </label>
                </div>

                <div class="input-group">
                    <label for="username">
                        <box-icon name='user'></box-icon>
                        <input type="text" id="username" name="username" placeholder="Tên đăng nhập" required>
                    </label>
                </div>

                <div class="input-group">
                    <label for="phoneNumber">
                        <box-icon name='phone'></box-icon>
                        <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="Số điện thoại" required>
                    </label>
                </div>

                <div class="input-group">
                    <label for="password">
                        <box-icon name='lock-alt'></box-icon>
                        <input type="password" id="password" name="password" placeholder="Mật khẩu" required>
                    </label>
                </div>

                <div class="input-group">
                    <label for="confirmPassword">
                        <box-icon name='lock-alt'></box-icon>
                        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Nhập lại mật khẩu" required>
                    </label>
                </div>

                <div class="options">
                    <label class="remember">
                        <input type="checkbox" required> Đồng ý với các điều khoản của SGTravel
                    </label>
                </div>

                <button type="submit" class="Signup-btn">Đăng ký</button>

                <p class="Login">Đã có tài khoản SGTravel? <a href="./Login.php">Đăng Nhập tại đây</a></p>
            </form>
        </div>

        <p class="Policy">Chúng tôi không sử dụng thông tin của bạn với bất kỳ mục đích nào. Bằng cách đăng nhập hoặc đăng ký, bạn đồng ý với chính sách của SGTravel</p>
    </div>

    <script src="../javascript/footer.js"></script>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
</body>
</html>