import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registrarCtaCorriente")
public class RegistrarCtaCorrienteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Configuración de conexión a la base de datos
    private static final String URL = "jdbc:mysql://localhost:3306/cuentas_clientes";
    private static final String USUARIO = "root";
    private static final String PASSWORD = "";

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Obtener los datos enviados desde el formulario
    String rut_cliente = request.getParameter("rut_cliente");
    String ejecutivo = request.getParameter("ejecutivo");
    String monto = request.getParameter("monto");

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Conectar a la base de datos
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(URL, USUARIO, PASSWORD);

        // Preparar la consulta SQL para insertar una nueva cuenta corriente
        String sql = "INSERT INTO cta_corriente (rut_cliente, monto, ejecutivo) VALUES (?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, rut_cliente); // Asignar el RUT del cliente
        stmt.setDouble(2, Double.parseDouble(monto)); // Asignar el monto
        stmt.setString(3, ejecutivo); // Asignar el RUT del ejecutivo

        // Ejecutar la consulta
        stmt.executeUpdate();

        // Redirigir a una página de confirmación
        response.sendRedirect("registroExitoso.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp");
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
}
