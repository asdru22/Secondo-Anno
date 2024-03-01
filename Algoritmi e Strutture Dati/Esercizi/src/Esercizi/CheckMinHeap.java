package Esercizi;

public class CheckMinHeap {
    public static void main(String[] args) {
        double[] a = new double[]{ 3.0, 8.0, 10.0, 12.0, 15.0, 18.0};
        double[] b = new double[]{ 3.0, 1.0, 10.0, 12.0, 15.0, 18.0};

        System.out.println(checkMinHeap(a));
    }
    static boolean checkMinHeap(double[] A){
        /*
        Un min heap è una struttura dati basata su un albero binario completo
        in cui il valore di ogni nodo è minore o uguale al valore dei suoi figli.
        Questo significa che il nodo radice contiene sempre il valore minimo presente nell'heap.
         */
        int n = A.length-1;
        for(int i = 0; i < A[n]; i++){
            if(2*i <= n && A[i] > A[2*i]) return false;
            if(2*i+1 <= n && A[i] > A[2*i+1]) return false;
        }
        return true;
    }
}
