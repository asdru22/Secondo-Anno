package Concorrenza;

public abstract class MutualExclusion {
    public static void criticalSection() {
        // simulate the critical section
    }

    public static void nonCriticalSection() {
        // simulate the non-critical section
    }

    public abstract void enteringCriticalSection(int t);

    public abstract void leavingCriticalSection(int t);

    public static final int TURN_0 = 0;
    public static final int TURN_1 = 1;
}