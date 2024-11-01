document.addEventListener('DOMContentLoaded', function() {
    const navbarCSS = document.createElement('link');
    navbarCSS.rel = 'stylesheet';
    navbarCSS.href = 'style/navbar.css';
    document.head.appendChild(navbarCSS);
    const navbar = `
        <?php
        session_start();
        $_SESSION
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "sgtravel"; 
        $port = '3306'; 
        // Tạo kết nối
        $conn = new mysqli($servername, $username, $password, $dbname, $port);

        //Lựa chọn db cần thao tác
        mysqli_select_db($connect,"baitapphpsql") or die ("DB không tồn tại");
        ?>

        <div class="navbar" id="navbar">
            <div class="nav-container">
                <a href="/Trangchu.php" style="text-decoration: none;"><h2 class="nav-logo"><b>SGTravel</b></h2></a>
                <div class="searchbox-container">
                    <form action="Trangchu.php" method="get">
                        <input type="text" name="search" id="searchbox" placeholder="Tìm kiếm" />
                        <button type="submit" class="icon-button">
                            <box-icon name="search-alt-2" class="icon"></box-icon>
                        </button>
                    </form>
                </div>
                <label class="switch">
                    <input type="checkbox" id="theme-toggle">
                    <span class="slider-navbar" for="theme-toggle"></span>
                </label>
                <div class="user-container">
                    <button class="signUp-btn"><a href="Signup.php" style="text-decoration: none; color: black">Đăng ký</a></button>
                    <button class="login-btn"><a href="Login.php" style="text-decoration: none; color: black">Đăng nhập</a></button>
                    <box-icon name='bell'></box-icon>
                </div>
            </div>
        </div>
    `;

    document.body.insertAdjacentHTML('afterbegin', navbar);
});