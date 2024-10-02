document.addEventListener("DOMContentLoaded", function () {
    const footerCSS = document.createElement('link');
    footerCSS.rel = 'stylesheet';
    footerCSS.href = 'style/footer.css';
    document.head.appendChild(footerCSS);
    const footer = `
<footer>
    <div class="footer-container">
        <div class="footer-column">
            <h3>Khám phá</h3>
            <ul>
                <li><a href="#">Ứng dụng Mobile</a></li>
                <li><a href="#">Tạo bộ sưu tập</a></li>
                <li><a href="#">Bảo mật thông tin</a></li>
                <li><a href="#">Quy định</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h3>Công ty</h3>
            <ul>
                <li><a href="#">Giới thiệu</a></li>
                <li><a href="#">Trợ giúp</a></li>
                <li><a href="#">Việc làm</a></li>
                <li><a href="#">Quy chế</a></li>
                <li><a href="#">Thỏa thuận sử dụng dịch vụ</a></li>
                <li><a href="#">Liên hệ</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h3>Tham gia trên</h3>
            <ul>
                <li><a href="#">Facebook</a></li>
                <li><a href="#">Instagram</a></li>
                <li><a href="#">Youtube</a></li>
                <li><a href="#">Google</a></li>
                <li><a href="#">ShopeeFood.vn - Giao đồ ăn tận nơi</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h3>Giấy phép</h3>
            <ul>
                <li><a href="#">ABC 12345</a></li>
            </ul>
            <img src="images/giayphep.png" alt="Đã đăng ký" class="registration-badge">
        </div>
    </div>
</footer>`;

  document.body.insertAdjacentHTML("beforeend", footer);
});
