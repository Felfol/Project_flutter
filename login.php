<?php
// include '../connection.php';

// $userEmail = $_POST['user_email'];
// $userPassword = md5($_POST['user_password']);

// try {
//     $sqlQuery = "SELECT * users WHERE user_email = '$userEmail' AND user_password = '$userPassword'";
//     $resultQuery = $connectNow->Query($sqlQuery);

//     if ($resultQuery->num_rows > 0) {
//         $userRecord = array();
//         while ($rowFound = $resultQuery->fetch_assoc()) {
//             $userRecord = $rowFound;

//         }
//         echo json_encode(array("success" => true));
//     } else {
//         echo json_encode(array("success" => false,"userData"=>$userRecord[0],));
//     }
// } catch (Exception $e) {
//     echo json_encode(array("success" => false, "error" => "Exception: " . $e->getMessage()));
// }

// $connectNow->close();

include '../connection.php';

$userEmail = $_POST['user_email'];
$userPassword = md5($_POST['user_password']);

try {
    $sqlQuery = "SELECT * FROM users WHERE user_email = '$userEmail' AND user_password = '$userPassword'";
    $resultQuery = $connectNow->query($sqlQuery);

    if ($resultQuery->num_rows > 0) {
        $userRecord = array();
        while ($rowFound = $resultQuery->fetch_assoc()) {
            $userRecord[] = $rowFound;
        }
        echo json_encode(array("success" => true, "userData" => $userRecord[0]));
    } else {
        echo json_encode(array("success" => false, "userData" => null));
    }
} catch (Exception $e) {
    echo json_encode(array("success" => false, "error" => "Exception: " . $e->getMessage()));
}

$connectNow->close();
?>




