package Esercizi;

public class Es1 {
    public static void main(String[] args) {
        int[] v = {3, -5, 10, 2, -3, 1, 4, -8, 7, -6, -1};
        System.out.println(sommaMaxBruteForce(v));
    }

    public static int sommaMaxBruteForce(int[] v) {
        int smax = v[0];
        int n = v.length;
        int s;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                s = 0;
                for (int k = i; k < j; k++) {
                    s += v[k];
                }
                if (s > smax) smax = s;
            }
        }
        return smax;
    }
}
