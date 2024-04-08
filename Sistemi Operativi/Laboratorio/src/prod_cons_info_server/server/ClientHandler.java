package prod_cons_info_server.server;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class ClientHandler implements Runnable {

    Socket s;
    /* la risorsa in questo caso è necessariamente condivisa tra tutti i thread */
    Resource r;

    public ClientHandler(Socket s, Resource r) {
        this.s = s;
        this.r = r;
    }

    @Override
    public void run() {
        try {
            Scanner from = new Scanner(s.getInputStream());
            PrintWriter to = new PrintWriter(s.getOutputStream(), true);

            System.out.println("Thread " + Thread.currentThread() + " listening...");

            boolean closed = false;
            while (!closed) {
                String request = from.nextLine();
                String[] parts = request.split(" ", 3);
                if (!Thread.interrupted()) {
                    System.out.println("Request: " + request);
                    try {
                        switch (parts[0]) {
                            case "quit":
                                closed = true;
                                to.println("quit");
                                break;
                            case "extract":
                                if (parts.length > 1) {
                                    String key = parts[1];
                                    String result = r.extract(key);
                                    to.println(result);
                                } else {
                                    to.println("No key");
                                }
                                break;
                            case "add":
                                if (parts.length > 2) {
                                    String newKey = parts[1];
                                    String newValue = parts[2];
                                    r.add(newKey, newValue);
                                    to.println("ok");
                                } else {
                                    to.println("No key or no value");
                                }
                                break;
                            default:
                                to.println("Unknown cmd");
                        }
                    } catch (InterruptedException e) {
                        /*
                         * se riceviamo un Thread.interrupt() mentre siamo in attesa di add() o
                         * extract(), interrompiamo il ciclo come richiesto, e passiamo alla chiusura
                         * del socket
                         */
                        to.println("quit");
                        break;
                    }
                } else {
                    break;
                }
            }

            to.println("quit");
            s.close();
            System.out.println("Closed");
        } catch (IOException e) {
            System.err.println("ClientHandler: IOException caught: " + e);
            e.printStackTrace();
        }
    }

}
