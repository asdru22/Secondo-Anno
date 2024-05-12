package Concorrenza;
import java.util.concurrent.Semaphore;

public class test {
    // Semaphore for thread A to control its execution
    private static Semaphore semaphoreT = new Semaphore(1);
    // Semaphore for thread B to control its execution
    private static Semaphore semaphoreS = new Semaphore(0);
    // Semaphore for thread C to control its execution

    public static void main(String[] args) {
        Thread threadA = new Thread(() -> {
               
                    //semaphoreT.acquire(); // Thread A waits until it can acquire the semaphore
                    System.out.println("Thread A is running");
                    semaphoreS.release();
                
            
        });

        Thread threadB = new Thread(() -> {
                try {
                    semaphoreS.acquire(); // Thread B waits until it can acquire the semaphore
                    System.out.println("Thread B is running");
                    semaphoreS.release();
                    //semaphoreT.acquire();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            
        });

        Thread threadC = new Thread(() -> {
                try {
                    semaphoreS.acquire(); // Thread C waits until it can acquire the semaphore
                    System.out.println("Thread C is running");
                    semaphoreS.release();
                    //semaphoreT.acquire();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            
        });

        // Start the threads
        threadC.start();
        threadA.start();
        threadB.start();
    }
}
