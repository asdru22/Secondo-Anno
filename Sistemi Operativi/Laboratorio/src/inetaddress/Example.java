package inetaddress;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class Example {
    public static void main(String[] args) {
        String host = "www.google.com";
        byte[] rawAddress = { 127, 0, 0, 1 };
        try {
            System.out.println(InetAddress.getLocalHost());
            System.out.println(InetAddress.getByName(host));
            System.out.println(InetAddress.getByName("127.0.0.1"));

            for (InetAddress addr : InetAddress.getAllByName(host)) {
                System.out.println("\t" + addr);
            }

            System.out.println(InetAddress.getByAddress(rawAddress));
            System.out.println(InetAddress.getByAddress("localhost", rawAddress));

        } catch (UnknownHostException e) {
            e.printStackTrace();
        }

    }
}
