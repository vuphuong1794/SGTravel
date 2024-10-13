document.addEventListener('DOMContentLoaded', function() {
    const navbarCSS = document.createElement('link');
    navbarCSS.rel = 'stylesheet';
    navbarCSS.href = 'style/navbar.css';
    document.head.appendChild(navbarCSS);
    const navbar = `
        <div class="navbar">
            <div class="nav-container">
                <a href="/Trangchu.html" style="text-decoration: none;"><h2 class="nav-logo"><b>SGTravel</b></h2></a>
                <div class="searchbox-container">
                    <input type="text" id="searchbox" placeholder="Tìm kiếm" />
                    <box-icon name='search-alt-2' class="icon"></box-icon>
                </div>
                <div class="user-container">
                    <button class="signUp-btn"><a href="Signup.html" style="text-decoration: none; color: black">Đăng ký</a></button>
                    <button class="login-btn"><a href="Login.html" style="text-decoration: none; color: black">Đăng nhập</a></button>
                    <box-icon name='bell'></box-icon>
                </div>
            </div>
        </div>
    `;

    document.body.insertAdjacentHTML('afterbegin', navbar);
});