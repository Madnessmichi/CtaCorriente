<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registrar Cuenta Corriente</title>
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

        input[type="text"], input[type="number"] {
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
    <form action="registrarCtaCorriente" method="post">
        <h2>Registrar Cuenta Corriente</h2>
        <!-- Mostrar el ejecutivo conectado -->
        <p>Registrando como: <%= session.getAttribute("nombreEjecutivo") %></p>
        <label for="rut_cliente">RUT del Cliente:</label>
        <input type="text" name="rut_cliente" required placeholder="Ingrese el RUT del cliente" />
        <br />
        <label for="monto">Monto:</label>
        <input type="number" name="monto" required placeholder="Ingrese el monto inicial" />
        <br />
        <label for="ejecutivo">RUT del Ejecutivo:</label>
        <input type="text" name="ejecutivo" required placeholder="Ingrese el RUT del ejecutivo" value="<%= session.getAttribute("rutEjecutivo") %>" readonly />
        <br />
        <button type="submit">Registrar</button>
    </form>
</body>
</html>
