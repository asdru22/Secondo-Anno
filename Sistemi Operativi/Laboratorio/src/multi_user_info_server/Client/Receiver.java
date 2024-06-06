package multi_user_info_server.Client;

import java.io.IOException;
import java.net.Socket;
import java.util.Scanner;

public class Receiver implements Runnable {

    Socket s;
    Thread sender;

    public Receiver(Socket s, Thread sender) {
        this.s = s;
        this.sender = sender;
    }

    @Override
    public void run() {
        try {
            Scanner from = new Scanner(this.s.getInputStream());
            while (true) {
                String response = from.nextLine();
                System.out.println("Received: " + response);
                if (response.equals("quit")) {
                    break;
                }

            }
        } catch (IOException e) {
            System.err.println("IOException caught: " + e);
            e.printStackTrace();
        } finally {
            System.out.println("Receiver closed.");
            this.sender.interrupt();
        }
    }
}