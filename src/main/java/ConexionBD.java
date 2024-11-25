import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionBD {

    // Parámetros de conexión
    private static final String URL = "jdbc:mysql://localhost:3306/cuentas_clientes"; 
    private static final String USUARIO = "root"; 
    private static final String CONTRASENA = "";  

    public static Connection obtenerConexion() throws Exception {
        try {
            // Cargar el driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establecer conexión
            return DriverManager.getConnection(URL, USUARIO, CONTRASENA);
        } catch (Exception e) {
            throw new Exception("Error al conectar a la base de datos: " + e.getMessage(), e);
        }
    }
    
    // método para pruebas de conexión fallida
    public static Connection obtenerConexionConParametros(String url, String user, String password) throws Exception {
        return DriverManager.getConnection(url, user, password);
    }
}
