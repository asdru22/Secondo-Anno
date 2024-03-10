package Concorrenza;

public class Worker extends Thread {
    public Worker(String n, int i, MutualExclusion s) {
        name = n;
        id = i;
        shared = s;
    }

    @Override
    public void run() {
        while (true) {
            shared.enteringCriticalSection(id);
            System.out.println("Critical "+id);
            // in critical section code
            shared.leavingCriticalSection(id);
            // out of critical section code
            System.out.println("Not critical "+id);
        }
    }

    private String name;
    private int id;
    private MutualExclusion shared;
}