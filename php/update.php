<!-- --------------------------------UPDATE USERS------------------------------------ -->
<?php
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    
    require_once 'connection.php';

    // Decode JSON data sent via AJAX
    $data = json_decode(file_get_contents("php://input"), true);

    // Prepare SQL statement
    $valorant = "UPDATE usuario SET 
                tipo_documento = ?, 
                nombre = ?, 
                edad = ?, 
                genero = ?, 
                direccion = ?, 
                telefono = ?, 
                correo = ?, 
                tipo_afiliacion = ? 
              WHERE id_usuario = ?";

    $stmt = mysqli_prepare($mysqli, $valorant);

    // Check if the prepare statement was successful
    if ($stmt) {
        // Bind parameters
        mysqli_stmt_bind_param(
            $stmt,
            "ssisssssi",
            $data['m_id_type'],
            $data['m_name'],
            $data['m_age'],
            $data['m_sexmoneyfeelingsdie'],
            $data['m_address'],
            $data['m_pickupyophonebaby'],
            $data['m_email'],
            $data['m_afi'],
            $data['m_id']
        );

        // Execute statement
        mysqli_stmt_execute($stmt);

        // Close statement
        mysqli_stmt_close($stmt);
    } else {
        // If prepare statement failed, handle the error
        echo "Error: " . mysqli_error($mysqli);
    }

    // Close connection
    mysqli_close($mysqli);
}

?>