package info_server;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.HashMap;
import java.util.Scanner;

public class Server {
    public static void main(String[] args) {
        if (args.length < 1) {
            System.err.println("Usage: java Server <port>");
            return;
        }

        int port = Integer.parseInt(args[0]);
        HashMap<String, String> information = new HashMap<String, String>();

        information.put("important", "Incredibly important bit of information about everything");
        information.put("random", "Random bit of information about something");
        information.put("shadow", "The outer part of a shadow is called the penumbra");

        try {
            /*
             * Differenza tra ServerSocket e Socket: il primo è usato per aspettare,
             * passivamente, connessioni dall'esterno; il secondo è usato per connettersi
             * attivamente ad un servizio in ascolto in un certo host, su una certa porta.
             * 
             * 
             * server.accept() rimane in attesa di una richiesta di connessione; se questa
             * arriva e va a buon fine (i.e. non solleva eccezioni), restituisce un socket
             * che verrà utilizzato per comunicare con questo specifico client.
             * 
             */
            ServerSocket server = new ServerSocket(port);
            System.out.println("Waiting for a client...");

            Socket s = server.accept();
            System.out.println("Client connected");

            /*
             * Una volta effettuata la connessione, il ServerSocket non è più necessario (in
             * questo esempio abbiamo un solo client).
             */
            server.close();

            /*
             * Analogo al client, abbiamo i canali di input e output del socket.
             */
            Scanner from = new Scanner(s.getInputStream());
            PrintWriter to = new PrintWriter(s.getOutputStream(), true);

            boolean closed = false;
            while (!closed) {
                String request = from.nextLine();
                System.out.println("Request: " + request);
                String[] parts = request.split(" ");
                switch (parts[0]) {
                    case "quit":
                        closed = true;
                        break;
                    case "info":
                        if (parts.length > 1) {
                            String key = parts[1];
                            String response = information.getOrDefault(key, "Error!");
                            to.println(response);
                        } else {
                            to.println("No key");
                        }
                        break;

                    default:
                        to.println("Unknown cmd");
                }
            }

            s.close();
            System.out.println("Closed");

        } catch (IOException e) {
            System.err.println("IOException caught: " + e);
            e.printStackTrace();
        }
    }
}
