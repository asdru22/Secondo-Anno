```java

```
l'istruzione `nextLine()` è bloccante, bisogna usare thread.
`interrupt` per flippare il bit di un thread
`isInterrupted()` controlla se quel thread è stato interrotto.
ogni oggetto in java è dotato di un monitor (e sono dotati di wait e notify)
il lock è condiviso tra i thread
i metodi `synchronized` cedono il lock se sollevano eccezioni. il lock viene chiamato sull'oggetto chiamante.
notify è arbitrario, la JVM risveglia un thread a caso. 

```java
public void increaseTwoCounters(Counter c1, Counter c2) {
    // problema dei filosofi a cena
    // race condition per acquisire il lock
    synchronized(c1) {
        synchronized(c2) {
            c1.increase();
            c2.increase();
        }
    }
}
Counter c1 = new Counter();
Counter c2 = new Counter();
Thread t1 = new Thread(() -> {
    increaseTwoCounters(c1, c2);
});
Thread t2 = new Thread(() -> {
    increaseTwoCounters(c2, c1);
});
t1.start();
t2.start();
```
Si risolve il deadlock prendendo sempre per primo il lock a c1
se si prende il lock tra più risorse senza un ordine preciso si va sempre in deadlock

Thread t1: Object lock = new Object(); for (int i = 0; i < 100; i++) { synchronized(lock) { counter++; } } 
Thread t2: Object lock = new Object(); for (int i = 0; i < 100; i++) { synchronized(lock) { counter++; } }

il lock è su due oggetti diversi, sono due lock diversi nonostante abbia lo stesso nome.