<?php
include '../connect.php'
?>
<!DOCTYPE html>

<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SGTravel</title>
    <link rel="stylesheet" href="../style/client/ProductDetail.css">
    <link rel="stylesheet" href="../style/client/Trangchu.css">

</head>

<body>
    <?php
    // Get the query parameter from the URL
    if (isset($_GET["id"])) {
        $IDLocation = $_GET["id"];
        // Truy vấn để lấy các địa điểm nổi bật
        $sql1 = "SELECT * FROM dia_diem WHERE id= $IDLocation";
        $sql2 = "SELECT * FROM danh_gia WHERE id_dia_diem= $IDLocation";
        $sql3 = "SELECT * FROM binh_luan WHERE id_dia_diem= $IDLocation";
        $result1 = $conn->query($sql1);
        $result2 = $conn->query($sql2);
        $result3 = $conn->query($sql3);
        $rowDiaDiem = $result1->fetch_assoc();
    ?>
        <!-- Navbar -->
        <?php require '../javascript/navbar.php'; ?>
        <section class="place-details">
            <div class="place-header">
                <?php
                $imagePath = "../" . htmlspecialchars($rowDiaDiem["hinh_anh1"]);
                $defaultImagePath = "../images/locations/" . htmlspecialchars($rowDiaDiem["hinh_anh1"]); // Default image path if the image doesn't exist

                // Check if the image exists
                if (!file_exists($imagePath)) {
                    $imagePath = $defaultImagePath; // Use the default image if the file doesn't exist
                }
                echo "<img src='$imagePath' alt='" . htmlspecialchars($rowDiaDiem["ten_dia_diem"]) . "'><br>";
                ?>
                <div class="place-info">
                    <?php
                    echo '<h2>' . htmlspecialchars($rowDiaDiem["ten_dia_diem"]) . '</h2>';
                    echo '<p>' . htmlspecialchars($rowDiaDiem["dia_chi"]) . '</p>';


                    $i = 0;
                    $tongdiem = 0;
                    $diemtrungbinhPV = 0;
                    $diemtrungbinhKG = 0;
                    $diemtrungbinhCL = 0;
                    $diemtrungbinhGC = 0;
                    // Loop through the result set for ratings
                    while ($rowDanhgia = $result2->fetch_assoc()) {
                        // Calculate the average rating for each row
                        $diemtrungbinh = ($rowDanhgia['phuc_vu'] + $rowDanhgia['gia_ca'] + $rowDanhgia['khong_gian'] + $rowDanhgia['chat_luong']) / 4;
                        $diemtrungbinhPV += $rowDanhgia['phuc_vu'];
                        $diemtrungbinhKG += $rowDanhgia['khong_gian'];
                        $diemtrungbinhCL += $rowDanhgia['chat_luong'];
                        $diemtrungbinhGC += $rowDanhgia['gia_ca'];
                        // Update the `diem_trung_binh` column in `dia_diem` table using the correct column name
                        $UpdateDiem = 'UPDATE danh_gia SET diem_trung_binh = ' . $diemtrungbinh . ' WHERE id_dia_diem = ' . $IDLocation; // Replace `id` with the correct column name if necessary

                        // Execute the query
                        if ($conn->query($UpdateDiem) === false) {
                            echo "Error" . $conn->error;
                        }

                        // Sum up for the overall average
                        $tongdiem += $diemtrungbinh;
                        $i++;
                    }
                    echo '<div class="ratings">';
                    // Avoid division by zero
                    if ($i > 0) {
                        $diemtrungbinhPV /= $i;
                        $diemtrungbinhKG /= $i;
                        $diemtrungbinhCL /= $i;
                        $diemtrungbinhGC /= $i;
                        $tongdiem /= $i; // Calculate the overall average score                                              
                        if ($tongdiem > 9) {
                            echo '<span class="rating-circle" style="background-color:aqua">';
                        } else if ($tongdiem > 7.5) {
                            echo '<span class="rating-circle" style="background-color:green">';
                        } else if ($tongdiem > 5) {
                            echo '<span class="rating-circle" style="background-color:yellow">';
                        } else if ($tongdiem < 5) {
                            echo '<span class="rating-circle" style="background-color:red">';
                        }
                        echo "$tongdiem";
                    } else {
                        $tongdiem = '?';
                    }
                    ?>
                    </span>
                    <div class="rating-details">
                        <?php
                        echo "<p>$diemtrungbinhCL Chất lượng</p>";
                        echo "<p>$diemtrungbinhGC Giá cả</p>";
                        echo "<p>$diemtrungbinhKG Không gian</p>";
                        echo "<p>$diemtrungbinhPV Phục vụ</p>";
                        ?>
                    </div>
                </div>
                <p><?php echo $rowDiaDiem['gia_ca_giao_dong'] ?></p>
                <?php
                // Giả sử $rowDiaDiem đã chứa dữ liệu về giờ mở và đóng cửa từ cơ sở dữ liệu
                $gio_mo_cua = $rowDiaDiem['gio_mo_cua']; // Giả sử định dạng là '06:00'
                $gio_dong_cua = $rowDiaDiem['gio_dong_cua']; // Giả sử định dạng là '23:00'

                // Lấy thời gian hiện tại
                $thoi_gian_hien_tai = date('H:i');

                // So sánh thời gian hiện tại với giờ mở cửa và đóng cửa
                if ($thoi_gian_hien_tai >= $gio_mo_cua && $thoi_gian_hien_tai <= $gio_dong_cua) {
                    // Trong khoảng thời gian mở cửa
                    echo '<p style="color: green;">🕒 Đang mở cửa</p>';
                } else {
                    // Ngoài khoảng thời gian mở cửa
                    echo '<p style="color: red;">Đã đóng cửa</p>';
                }
                ?>
            </div>
            </div>


            <div class="mapswrapper">
                <iframe width=100% height="200" loading="lazy" allowfullscreen src="<?php echo $rowDiaDiem['link_dia_diem'] ?>"></iframe>
            </div>
            <br />
            <div>
                <div class="description">
                    <h3>Mô tả</h3>
                    <p><?php echo $rowDiaDiem['mo_ta'] ?></p>
                </div>
                <div class="image-gallery">
                    <h3>Hình ảnh của quán</h3>

                    <div class="images">
                        <img src="..<?php echo $rowDiaDiem['hinh_anh1']; ?>">
                        <img src="..<?php echo $rowDiaDiem['hinh_anh2']; ?>">
                        <img src="..<?php echo $rowDiaDiem['hinh_anh3']; ?>">
                        <?php
                        if (isset($rowDiaDiem['hinh_anh4']) && !empty($rowDiaDiem['hinh_anh4'])) {
                            echo "<img src='../" . $rowDiaDiem['hinh_anh4'] . "'>+4";
                        }
                        ?>
                        <!-- <div class="more-images">+4</div> -->
                    </div>
                </div>
            </div>
        </section>
        <section class="review-place">
            <h3>Đánh giá</h3>
            <br />
            <form action="ProductDetail.php?id=<?php echo htmlspecialchars($_GET['id']); ?>" method="POST">
                <div class="review-input">
                    <input type="text" name="comment" id="Comment" placeholder="Hãy nhận xét về địa điểm này" required>
                    <input type="hidden" name="id_dia_diem" value="<?php echo htmlspecialchars($rowDiaDiem['id']); ?>">
                    <button type="submit" id="SendComment" style="cursor: pointer;">
                        <div class="icon_send">
                            <img width="30px" height="30px" src="../images/send_icon.png" alt="Send Icon">
                        </div>
                    </button>
                </div>
                <div class="rating-container">
                    <div class="ratings">
                        <div class="rating-item">
                            <p>Chất lượng</p>
                            <input id="textCL" name="textCL" type="number" min="1" max="10" required placeholder="5">
                        </div>
                        <div class="rating-item">
                            <p>Giá cả</p>
                            <input id="textGC" name="textGC" type="number" min="1" max="10" required placeholder="5">
                        </div>
                        <div class="rating-item">
                            <p>Không gian</p>
                            <input id="textKG" name="textKG" type="number" min="1" max="10" required placeholder="5">
                        </div>
                        <div class="rating-item">
                            <p>Phục vụ</p>
                            <input id="textPV" name="textPV" type="number" min="1" max="10" required placeholder="5">
                        </div>
                    </div>
                </div>
            </form>

        </section>
        <?php
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            // Get user input
            $comment = isset($_POST['comment']) ? trim($_POST['comment']) : '';
            $id_dia_diem = isset($_GET['id']) ? (int)$_GET['id'] : 0; // Sanitize and cast to integer
            $score_chat_luong = isset($_POST['textCL']) ? (int)$_POST['textCL'] : 0;
            $score_gia_ca = isset($_POST['textGC']) ? (int)$_POST['textGC'] : 0;
            $score_khong_gian = isset($_POST['textKG']) ? (int)$_POST['textKG'] : 0;
            $score_phuc_vu = isset($_POST['textPV']) ? (int)$_POST['textPV'] : 0;
            $id_user = isset($_SESSION['user_id']) ? (int)$_SESSION['user_id'] : 0; // Ensure user ID is valid
            $user_name = isset($_SESSION['username']) ? $_SESSION['username'] : 'Ẩn danh';
            echo $user_name;
            if (empty($comment) || $id_dia_diem <= 0 || $score_chat_luong < 1 || $score_gia_ca < 1 || $score_khong_gian < 1 || $score_phuc_vu < 1) {
                echo "Please fill in all fields correctly.";
                exit();
            }

            // Calculate average score
            $diem_trung_binh = ($score_chat_luong + $score_gia_ca + $score_khong_gian + $score_phuc_vu) / 4;

            // Prepare and bind for the danh_gia table
            $query1 = "INSERT INTO danh_gia (id_dia_diem, chat_luong, gia_ca, khong_gian, phuc_vu, diem_trung_binh) 
                    VALUES (?, ?, ?, ?, ?, ?)";
            $stmt1 = $conn->prepare($query1);
            $stmt1->bind_param("iiiiid", $id_dia_diem, $score_chat_luong, $score_gia_ca, $score_khong_gian, $score_phuc_vu, $diem_trung_binh);

            if ($stmt1->execute()) {
                // Prepare and bind for the binh_luan table after success
                $query2 = "INSERT INTO binh_luan (id_dia_diem, noi_dung, id_nguoi_dung, ten_dang_nhap) VALUES (?, ?, ?, ?)";
                $stmt2 = $conn->prepare($query2);
                $stmt2->bind_param("isis", $id_dia_diem, $comment, $id_user, $user_name);
                

                if ($stmt2->execute()) {
                    // Redirect to the same page to refresh and prevent resubmission
                    
                    exit(); // Ensure the script stops after the redirection
                } else {
                    echo "Error inserting comment: " . $stmt2->error;
                }
                
                $stmt2->close();
            } else {
                echo "Error inserting review: " . $stmt1->error;
            }
            header("Location: ProductDetail.php?id=" . $id_dia_diem); // Redirect with ID parameter
            $stmt1->close();
            $conn->close();
        }
        ?>

        <div class="reviews-and-ratings">
            <section class="place-details-1">
                <div class="review-list">
                    <?php
                    while ($rowBinhLuan = $result3->fetch_assoc()) {
                        echo '<div class="review-item" style="background-color:lightgray ; padding:20px; border-radius: 30px; ">';
                        echo '  <img src="../images/userPicture_def.png" alt="User 1">';
                        echo '<div> <p><b> ' . $rowBinhLuan['ten_dang_nhap'] . ' </b></p>';
                        echo '    <p> ' . $rowBinhLuan['noi_dung'] . '</p></div>';
                        echo '</div>';
                    }
                    ?>
                    <button class="load-more">Xem thêm</button>
                </div>
            </section>

        </div>
    <?php
    } else {
        $page = 1;
        echo 'Khong tim thay thong tin quan';
    }
    ?>
    <!-- Footer -->
    <script src="../javascript/footer.js"></script>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
</body>

</html>