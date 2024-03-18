package Semafori;

import java.util.concurrent.Semaphore;

public class ReaderWriter {
    public class Database {
        private int readerCount; // number of active readers
        Semaphore mutex; // controls access to readerCount
        Semaphore db;
        public Database() {
            readerCount = 0;
            mutex = new Semaphore(1);
            db = new Semaphore(1);
        }

        public int startRead() {
            mutex.P();
            ++readerCount;
            if (readerCount == 1)
                db.P();
            mutex.V();
            return readerCount;
        }

        public int endRead() {
            mutex.P();
            --readerCount;
            if (readerCount == 0)
                db.V();
            mutex.V();
            return readerCount;
        }

        public void startWrite() {
            db.P();
        }

        public void endWrite() {
            db.V();
        }
    }

    public class Reader extends Thread {
        public Reader(Database db) {
            server = db;
        }

        public void run() {
            int c;
            while (true) {
                c = server.startRead();
                // lettura database
                c = server.endRead();
            }
        }

        private Database server;
    }

    public class Writer extends Thread {
        public Writer(Database db) {
            server = db;
        }

        public void run() {
            while (true) {
                server.startWrite();
                // scrittura database
                server.endWrite();
            }
        }

        private Database server;
    }

    public static void main(String[] args) {

    }
}
