<?php
include 'ConexionBD.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombreProfesor = isset($_POST['nombre']) ? $_POST['nombre'] : null;
    $justificacion = isset($_POST['justificacion']) ? $_POST['justificacion'] : null;

    if ($nombreProfesor !== null && $justificacion !== null) {
        // Realizar la inserción en la base de datos para registrar la justificación
        // (Asegúrate de adaptar esta inserción según tu esquema de base de datos)
        $query = "INSERT INTO registro_justificante (nombre_profesor, justificacion, fecha_registro) VALUES (?, ?, CURRENT_TIMESTAMP)";
        $statement = $conexion->prepare($query);

        if ($statement) {
            $statement->bind_param("ss", $nombreProfesor, $justificacion);
            $statement->execute();

            // Devolver respuesta en formato JSON
            echo json_encode(['success' => 'Justificante registrado correctamente']);

            // Cerrar la conexión y liberar recursos
            $statement->close();
            $conexion->close();
        } else {
            // Si hay un error al preparar la consulta
            echo json_encode(['error' => 'Error en la preparación de la consulta']);
        }
    } else {
        echo json_encode(['error' => 'Datos incompletos']);
    }
} else {
    echo json_encode(['error' => 'Método de solicitud no permitido']);
}
?>