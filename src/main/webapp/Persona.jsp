<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registrar Persona</title>
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

        input[type="text"] {
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
            color: blue;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form action="registrarPersona" method="post">
        <h2>Registrar Persona</h2>
        <!-- Mostrar el ejecutivo conectado -->
        <p>Registrando como: <%= session.getAttribute("nombreEjecutivo") %></p>
        <label for="rut">RUT:</label>
        <input type="text" name="rut" required placeholder="Ingrese el RUT" />
        <br />
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" required placeholder="Ingrese el nombre" />
        <br />
        <label for="apellido">Apellido:</label>
        <input type="text" name="apellido" required placeholder="Ingrese el apellido" />
        <br />
        <label for="direccion">Dirección:</label>
        <input type="text" name="direccion" required placeholder="Ingrese la dirección" />
        <br />
        <label for="correo">Correo:</label>
        <input type="text" name="correo" required placeholder="Ingrese el correo" />
        <br />
        <label for="telefono">Teléfono:</label>
        <input type="text" name="telefono" required placeholder="Ingrese el teléfono" />
        <br />
        <label for="nombreMascota">Nombre de la Mascota:</label>
        <input type="text" name="nombreMascota" required placeholder="Ingrese el nombre de la mascota" />
        <br />
        <button type="submit">Registrar</button>
    </form>
</body>
</html>
