<?php
include '../connection.php';

$userName = $_POST['user_name'];
$userEmail = $_POST['user_email'];
$userPassword = md5($_POST['user_password']);

try {
    $sqlQuery = "INSERT INTO users SET user_name = '$userName', user_email = '$userEmail', user_password = '$userPassword'";
    $resultQuery = $connectNow->Query($sqlQuery);

    if ($resultQuery) {
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false, "error" => "Database error: " . $connectNow->error));
    }
} catch (Exception $e) {
    echo json_encode(array("success" => false, "error" => "Exception: " . $e->getMessage()));
}

$connectNow->close();



?>