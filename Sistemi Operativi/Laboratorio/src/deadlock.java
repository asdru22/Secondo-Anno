public class deadlock {
    public static int counter;
    public static Object globalLock = new Object();
    public static void main(String[] args) {
        counter = 0;
        boolean flag = false; 
        if(flag){
            Runner1 r1 = new Runner1();
            Runner1 r2 = new Runner1();
            r1.start();
            r2.start();
        } else {
            Runner3 r3 = new Runner3();
            Runner3 r4 = new Runner3();
            r3.start();
            r4.start();
        }
    }
    
    public static class Runner1 extends Thread{
        @Override
        public synchronized void run(){
            for (int i = 0; i < 100; i++) {
                counter++;
                System.out.println(this.getName()+": "+counter);
            }
        }
        
    }
    public static class Runner2 extends Thread{
        @Override
        public void run(){
            Object lock = new Object();
            synchronized(lock){
                for (int i = 0; i < 100; i++) {
                    counter++;
                    System.out.println(this.getName()+": "+counter);
                }
            }
        }
    }

    public static class Runner3 extends Thread {
        public void run() {
            for (int i = 0; i < 100; i++) {
                synchronized(globalLock) {
                    counter++;
                    System.out.println(this.getName()+": "+counter);
                }
            }
        }
    }
}