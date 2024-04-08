import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;

public class Client {
    public static void main(String[] args) {

        int port = 9000;
        String host = "localhost";
        String stringMsg = "Example Message";
        byte[] msg = stringMsg.getBytes();

        try {
            DatagramSocket s = new DatagramSocket();
            DatagramPacket p = new DatagramPacket(msg, msg.length, InetAddress.getByName(host), port);
            s.send(p);

            s.connect(InetAddress.getByName(host), port);
            DatagramPacket pWrong = new DatagramPacket(msg, msg.length,
                    InetAddress.getByName(host), 9001);
            s.send(pWrong);
            s.close();
        } catch (SocketException e) {
            e.printStackTrace();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            System.err.println("Should be here.");
        }
    }

}
