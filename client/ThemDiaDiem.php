<?php
session_start();
include '../connect.php';

$userNameFromDB = isset($_SESSION['user_id']) ? 
    ($conn->query("SELECT ten_dang_nhap FROM tai_khoan WHERE id = '{$_SESSION['user_id']}'")->fetch_assoc()['ten_dang_nhap'] ?? 'Khách') 
    : 'Khách';
// Kiểm tra và tạo các cột ảnh mới nếu cần
function checkAndCreateImageColumns($conn)
{
    $result = $conn->query("SHOW COLUMNS FROM dia_diem LIKE 'hinh_anh%'");
    $existing_columns = [];
    while ($row = $result->fetch_assoc()) {
        $existing_columns[] = $row['Field'];
    }

    $highest_number = 0;
    foreach ($existing_columns as $column) {
        $number = (int)str_replace('hinh_anh', '', $column);
        $highest_number = max($highest_number, $number);
    }

    // Thêm các cột mới nếu cần
    if (isset($_POST['image_count']) && $_POST['image_count'] > $highest_number) {
        for ($i = $highest_number + 1; $i <= $_POST['image_count']; $i++) {
            $sql = "ALTER TABLE dia_diem ADD COLUMN hinh_anh$i TEXT DEFAULT NULL";
            if (!$conn->query($sql)) {
                die("Lỗi khi thêm cột: " . $conn->error);
            }
        }
        $highest_number = $_POST['image_count'];
    }
    return $highest_number;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $current_columns = checkAndCreateImageColumns($conn);

    $ten_dia_diem = $_POST['ten_dia_diem'];
    $dia_chi = $_POST['dia_chi'];
    $so_dien_thoai = $_POST['so_dien_thoai'];
    $mo_ta = $_POST['mo_ta'];
    $link_dia_diem = $_POST['link_dia_diem'];
    $gia_ca_giao_dong = $_POST['gia_nho_nhat'] . ' - ' . $_POST['gia_lon_nhat'];
    $gio_mo_cua = $_POST['gio_mo_cua'];
    $gio_dong_cua = $_POST['gio_dong_cua'];
    $loai_hinh = $_POST['loai_hinh'];
    $nguoi_tao_id = $_SESSION['user_id']; // Check if this value is correct
    echo "User ID being inserted: " . $nguoi_tao_id;

    $sqlCheckUser = "SELECT id FROM tai_khoan WHERE id = '$nguoi_tao_id'";
    $result = $conn->query($sqlCheckUser);
    if ($result->num_rows === 0) {
        echo "Error: User ID does not exist in tai_khoan table.";
        exit;
    }


    // Xử lý upload ảnh
    $image_columns = "";
    $image_values = "";
    $image_count = isset($_POST['image_count']) ? (int)$_POST['image_count'] : 3;

    
    $sql="SELECT MAX(id) AS max_id FROM dia_diem";
    $resultMAXid = $conn->query($sql);
    


    // Fetch the result and increment the max ID by 1
    if ($resultMAXid && $row = $resultMAXid->fetch_assoc()) {
        $next_id = $row['max_id'] + 1;
    } else {
        // Handle the case where the table is empty, starting from 1
        $next_id = 1;
    }
    $sql1="ALTER TABLE dia_diem AUTO_INCREMENT = $next_id";
    $resultReplaceSQL1 = $conn->query($sql1);

    // Loop to handle image uploads
    for ($i = 1; $i <= $image_count; $i++) {
        if (isset($_FILES["hinh_anh$i"]) && $_FILES["hinh_anh$i"]['name'] != '') {
            // Automatically create a folder when adding a new place
            $folderName = "diadiem" . $next_id;
            $folderPath = "../images/$folderName/";

            // Check if the folder exists, if not, create it
            if (!is_dir($folderPath)) {
                mkdir($folderPath, 0777, true);
            }

            $hinh_anh = mysqli_real_escape_string($conn, $_FILES["hinh_anh$i"]['name']);
            if (move_uploaded_file($_FILES["hinh_anh$i"]['tmp_name'], $folderPath . $hinh_anh)) {
                // Successfully moved the file
                $image_columns .= ", hinh_anh$i";
                $image_values .= ", '/images/$folderName/$hinh_anh'";
            } else {
                // Handle the case where the file couldn't be moved
                echo "Failed to upload image $i.";
            }
        } else {
            // Handle the case where the image was not sent
            $image_columns .= ", hinh_anh$i";
            $image_values .= ", NULL";
        }
    }


    $sql = "INSERT INTO dia_diem (
        ten_dia_diem, 
        dia_chi, 
        so_dien_thoai, 
        mo_ta, 
        gio_mo_cua, 
        gio_dong_cua, 
        loai_hinh,
        gia_ca_giao_dong, 
        link_dia_diem,
        diem_trung_binh,
        so_luot_danh_gia,
        id_nguoi_dang
        $image_columns
    ) VALUES (
        '$ten_dia_diem',
        '$dia_chi',
        '$so_dien_thoai',
        '$mo_ta',
        '$gio_mo_cua',
        '$gio_dong_cua',
        '$loai_hinh',
        '$gia_ca_giao_dong',
        '$link_dia_diem',
        0,
        0,
        '$nguoi_tao_id'
        $image_values
    )";

    if ($conn->query($sql) === TRUE) {
        echo "<script>alert('Địa điểm mới đã được tạo thành công!');</script>";
    } else {
        echo "<script>alert('Lỗi: " . $conn->error . "');</script>";
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../style/client/ThemDiaDiem.css">
    <title>Thêm Địa Điểm</title>
    <style>
        .image-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .image-upload-box {
            width: 150px;
            height: 150px;
            border: 2px dashed #ccc;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            position: relative;
        }

        .image-upload-box img {
            max-width: 100%;
            max-height: 100%;
            object-fit: cover;
        }

        .add-image-btn {
            width: 150px;
            height: 150px;
            border: 2px dashed #ccc;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 24px;
        }

        .remove-image {
            position: absolute;
            top: 5px;
            right: 5px;
            background: rgba(255, 0, 0, 0.7);
            color: white;
            border: none;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
</head>

<body>
    <div class="nav-container">
        <a href="Trangchu.php" style="text-decoration: none; color: black">
            <h2 class="nav-logo"><b>SGTravel</b></h2>
        </a>
        <div class="nav-right">
            <a href="#"><box-icon name="bell"></box-icon></a>
            <span class="userName"><?php echo htmlspecialchars($userNameFromDB); ?></span>
        </div>
    </div>

    <div class="body">
        <form action="" method="post" enctype="multipart/form-data">
            <div class="body-left">
                <h3>Hình ảnh địa điểm</h3>
                <div class="image-container" id="imageContainer">
                    <input type="hidden" name="image_count" id="imageCount" value="3">
                </div>
            </div>

            <div class="body-mid">
                <input type="text" name="ten_dia_diem" placeholder="Tên địa điểm" required>
                <input type="text" name="dia_chi" placeholder="Địa chỉ" required>
                <input type="text" name="so_dien_thoai" placeholder="Số điện thoại" required>
                <textarea name="mo_ta" placeholder="Mô tả" required></textarea>
                <input type="text" name="link_dia_diem" placeholder="Link địa điểm" required>
                <select name="loai_hinh" required>
                    <option value="">Chọn loại hình</option>
                    <option value="Ẩm thực">Ẩm thực</option>
                    <option value="Du lịch">Du lịch</option>
                    <option value="Giải trí">Giải trí</option>
                </select>
                <span style="color: blue">Lưu ý: Cách lấy link địa điểm trên Google Map, Nhập địa chỉ trên Google Map, Chuyển đổi sang link dạng embed</span>
            </div>

            <div class="body-right">
                <input type="number" name="gia_nho_nhat" placeholder="Giá nhỏ nhất" required>
                <input type="number" name="gia_lon_nhat" placeholder="Giá lớn nhất" required>
                <input type="time" name="gio_mo_cua" required>
                <input type="time" name="gio_dong_cua" required>
            </div>
            <button type="submit">Tạo địa điểm</button>
        </form>
    </div>

    <script>
        let imageCount = 3;
        const imageContainer = document.getElementById('imageContainer');
        const imageCountInput = document.getElementById('imageCount');

        function createImageUploadBox(index) {
            const box = document.createElement('div');
            box.className = 'image-upload-box';
            box.innerHTML = `
                <input type="file" name="hinh_anh${index}" accept="image/*" style="display:none;" onchange="handleImageChange(event, ${index})" ${index <= 3 ? 'required' : ''}>
                <img id="preview${index}" src="#" alt="Hình ảnh ${index}" style="display: none;">
                <p>Thêm ảnh ${index}</p>
                <button type="button" class="remove-image" style="display:none;" onclick="removeImage(${index})">×</button>
            `;
            box.addEventListener('click', function(e) {
                if (e.target !== this) return;
                this.querySelector('input[type="file"]').click();
            });
            return box;
        }

        function createAddButton() {
            const addBtn = document.createElement('div');
            addBtn.className = 'add-image-btn';
            addBtn.innerHTML = '+';
            addBtn.onclick = addNewImageBox;
            return addBtn;
        }

        function initializeImageBoxes() {
            for (let i = 1; i <= imageCount; i++) {
                imageContainer.appendChild(createImageUploadBox(i));
            }
            imageContainer.appendChild(createAddButton());
        }

        function handleImageChange(event, index) {
            const file = event.target.files[0];
            if (file) {
                const preview = document.querySelector(`#preview${index}`);
                const removeBtn = event.target.parentElement.querySelector('.remove-image');
                const text = event.target.parentElement.querySelector('p');

                preview.src = URL.createObjectURL(file);
                preview.style.display = 'block';
                removeBtn.style.display = 'flex';
                text.style.display = 'none';
            }
        }

        function removeImage(index) {
            const box = document.querySelector(`input[name="hinh_anh${index}"]`).parentElement;
            const preview = box.querySelector('img');
            const removeBtn = box.querySelector('.remove-image');
            const text = box.querySelector('p');
            const input = box.querySelector('input[type="file"]');

            input.value = '';
            preview.style.display = 'none';
            removeBtn.style.display = 'none';
            text.style.display = 'block';
        }

        function addNewImageBox() {
            imageCount++;
            imageCountInput.value = imageCount;

            // Remove the add button
            imageContainer.removeChild(imageContainer.lastChild);

            // Add new image box
            imageContainer.appendChild(createImageUploadBox(imageCount));

            // Add the add button back
            imageContainer.appendChild(createAddButton());
        }

        // Initialize the image boxes when the page loads
        initializeImageBoxes();
    </script>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
</body>

</html>