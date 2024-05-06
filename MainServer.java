import java.io.IOException;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MainServer {

    private static final Logger LOGGER = Logger.getLogger(MainServer.class.getName());

    public static void main(String[] args) {
        final int PORT = 8080;

        try (ServerSocket serverSocket = new ServerSocket(PORT)) {
            LOGGER.info("Server started on port: " + PORT);

            // Connexion à la base de données
            try (Connection connection = MySQLConnexion.getConnection()) {
                LOGGER.info("Yeah !!! Successfully connected to the database");
            } catch (SQLException e) {
                LOGGER.log(Level.SEVERE, "Error connecting to the database", e);
            }

            while (true) {
                try (Socket clientSocket = serverSocket.accept()) {
                    LOGGER.info("New connection from: " + clientSocket.getInetAddress());

                    // Code pour traiter la connexion client
                    // Par exemple, envoyer une réponse au client
                    try (PrintWriter response = new PrintWriter(clientSocket.getOutputStream(), true)) {
                        response.println("Welcome to the server!");
                    } catch (IOException e) {
                        LOGGER.log(Level.SEVERE, "Error sending response to client", e);
                    }
                } catch (IOException e) {
                    LOGGER.log(Level.SEVERE, "Error accepting client connection", e);
                }
            }
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "Error starting server", e);
        }
    }
}
