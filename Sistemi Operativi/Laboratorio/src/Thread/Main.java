package Thread;

class Main {
    public static class Worker1 extends Thread {
        @Override
        public void run() {
            System.out.println("I am a Worker1 Thread");
        }
    }

    public static class Worker2 implements Runnable {
        @Override
        public void run() {
            System.out.println("I am a Worker2 Thread");
        }
    }
    public static class Worker3 implements Runnable {
        @Override
        public void run() {
            for(int i=0;i<10;i++) {
                System.out.print((i+1)+" ");
            }
        }
    }

    public static void main(String[] args) {

        Worker1 r1 = new Worker1();
        r1.start(); // attività parallela al thread principale

            /*
            Worker2 w = new Worker2(); // w.run() non sarebbe stato concorrente
            Thread r2 = new Thread(w); // adesso lo è
            r2.start();
            */

        Worker3 w = new Worker3();
        Thread r2 = new Thread(w);
        r2.start();

        System.out.println("I am the Main thread");
        // non si può sapere quali dei due thread finirà prima
    }
}