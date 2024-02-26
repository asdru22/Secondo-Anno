package Esercizi.Vecsum;

/**
 * Given an array with n>0 elements, find the nonempty subarray whose
 * sum is maximal. This program implements the O(n)
 * dynamic programming algorithm.
 *
 * The array length n is passed on the command line.  No error
 * checking is done. The vector is initialized deterministically.
 *
 * To compile: javac vecsumpd.java
 *
 * To execute: java vecsumpd 10000
 *
 * (C) 2017 Gianluigi Zavattaro (https://www.unibo.it/sitoweb/gianluigi.zavattaro)
 * Distributed under the CC-zero 1.0 license
 * https://creativecommons.org/publicdomain/zero/1.0/
 *
 */
public class vecsumpd {

    /**
     * Return the maximum sum of the values among all nonempty
     * subvectors of v[i..j].
     */
    static double vecsumpd( double v[] )
    {
      double s[] = new double[v.length];
      int i, imax;

      s[1] = v[1];
      imax = 1;

      for (i=1; i<s.length; i++) {
        if (s[i-1]+v[i] >= v[i])
          s[i] = s[i-1]+v[i];
        else
          s[i] = v[i];
        if (s[i] > s[imax]) imax = i;
      }

      return s[imax];
    }

    public static void main( String args[] ) {

      if ( args.length != 1 ) {
        System.err.println("Usage: java vecsumpd <array length>");
        System.exit(1);
      }

      int n = Integer.parseInt(args[0]);
      double v[] = new double[n];
      int i,j,k;
      double sum, maxsum, val = 100;

      // Fill vector V[]
      for (i=0; i<v.length; ++i) {
        v[i] = val;
        val += 17;
        if ( val > 100 ) val -= 200;
      }

      // Compute the maximum sum among all subvectors
      long start_t = System.currentTimeMillis();
      maxsum = vecsumpd(v);
      long end_t = System.currentTimeMillis();
      System.out.println("Max sum = " + maxsum);
      long elapsed = (end_t - start_t);
      long min = elapsed / (60*1000);
      double sec = (elapsed -min*60)/1000.0;
      System.out.println("Elapsed time: "+min+" min "+sec+" sec");
    }

  }
