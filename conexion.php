<?php
$servername = "DESKTOP-B920RQG\SQLEXPRESS";  // Reemplaza con la dirección de tu servidor de base de datos
$dbname = "prueba";   // Reemplaza con el nombre de tu base de datos

// Crear conexión
$conn = new mysqli($servername, "", "", $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>
