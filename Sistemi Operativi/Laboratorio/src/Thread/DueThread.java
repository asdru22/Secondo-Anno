package Thread;


public class DueThread implements Runnable {
    public void run() {
        for (int i = 0; i < 10; i++) {
            System.out.println(this + " " + (i + 1) + " ");
        }
        System.out.println(" ");
    }

    public static void main(String[] args) {
        DueThread t1 = new DueThread();
        Thread threadContatore = new Thread(t1);
        threadContatore.start();
        System.out.println("Thread contatore attivato");
        DueThread t2 = new DueThread();
        t2.run();
        return;
    }
}
