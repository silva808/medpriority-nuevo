<?php

require_once 'connection.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    
    $data = json_decode(file_get_contents("php://input"), true);
    $userId = $data['userId'];
    // $userId = $data->userId;
    echo 'usu '.$userId;

    $stmt = mysqli_prepare($mysqli, "DELETE FROM usuario WHERE id_usuario = ?");
    mysqli_stmt_bind_param($stmt, "s", $userId);
    mysqli_stmt_execute($stmt);


    if (mysqli_stmt_affected_rows($stmt) > 0) {
        // Send a success response
        echo "User deleted successfully";
    } else {
        // Send an error response
        echo "Error deleting user";
    }

    // Close the statement and connection
    mysqli_stmt_close($stmt);
    mysqli_close($mysqli);
}
?>
