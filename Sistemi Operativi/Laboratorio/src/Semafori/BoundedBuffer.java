package Semafori;

import java.util.concurrent.Semaphore;

public class BoundedBuffer {
    private static final int BUFFER_SIZE = 2;
    private Semaphore mutex;
    private Semaphore empty;
    private Semaphore full;
    private int in, out;
    private Object[] buffer;

    public BoundedBuffer() {
        count = 0;
        in = 0;
        out = 0;
        buffer = new Object[BUFFER_SIZE];
        mutex = new Semaphore(1);
        empty = new Semaphore(BUFFER_SIZE);
        full = new Semaphore(0);
    }

    public void enter(Object item) {
        empty.P();
        mutex.P();
        buffer[in] = item;
        in = (in + 1) % BUFFER_SIZE;
        mutex.V();
        full.V();
    }

    public Object remove() {
        full.P();
        mutex.P();
        Object item = buffer[out];
        out = (out + 1) % BUFFER_SIZE;
        mutex.V();
        empty.V();
        return item;
    }
}
