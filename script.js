async function iniciarSesion() {
    var usuario = document.getElementById("usuario").value;
    var contrasena = document.getElementById("contrasena").value;
    var tipoUsuario = document.getElementById("tipoUsuario").value;

    // Simulación de autenticación (puedes cambiar esta lógica según tus necesidades)
    if (usuario === "usuario" && contrasena === "contrasena") {
        // Autenticación exitosa, redirigir al usuario a la página de la lista de carreras
        document.getElementById('loginForm').action = 'Carreras.html';
        document.getElementById('loginForm').submit();
    } else {
        alert('Autenticación fallida. Verifica tus credenciales.');
    }
}
