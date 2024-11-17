<?php   
// Check if the session is already started  
if (session_status() === PHP_SESSION_NONE) {  
    session_start();   
}  
include '../connect.php';  

$userNameFromDB = 'Khách';  
$userLoggedIn = false;  

if (isset($_SESSION['user_id'])) {  
    $userId = $_SESSION['user_id'];  
    $stmt = $conn->prepare("SELECT ten_dang_nhap FROM tai_khoan WHERE id = ?");  
    $stmt->bind_param("i", $userId);  
    $stmt->execute();  
    $result = $stmt->get_result();  
    
    if ($result && $result->num_rows > 0) {  
        $user = $result->fetch_assoc();  
        $userNameFromDB = $user['ten_dang_nhap'];  
        $userLoggedIn = true;   
    }  
    $stmt->close();  
}  
?>  

<script>  
document.addEventListener('DOMContentLoaded', function() {  
    const navbarCSS = document.createElement('link');  
    navbarCSS.rel = 'stylesheet';  
    navbarCSS.href = '../style/navbar.css';  
    document.head.appendChild(navbarCSS);  

    const username = "<?php echo htmlspecialchars($userNameFromDB); ?>";  
    const userLoggedIn = <?php echo json_encode($userLoggedIn); ?>;   

    const navbar = `  
        <div class="navbar" id="navbar">  
            <div class="nav-container">  
                <h2 class="nav-logo" onclick="window.location.href='Trangchu.php'"><b>SGTravel</b></h2>  
                <div class="searchbox-container">  
                    <input type="text" id="searchbox" placeholder="Tìm kiếm" />  
                    <box-icon name='search-alt-2' class="icon" id="search-icon" style="margin:8px"></box-icon>  
                </div>  
                <label class="switch">  
                    <input type="checkbox" id="theme-toggle">  
                    <span class="slider-navbar"></span>  
                </label>  
                <div class="user-container">  
                    ${userLoggedIn ? `  
                        <span class="hello-message">Hello, ${username}!</span>  
                        <button class="create-btn"><a href="ThemDiaDiem.php" style="text-decoration: none; color: black">Tạo địa điểm</a></button>  
                        <button class="login-btn"><a href="Logout.php" style="text-decoration: none; color: black">Đăng Xuất</a></button>  
                    ` : `  
                        <button class="signUp-btn"><a href="Signup.php" style="text-decoration: none; color: black">Đăng ký</a></button>  
                        <button class="login-btn"><a href="Login.php" style="text-decoration: none; color: black">Đăng nhập</a></button>  
                    `}  
                    <a href="UserProfile.php" style="text-decoration: none; margin-left:30px; margin-right:10px   "><box-icon type='solid' name='user'></box-icon></a>
                </div>  
            </div>  
        </div>  
    `;  

    document.body.insertAdjacentHTML('afterbegin', navbar);;  

    document.getElementById('search-icon').addEventListener('click', function() {  
        const searchQuery = document.getElementById('searchbox').value.trim();  
        if (searchQuery) {  
            window.location.href = `Trangchu.php?tendiadiem=${encodeURIComponent(searchQuery)}`;  
        } else {  
            alert('Vui lòng nhập từ khóa để tìm kiếm!');  
        }  
    });  
});  
</script>