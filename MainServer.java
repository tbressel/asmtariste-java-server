import java.io.IOException;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;

public class MainServer {

    public static void main(String[] args) {

         // a try / catch database connexion
         try {
            Connection connection = MySQLConnexion.getConnection();

            // Testing if it works ----> !!!!!! to be removed later !!!!!  <-----
            String sql = "SELECT * FROM users";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();


            while (resultSet.next()) {

                // request results
                System.out.println("ID: " + resultSet.getInt("id") + ", Name: " + resultSet.getString("nickname"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        final int PORT = 8080;

        try (ServerSocket serverSocket = new ServerSocket(PORT)) {
            System.out.println("Server started on port: " + PORT);

            while (true) {
                try (Socket clientSocket = serverSocket.accept()) {
                    System.out.println("New entering connexion : " + clientSocket.getInetAddress());

                    // Database connexion
                    try (Connection connection = MySQLConnexion.getConnection()) {

                        // Testing if it works ----> !!!!!! to be removed later !!!!!  <-----
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery("SELECT * FROM users");
                        
                        // create a json 
                        String jsonResponse = generateResponseFromResultSet(resultSet);
                        
                        // send to client
                        PrintWriter response = new PrintWriter(clientSocket.getOutputStream(), true);
                        response.println(jsonResponse);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                } catch (IOException error) {
                    error.printStackTrace();
                }
            }
        } catch (IOException error) {
            error.printStackTrace();
        }
    }
    
    private static String generateResponseFromResultSet(ResultSet resultSet) throws SQLException {
        /// to be completed
        return ""; 
    }
}
