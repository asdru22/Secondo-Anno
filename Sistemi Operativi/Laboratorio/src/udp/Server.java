import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;

public class Server {
    public static void main(String[] args) {

        int port = 9000;
        DatagramPacket p = new DatagramPacket(new byte[1000], 1000);
        try {
            DatagramSocket s = new DatagramSocket(port);

            s.receive(p);
            String msg = new String(p.getData()).substring(0, p.getLength());
            System.out.println(msg);
            System.out.println(p.getAddress());
            System.out.println(p.getPort());

            s.close();

        } catch (SocketException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
