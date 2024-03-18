package PrimitiveJava;

public class EnterRemove {
    public synchronized void enter(Object item) {
        while (count == BUFFER_SIZE)
            Thread.yield();
        ++count;
        buffer[in] = item;
        in = (in + 1) % BUFFER_SIZE;
    }

    public synchronized Object remove() {
        Object item;
        while (count == 0)
            Thread.yield();
        --count;
        item = buffer[out];
        out = (out + 1) % BUFFER_SIZE;
        return item;
    }
}
