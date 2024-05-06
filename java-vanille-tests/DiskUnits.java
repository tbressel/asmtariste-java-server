import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;


public class DiskUnits {

    private static final String URL = "jdbc:mysql://localhost:3306/asmtariste";
    private static final String USER = "zisquier";
    private static final String PASSWORD = "pass";

    public static List<String> getAllDiskUnits() {
        List<String> diskUnits = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String query = "SELECT * FROM disk_units";
            try (PreparedStatement statement = connection.prepareStatement(query);
                 ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    diskUnits.add(resultSet.getString("label"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Gérer les exceptions ici
        }

        return diskUnits;
    }

    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(new InetSocketAddress(8080), 0);
        server.createContext("/disk_units", new DiskUnitsHandler());
        server.setExecutor(null); // Crée un pool d'exécution par défaut
        server.start();
    }

    static class DiskUnitsHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange exchange) throws IOException {
            if ("GET".equals(exchange.getRequestMethod())) {
                List<String> diskUnits = getAllDiskUnits();
                String response = String.join("\n", diskUnits);
                exchange.sendResponseHeaders(200, response.getBytes().length);
                OutputStream os = exchange.getResponseBody();
                os.write(response.getBytes());
                os.close();
            } else {
                exchange.sendResponseHeaders(405, -1); // Méthode non autorisée
            }
        }
    }
}