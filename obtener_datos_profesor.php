<?php
include 'ConexionBD.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener el ID del profesor desde la solicitud POST
    $professorID = isset($_POST['professorID']) ? $_POST['professorID'] : null;

    if ($professorID !== null) {
        // Realizar la consulta a la base de datos para obtener los datos del profesor
        // (Asegúrate de adaptar esta consulta según tu esquema de base de datos)
        $query = "SELECT nombre, faltas, asistencias, retardos FROM profesores WHERE id = ?";
        $statement = $conexion->prepare($query);
        $statement->bind_param("i", $professorID);
        $statement->execute();
        $result = $statement->get_result();

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            // Devolver los datos en formato JSON
            echo json_encode([
                'professorName' => $row['nombre'],
                'data' => [$row['faltas'], $row['asistencias'], $row['retardos']]
            ]);
        } else {
            echo json_encode(['error' => 'Profesor no encontrado']);
        }

        // Cerrar la conexión y liberar recursos
        $statement->close();
        $conexion->close();
    } else {
        echo json_encode(['error' => 'ID del profesor no proporcionado']);
    }
} else {
    echo json_encode(['error' => 'Método de solicitud no permitido']);
}
?>
