package info_server;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class Client {
    public static void main(String[] args) {
        if (args.length < 2) {
            System.err.println("Usage: java Client <host> <port>");
            return;
        }

        String host = args[0];
        int port = Integer.parseInt(args[1]);

        Scanner userInput = new Scanner(System.in);

        try {
            Socket s = new Socket(host, port);
            System.out.println("Connected to server");

            /*
             * getInputStream e getOutputStream sono i canali di ricezione e invio
             * attraverso il socket.
             * 
             * Gli stream ottenuti sono in byte; usiamo quindi Scanner e PrintWriter per
             * facilitare la comunicazione, convertendo tra testo e byte.
             * 
             * Nel caso di PrintWrite, il flag "true" indica autoflush (i dati vengono
             * inviati al server dopo ogni print)
             */
            Scanner from = new Scanner(s.getInputStream());
            PrintWriter to = new PrintWriter(s.getOutputStream(), true);
            System.out.println("Usage: info <key> to get info on a key");

            while (true) {
                String request = userInput.nextLine();
                to.println(request);
                if (request.equals("quit")) {
                    break;
                }
                String response = from.nextLine();
                System.out.println(response);
            }

            s.close();
            System.out.println("Socket closed.");

        } catch (IOException e) {
            System.err.println("IOException caught: " + e);
            e.printStackTrace();
        } finally {
            userInput.close();
        }
    }
}
