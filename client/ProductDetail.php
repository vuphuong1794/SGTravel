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
            if (isset($_GET["id"])){
                $IDLocation = $_GET["id"];
                // Truy vấn để lấy các địa điểm nổi bật
                $sql1 = "SELECT * FROM dia_diem WHERE id= $IDLocation";
                $sql2 = "SELECT * FROM danh_gia WHERE id_dia_diem= $IDLocation";
                $result1 = $conn->query($sql1); 
                $result2 = $conn->query($sql2);           
                $rowDiaDiem = $result1->fetch_assoc();
            ?>
        <!-- Navbar -->
        <script src="../javascript/navbar.js"></script>
            <section class="place-details">
                <div class="place-header">
                <?php
                echo '<img src="../' . htmlspecialchars($rowDiaDiem["hinh_anh1"]) . '" alt="' . htmlspecialchars($rowDiaDiem["ten_dia_diem"]) . '" class="main-image">';
                ?>
                <div class="place-info">
                    <?php
                    echo '<h2>' . htmlspecialchars($rowDiaDiem["ten_dia_diem"]) . '</h2>';
                    echo '<p>' . htmlspecialchars($rowDiaDiem["dia_chi"]) . '</p>';
                    ?>

                    <div class="ratings">
                        <span class="rating-circle">
                            <?php
                            $i = 0;
                            $tongdiem = 0;
                            $diemtrungbinhPV=0;
                            $diemtrungbinhKG=0;
                            $diemtrungbinhCL=0;
                            $diemtrungbinhGC=0;
                            // Loop through the result set for ratings
                            while ($rowDanhgia = $result2->fetch_assoc()) {
                                // Calculate the average rating for each row
                                $diemtrungbinh = ($rowDanhgia['phuc_vu'] + $rowDanhgia['gia_ca'] + $rowDanhgia['khong_gian'] + $rowDanhgia['chat_luong']) / 4;
                                $diemtrungbinhPV+= $rowDanhgia['phuc_vu'];
                                $diemtrungbinhKG+= $rowDanhgia['khong_gian'];
                                $diemtrungbinhCL+= $rowDanhgia['chat_luong'];
                                $diemtrungbinhGC+= $rowDanhgia['gia_ca'];
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
                            $diemtrungbinhPV/=$i;
                            $diemtrungbinhKG/=$i;
                            $diemtrungbinhCL/=$i;
                            $diemtrungbinhGC/=$i;
                            // Avoid division by zero
                            if ($i > 0) {
                                $tongdiem /= $i; // Calculate the overall average score
                                echo "$tongdiem";
                            } else {
                                echo "No infor";
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
                        <p><?php echo $rowDiaDiem['gia_ca_giao_dong']?></p>
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
           <iframe width=100% height="200" loading="lazy" allowfullscreen src="<?php echo $rowDiaDiem['link_dia_diem']?>"></iframe> 
        </div>
        <br/>
        <div>
            <div class="description">
                <h3>Mô tả</h3>
                <p><?php echo $rowDiaDiem['mo_ta']?></p>
            </div>
            <div class="image-gallery">
                <h3>Hình ảnh của quán</h3>
                <div class="images">
                    <img src="..<?php echo $rowDiaDiem['hinh_anh1']; ?>">
                    <img src="..<?php echo $rowDiaDiem['hinh_anh2']; ?>">
                    <img src="..<?php echo $rowDiaDiem['hinh_anh3']; ?>">
                    <div class="more-images">+4</div>
                </div>
            </div>
        </div>
    </section>
    <section class="review-place">
        <h3>Đánh giá</h3>
        <br/>
        <div class="review-input-container">
            <div class="review-input">
                <input type="text" placeholder="Hãy nhận xét về địa điểm này">
                <button>
                    <div class="icon_send">
                        <img width="30px" height="30px" src="../images/send_icon.png">
                    </div>
                </button>
            </div>

            <div class="rating-container"> 
                <div class="ratings">
                    <div class="rating-item">
                        <p>Chất lượng</p>
                        <P>3</P>
                    </div>
                    <div class="rating-item">
                        <p>Giá cả</p>
                        <p>3</p>
                    </div>
                    <div class="rating-item">
                        <p>Không gian</p>
                        <p>2</p>
                    </div>
                    <div class="rating-item">
                        <p>Phục vụ</p>
                        <p>4</p>
                    </div>
                </div>
            </div>
        </div>
    </section>    
    <div class="reviews-and-ratings">
        <section class="place-details-1">
            <div class="review-list">
                <div class="review-item">
                    <img src="user1.jpg" alt="User 1">
                    <p>Huyền Lương - Trái cây tươi</p>
                </div>
                <div class="review-item">
                    <img src="user2.jpg" alt="User 2">
                    <p>Yến Nhi - Trái cây tươi</p>
                </div>
                <div class="review-item">
                    <img src="user3.jpg" alt="User 3">
                    <p>Thiên Ý - Tuyệt vời</p>
                </div>
                <button class="load-more">Xem thêm</button>
            </div>
        </section>    
        <section class="place-details-2">
            <div class="total-ratings">
                <h3>Total:</h3>
                <p>4 bình luận</p>
                <p>0 tuyệt vời</p>
                <p>1 khá tốt</p>
                <p>1 trung bình</p>
                <p>1 kém</p>
                <div class="rating-circle">2.5</div>
            </div>
        </section>
    </div>
    <?php
    }
    else {
        $page = 1;
        echo 'Khong duoc nha';
    }
    ?>
     <!-- Footer -->
     <script src="../javascript/footer.js"></script>
     <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script
</body>
</html>