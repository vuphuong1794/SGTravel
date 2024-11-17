<?php  

include '../connect.php';  

$userNameFromDB = 'Khách';  
$userLoggedIn = false;  

if (isset($_SESSION['user_id'])) {  
    $userId = $_SESSION['user_id'];  
    $query = "SELECT ten_dang_nhap FROM tai_khoan WHERE id = '$userId'";  
    $result = mysqli_query($conn, $query);  
    
    if ($result && mysqli_num_rows($result) > 0) {  
        $user = mysqli_fetch_assoc($result);  
        $userNameFromDB = $user['ten_dang_nhap'];  
        $userLoggedIn = true;   
    }  
}  
?>  