package PrimitiveJava;


public class Database {
    private int readerCount;
    private boolean dbReading;
    private boolean dbWriting;

    public Database() {
        readerCount = 0;
        dbReading = false;
        dbWriting = false;
    }

    public synchronized int startRead() {
        while (dbWriting == true) {
            try {
                wait();
            } catch (InterruptedException e) {
            }
            ++readerCount;
            if (readerCount == 1)
                dbReading = true;
            return readerCount;
        }
    }

    public synchronized int endRead() {
        --readerCount;
        if (readerCount == 0)
            db.notifyAll();
        return readerCount;
    }

    public void startWrite() {
        while (dbReading == true || dbWriting == true)
            try {
                wait();
            } catch (InterruptedException e) {
            }
        dbWriting = true;
    }

    public void endWrite() {
        dbWriting = false;
        notifyAll();
    }
}