import org.junit.Test;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.fail;

import java.sql.Connection;

public class ConexionBDPrueba {

    @Test
    public void testConexionExitosa() {
        try {
            // Intentar obtener la conexión
            Connection conexion = ConexionBD.obtenerConexion();
            assertNotNull("La conexión no debería ser nula", conexion);
            System.out.println("Conexión exitosa a la base de datos.");
        } catch (Exception e) {
            e.printStackTrace();
            fail("Error al conectar a la base de datos: " + e.getMessage());
        }
    }

    @Test
    public void testConexionFallida() {
        try {
            // Usar credenciales incorrectas para simular una conexión fallida
            Connection conexion = ConexionBD.obtenerConexionConParametros(
                "jdbc:mysql://localhost:3306/cuentas_clientes", "usuario_incorrecto", "contraseña_incorrecta"
            );
            fail("Se esperaba un fallo en la conexión, pero se conectó correctamente.");
        } catch (Exception e) {
            // Se espera un fallo en la conexión
            System.out.println("Conexión fallida como se esperaba: " + e.getMessage());
        }
    }
}
