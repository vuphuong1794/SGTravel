

document.addEventListener('DOMContentLoaded', function() {

    // Thêm sự kiện click vào biểu tượng tìm kiếm
    document.getElementById('search-icon').addEventListener('click', function() {
        const searchQuery = document.getElementById('searchbox').value.trim();
        if (searchQuery) {
            window.location.href = `Trangchu.php?tendiadiem=${encodeURIComponent(searchQuery)}`;
        } else {
            alert('Vui lòng nhập từ khóa để tìm kiếm!');
        }
    });
});
