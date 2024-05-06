// Levée d'exeption en cas d'erreur entrée / sortie : classe IOExeption
import java.io.IOException;

// Permet d'écrire des données de textes dans un flux de sortie comme JSON : classe PrintWriter
import java.io.PrintWriter;

// Importation du point d'entrée du serveur : classe ServerSocket
import java.net.ServerSocket;

// Importation non obligatoir car Socket fait parti du meme package que ServerSocket
import java.net.Socket;



/**
 *  Entering into the server
 */
public class MainServer {

    public static void main(String[] args) {

        // local variable as constante  : number of port adress where server is listened to
        final int PORT = 8080;


        // try and catch condition
        try (ServerSocket serverSocket = new ServerSocket(PORT)) {
            System.out.println("Serveur démarré sur le port " + PORT);

            while (true) {
                try (Socket clientSocket = serverSocket.accept()) {
                    System.out.println("Nouvelle connexion entrante : " + clientSocket.getInetAddress());

                    var out = new PrintWriter(clientSocket.getOutputStream(), true);

                    // En-têtes de la réponse HTTP
                    out.println("HTTP/1.1 200 OK");
                    out.println("Content-Type: application/json"); // Indique que le contenu est du JSON
                    out.println();

                    // Corps de la réponse JSON
                    String jsonResponse = "{ \"message\": \"Hello, world!\" }";
                    out.println(jsonResponse);
                } catch (IOException error) {
                    error.printStackTrace();
                }
            }
        } catch (IOException error) {
            error.printStackTrace();
        }
    }
}