<?php
include '../connect.php';

// Lọc theo ngày gần nhất
$sql = "SELECT id, ten_dia_diem, dia_chi, hinh_anh1 
        FROM dia_diem 
        ORDER BY ngay_dang DESC 
        LIMIT 20";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $idLocation = urlencode($row["id"]);
        echo '<a href="ProductDetail.php?id=' . $idLocation . '" style="text-decoration:none">';
        echo "<div class='card'>";
        $imagePath = "../" . htmlspecialchars($row["hinh_anh1"]);
        echo "<img src='$imagePath' alt='" . htmlspecialchars($row["ten_dia_diem"]) . "'>";
        echo "<div class='card-info'>";
        echo "<h4>" . htmlspecialchars($row["ten_dia_diem"]) . "</h4>";
        echo "<p>" . htmlspecialchars($row["dia_chi"]) . "</p>";
        echo "</div></div>";
        echo '</a>';
    }
} else {
    echo "<p>Không có kết quả nào để hiển thị</p>";
}

$conn->close();
?>