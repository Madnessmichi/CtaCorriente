<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Inicio de Sesión</title>
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

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        input[type="text"], input[type="password"] {
            width: 80%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
        }

        p {
            color: red;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <!-- Formulario de inicio de sesión -->
    <form action="login" method="post">
        <h2>Inicio de Sesión</h2>
        <label for="rut_ejecutivo">RUT del Ejecutivo:</label>
        <input type="text" name="rut_ejecutivo" required placeholder="Ingrese su RUT" />
        <br />
        <label for="contrasena">Contraseña:</label>
        <input type="password" name="contrasena" required placeholder="Ingrese su contraseña" />
        <br />
        <button type="submit">Iniciar Sesión</button>

        <!-- Mostrar mensaje de error si existe -->
        <%
            String error = request.getParameter("error");
            if (error != null) {
                if (error.equals("1")) {
        %>
                    <p>Credenciales incorrectas. Intente de nuevo.</p>
        <%
                } else if (error.equals("2")) {
        %>
                    <p>Ocurrió un error en el sistema. Intente más tarde.</p>
        <%
                }
            }
        %>
    </form>
</body>
</html>
