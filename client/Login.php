<?php
//sử dụng cookie cho lưu đăng nhập
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'sgtravel');
define('DB_PORT', '3306');

// Cấu hình Cookie 
define('COOKIE_NAME', 'sgtravel_login');
define('COOKIE_DURATION',  20); // test 20 giây

// Cấu hình Role 
define('ROLE_USER', 2);
define('ROLE_ADMIN', 1);

// chuyển trang phụ thuộc vào Role
function redirectBasedOnRole($role)
{
    switch ($role) {
        case ROLE_USER:
            header("Location: Trangchu1.php");
            break;
        case ROLE_ADMIN:
            header("Location: ../admin/Dashboard.php");
            break;
        default:
            logout();
            break;
    }
    exit();
}

function connectDB()
{
    try {
        $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME, DB_PORT);

        if ($conn->connect_error) {
            throw new Exception("Connection failed: " . $conn->connect_error);
        }

        $conn->set_charset("utf8mb4");
        return $conn;
    } catch (Exception $e) {
        error_log($e->getMessage());
        die("Không thể kết nối đến database.");
    }
}

function logout()
{
    session_start();
    session_destroy();

    if (isset($_COOKIE[COOKIE_NAME])) {
        setcookie(COOKIE_NAME, '', time() - 3600, '/');
    }

    header("Location: Login.php");
    exit();
}

session_start();

// kiểm tra cookie có tồn tại
if (!isset($_SESSION['user_id']) && isset($_COOKIE[COOKIE_NAME])) {
    $cookie_data = json_decode($_COOKIE[COOKIE_NAME], true);

    if ($cookie_data) {
        $_SESSION['user_id'] = $cookie_data['user_id'];
        $_SESSION['username'] = $cookie_data['username'];
        $_SESSION['role'] = $cookie_data['role'];

        redirectBasedOnRole($cookie_data['role']);
    }
}

// xử lý login
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $conn = connectDB();

    $username = $conn->real_escape_string($_POST['username']);
    $password = $_POST['password'];
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
    // Log hashedPassword to the console
    echo "<script>console.log('Hashed Password: " . $hashedPassword . "');</script>";
    $sql = "SELECT * FROM tai_khoan WHERE (ten_dang_nhap = ? OR email = ?) AND trang_thai = 'hoạt động'";

    if ($stmt = $conn->prepare($sql)) {
        $stmt->bind_param("ss", $username, $username);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($user = $result->fetch_assoc()) {
            $storedPassword = $user['mat_khau'];

            if (password_verify($password, $storedPassword)) {
                // Password is hashed and valid
                initializeSession($user);
                setLoginCookie($user);
                redirectBasedOnRole($user['phan_quyen']);
            } elseif ($storedPassword === $hashedPassword) {
                // Password is stored as plaintext
                $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
                updatePasswordHash($conn, $user['id'], $hashedPassword); // Update with hashed password

                initializeSession($user);
                setLoginCookie($user);
                redirectBasedOnRole($user['phan_quyen']);
            } else {
                $error = "Mật khẩu không đúng";
            }
        } else {
            $error = "Tên đăng nhập hoặc mật khẩu không đúng";
        }

        $stmt->close();
    } else {
        $error = "Lỗi hệ thống, vui lòng thử lại sau";
    }

    $conn->close();
}




// Hàm hỗ trợ
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
            'user_id' => $user['id'],
            'username' => $user['ten_dang_nhap'],
            'role' => $user['phan_quyen']
        ]);

        setcookie(
            COOKIE_NAME,
            $cookie_value,
            time() + COOKIE_DURATION,
            '/',
            '',
            false,
            true
        );
    }
}

function updatePasswordHash($conn, $user_id, $hashed_password)
{
    $update_sql = "UPDATE tai_khoan SET mat_khau = ? WHERE id = ?";
    if ($update_stmt = $conn->prepare($update_sql)) {
        $update_stmt->bind_param("si", $hashed_password, $user_id);
        $update_stmt->execute();
        $update_stmt->close();
    }
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
                <p class="register">Chưa có tài khoản SGTravel? <a href="Signup.html">Đăng kí tại đây</a></p>
            </form>
        </div>

        <p class="Policy">Chúng tôi không sử dụng thông tin của bạn với bất kỳ mục đích nào. Bằng cách đăng nhập hoặc đăng ký, bạn đồng ý với chính sách của SGTravel</p>
    </div>

    <script src="../javascript/footer.js"></script>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
</body>

</html>