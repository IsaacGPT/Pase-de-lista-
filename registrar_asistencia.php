<?php
include 'ConexionBD.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $professorID = isset($_POST['professorID']) ? $_POST['professorID'] : null;
    $accion = isset($_POST['accion']) ? $_POST['accion'] : null;

    if ($professorID !== null && $accion !== null) {
        // Realizar las operaciones necesarias según la acción (justificar, falta, retardo, asistencia)
        // (Asegúrate de adaptar estas operaciones según tu lógica)

        // Ejemplo: Actualizar la base de datos para marcar asistencia
        $query = "UPDATE profesores SET asistencias = asistencias + 1 WHERE id = ?";
        $statement = $conexion->prepare($query);
        $statement->bind_param("i", $professorID);
        $statement->execute();

        // Devolver respuesta en formato JSON
        echo json_encode(['success' => 'Operación realizada correctamente']);

        // Cerrar la conexión y liberar recursos
        $statement->close();
        $conexion->close();
    } else {
        echo json_encode(['error' => 'Datos incompletos']);
    }
} else {
    echo json_encode(['error' => 'Método de solicitud no permitido']);
}
?>
