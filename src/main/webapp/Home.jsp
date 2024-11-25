<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bienvenido</title>
    <style>
        body {
            background-color: #f0f2f5;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
    </style>
</head>
<body>
    <% 
        // Verificar si el nombre del ejecutivo está en la sesión
        String nombreEjecutivo = (String) session.getAttribute("nombreEjecutivo");
        if (nombreEjecutivo == null) {
            // Redirigir al login si no hay sesión activa
            response.sendRedirect("Login.jsp");
        }
    %>
    <!-- Mostrar mensaje de bienvenida -->
    <h1>Bienvenido, <%= nombreEjecutivo %>. Has iniciado sesión con éxito.</h1>
</body>
</html>
