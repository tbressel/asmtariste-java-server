import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnexion {
    public static Connection getConnection() throws SQLException {
        // Loading JDBC MySQL driver
        // compiled with : 
        // java -cp .:lib/mysql-connector-java-8.4.0.jar MainServer
        //
        // Must check why .vscode doesn't work ??
        //
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("MySQL JDBC Driver not found");
        }
        // Créez une connexion à la base de données
        String url = "jdbc:mysql://localhost:3306/asmtariste";
        String user = "zisquier";
        String password = "pass";
        Connection connection = DriverManager.getConnection(url, user, password);
        System.out.println("Database connexion is done !");
        return connection;
    }

}
