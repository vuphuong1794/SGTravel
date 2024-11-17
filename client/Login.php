<?php
include '../connect.php';

session_start();

// xử lý login
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $conn->real_escape_string($_POST['username']);
    $password = md5($_POST['password']); // Mã hóa mật khẩu người dùng nhập bằng MD5

    $sql = "SELECT * FROM tai_khoan WHERE (ten_dang_nhap = ? OR email = ?) AND trang_thai = 'hoạt động'";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $username, $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($user = $result->fetch_assoc()) {
        if ($password == $user['mat_khau']) {
            initializeSession($user);

            // nếu ấn lưu đăng nhập thì mới lưu cookie
            if (isset($_POST['remember']) && $_POST['remember'] == 'on') {
                setLoginCookie($user);
            }

            redirectBasedOnRole($user['phan_quyen']);
        } else {
            $error = "Mật khẩu không đúng";
        }
    } else {
        $error = "Tên đăng nhập hoặc mật khẩu không đúng";
    }
    $stmt->close();
    $conn->close();
}


function initializeSession($user)
{
    $_SESSION['user_id'] = $user['id'];
    $_SESSION['username'] = $user['ten_dang_nhap'];
    $_SESSION['role'] = $user['phan_quyen'];
}

function setLoginCookie($user)
{
    if (isset($_POST['remember']) && $_POST['remember'] == 'on') {
        $cookie_value = json_encode([
            'username' => $user['ten_dang_nhap'],
            'role' => $user['phan_quyen']
        ]);

        setcookie(
            'user_login',
            $cookie_value,
            time() + 3600 * 24 * 30, // Có hiệu lực trong 30 ngày
            '/',
            '',
            false,
            true
        );
    }
}

function redirectBasedOnRole($role)
{
    switch ($role) {
        case 2: // Người dùng
            header("Location: Trangchu1.php");
            break;
        case 1: // Quản trị viên
            header("Location: ../admin/Dashboard.php");
            break;
        default:
            logout();
            break;
    }
    exit();
}

function logout()
{
    session_start();
    session_destroy();

    if (isset($_COOKIE['sgtravel_login'])) {
        setcookie('sgtravel_login', '', time() - 3600, '/');
    }

    header("Location: Login.php");
    exit();
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập</title>
    <link rel="stylesheet" href="../style/client/Login.css">
</head>

<body>
    <div class="navbar">
        <box-icon name='left-arrow-alt' class="BackIcon" onclick="window.location.href='Trangchu.php'"></box-icon>
        <h2 class="logo">SGTravel</h2>
    </div>

    <div class="SignIn-container">
        <div class="login-container">
            <form class="login-form" method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
                <?php if (isset($error)): ?>
                    <div class="error-message"><?php echo htmlspecialchars($error); ?></div>
                <?php endif; ?>

                <h2>Đăng Nhập</h2>
                <div class="input-group">
                    <label for="username">
                        <box-icon name='user'></box-icon>
                        <input type="text" id="username" name="username" placeholder="Tên đăng nhập hoặc email" required>
                    </label>
                </div>
                <div class="input-group">
                    <label for="password">
                        <box-icon name='lock-alt'></box-icon>
                        <input type="password" id="password" name="password" placeholder="Mật khẩu" required>
                    </label>
                </div>
                <div class="options">
                    <label class="remember">
                        <input type="checkbox" name="remember"> Lưu đăng nhập
                    </label>
                    <a href="forgot-password.php" class="forgot-password">Quên mật khẩu</a>
                </div>
                <button type="submit" class="login-btn">Đăng nhập</button>
                <p class="register">Chưa có tài khoản SGTravel? <a href="Signup.php">Đăng kí tại đây</a></p>
            </form>
        </div>

        <p class="Policy">Chúng tôi không sử dụng thông tin của bạn với bất kỳ mục đích nào. Bằng cách đăng nhập hoặc đăng ký, bạn đồng ý với chính sách của SGTravel</p>
    </div>

    <script src="../javascript/footer.js"></script>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
</body>

</html>