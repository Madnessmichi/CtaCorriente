import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Configuración de conexión a la base de datos
    private static final String URL = "jdbc:mysql://localhost:3306/cuentas_clientes"; 
    private static final String USUARIO = "root"; 
    private static final String PASSWORD = "";   

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros enviados desde el formulario
        String rutEjecutivo = request.getParameter("rut_ejecutivo");
        String contrasena = request.getParameter("contrasena");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Conexión a la base de datos
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USUARIO, PASSWORD);

            // Consulta SQL para validar las credenciales
            String sql = "SELECT rut_ejecutivo, nombre FROM ejecutivo WHERE rut_ejecutivo = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, rutEjecutivo);
            stmt.setString(2, contrasena);

            // Ejecutar la consulta
            rs = stmt.executeQuery();

            // Si las credenciales son válidas
            if (rs.next()) {
                String nombreEjecutivo = rs.getString("nombre"); // Recuperar el nombre

                // Guardar datos en la sesión
                request.getSession().setAttribute("rutEjecutivo", rutEjecutivo);
                request.getSession().setAttribute("nombreEjecutivo", nombreEjecutivo);

                // Redirigir a la página de inicio
                response.sendRedirect("Home.jsp");
            } else {
                // Credenciales incorrectas
                response.sendRedirect("Login.jsp?error=1");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Login.jsp?error=2");
        } finally {
            // Cerrar conexión y recursos
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
