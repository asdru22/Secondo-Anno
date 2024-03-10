package Concorrenza;

public class TestAlgorithm {

    public static class Algorithm_1 extends MutualExclusion {
        public Algorithm_1() {
            turn = TURN_0; // turn = 0, si parte dal processo con id 0
        }
        public void enteringCriticalSection(int t) {
            while (turn != t)
                Thread.yield();
        }
        public void leavingCriticalSection(int t) {
            turn = 1 - t; // tocca all'altro quando esco dalla sezione critica
        }
        private volatile int turn;
    }

    public static class Algorithm_2 extends MutualExclusion {
        public Algorithm_2() {
            flag[0] = false;
            flag[1] = false;
        }
        public void enteringCriticalSection(int t) {
            int other = 1 - t;
            flag[t] = true; // il thread t è in sezione critica
            while (flag[other])
                // se il flag di other è true rimango bloccato finché l'altro
                // thread non invoca il leaving critical section
                Thread.yield();
        }
        public void leavingCriticalSection(int t) {
            flag[t] = false;
        }
        private volatile boolean[] flag = new boolean[2];
    }

    public static class Algorithm_3 extends MutualExclusion {
        public Algorithm_3() {
            flag[0] = false;
            flag[1] = false;
            turn = TURN_0;
        }
        public void enteringCriticalSection(int t) {
            // la richiesta viene annotata sul flag e si setta turn a other
            int other = 1 - t;
            flag[t] = true;
            turn = other;
            // se l'altro processo è in esecuzione e tocca all'altro processo allora aspetto.
            // per uno dei due thread (turn == other) sarà falsa e quindi si potrà uscire dal while
            while ((flag[other]) && (turn == other))
                Thread.yield();
        }
        public void leavingCriticalSection(int t) {
            flag[t] = false;
        }
        private volatile int turn;
        private volatile boolean[] flag = new boolean[2];
    }

    public static void main(String[] args) {
        MutualExclusion alg = new Algorithm_2();
        Worker first = new Worker("Runner 0", 0, alg); // thread con id 0
        Worker second = new Worker("Runner 1", 1, alg); // thread con id 1
        first.start();
        second.start();
    }
}