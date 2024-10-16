document.addEventListener('DOMContentLoaded', () => {
    const themeToggle = document.getElementById('theme-toggle');
    const body = document.body;

    // Kiểm tra nếu người dùng đã chọn chế độ trước đó (lưu trữ trong localStorage)
    if (localStorage.getItem('theme') === 'dark') {
        body.classList.replace('light-theme', 'dark-theme');
        themeToggle.checked = true;
    } else {
        body.classList.replace('dark-theme', 'light-theme');
    }

    // Thay đổi theme khi người dùng nhấn vào công tắc
    themeToggle.addEventListener('change', () => {
        if (themeToggle.checked) {
            body.classList.replace('light-theme', 'dark-theme');
            localStorage.setItem('theme', 'dark');
        } else {
            body.classList.replace('dark-theme', 'light-theme');
            localStorage.setItem('theme', 'light');
        }
    });
});

