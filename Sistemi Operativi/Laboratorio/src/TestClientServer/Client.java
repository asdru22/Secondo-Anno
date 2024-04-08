package TestClientServer;

import java.io.*;
import java.net.*;

public class Client {
    public static void main(String[] args) {
        try {
            Socket socket = new Socket("localhost", 12345);
            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            PrintWriter out = new PrintWriter(socket.getOutputStream(), true);

            // Send messages to the server
            out.println("Hello, Server!");
            out.println("How are you?");

            // Receive responses from the server
            String serverResponse;
            while ((serverResponse = in.readLine()) != null) {
                System.out.println("Server response: " + serverResponse);
            }

            socket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
