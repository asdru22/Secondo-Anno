package Esercizi.Vecsum;

/**
 * Given an array with n elements, find the nonempty subarray whose
 * sum is maximal. This program implements the brute-force O(n^3)
 * algorithm.
 * <p>
 * The array length n is passed on the command line. No error checking
 * is done.
 * <p>
 * To compile: javac vecsum.java
 * <p>
 * To execute: java vecsum 1000
 * <p>
 * (C) 2013--2016 Moreno Marzolla (http://www.moreno.marzolla.name/)
 * Distributed under the CC-zero 1.0 license
 * https://creativecommons.org/publicdomain/zero/1.0/
 */
public class BruteForce {
    public static void main(String args[]) {
        if (args.length != 1) {
            System.err.println("Usage: java vecsum <array length>");
            System.exit(1);
        }
        int n = Integer.parseInt(args[0]);
        double v[] = new double[n];
        int i, j, k;
        double sum, maxsum, val = 100;
        // Fill array v[] deterministically
        for (i = 0; i < v.length; i++) {
            v[i] = val;
            val += 17;
            if (val > 100) val -= 200;
        }

        // Compute the maximum sum across all subvectors
        long start_t = System.currentTimeMillis(); // current time in milliseconds
        maxsum = v[0];
        for (i = 0; i < n; i++) {
            for (j = i; j < n; j++) {
                sum = 0.0;
                for (k = i; k <= j; k++) {
                    sum += v[k];
                }
                if (sum > maxsum) maxsum = sum;
            }
        }

        long end_t = System.currentTimeMillis();
        System.out.println("Max sum = " + maxsum);
        long elapsed = (end_t - start_t);
        long min = elapsed / (60 * 1000);
        double sec = (elapsed - min * 60) / 1000.0;
        System.out.println("Elapsed time: " + min + " min " + sec + " sec");

    }
}
