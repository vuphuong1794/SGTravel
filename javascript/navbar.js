document.addEventListener('DOMContentLoaded', function() {
    const navbarCSS = document.createElement('link');
    navbarCSS.rel = 'stylesheet';
    navbarCSS.href = '../style/navbar.css';
    document.head.appendChild(navbarCSS);
    const navbar = `
        <div class="navbar" id="navbar">
            <div class="nav-container">
                <h2 class="nav-logo" onclick="window.location.href='Trangchu.php'"><b>SGTravel</b></h2></a>
                <div class="searchbox-container">
                    <input type="text" id="searchbox" placeholder="Tìm kiếm" />
                    <box-icon name='search-alt-2' class="icon"></box-icon>
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