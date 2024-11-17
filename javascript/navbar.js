

document.addEventListener('DOMContentLoaded', function() {
    const navbarCSS = document.createElement('link');
    navbarCSS.rel = 'stylesheet';
    navbarCSS.href = '../style/navbar.css';
    document.head.appendChild(navbarCSS);

    const navbar = `
        <div class="navbar" id="navbar">
            <div class="nav-container">
                <h2 class="nav-logo" onclick="window.location.href='Trangchu.php'"><b>SGTravel</b></h2>
                <div class="searchbox-container">
                    <input type="text" id="searchboxDiaDiem" placeholder="Địa điểm" />
                    <input type="text" id="searchboxGiaCa" placeholder="Phân khúc giá" />
                    <input type="text" id="searchboxChatLuong" placeholder="Chất lượng dịch vụ" />
                    <box-icon name='search-alt-2' class="icon" id="search-icon"></box-icon>
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

    // Thêm sự kiện click vào biểu tượng tìm kiếm
    document.getElementById('search-icon').addEventListener('click', function() {
        const searchQueryDD = document.getElementById('searchboxDiaDiem').value.trim();
        const searchQueryGC = document.getElementById('searchboxGiaCa').value.trim();
        const searchQueryCL = document.getElementById('searchboxChatLuong').value.trim();
        if (searchQueryDD||searchQueryGC||searchQueryCL) {
            if (!searchQueryDD){
                searchQueryDD="null";
            }
            if (!searchQueryGC){
                searchQueryGC="null";
            }
            if (!searchQueryCL){
                searchQueryCL="null";
            }
            window.location.href = `Trangchu.php?tendiadiem=${encodeURIComponent(searchQueryDD)} gc=${encodeURIComponent(searchQueryGC)} cl=${encodeURIComponent(searchQueryCL)}`;
        } else {
            alert('Vui lòng nhập từ khóa để tìm kiếm!');
        }
    });
});
