package Esercizi;

import BST.BSTree;

public class ABR2 {
    public static void main(String[] args) {
        BSTree tree = new BSTree(17);
        tree.insert(7);
        tree.insert(9);
        tree.insert(-3);
        tree.insert(20);
        tree.insert(19);
        tree.insert(5);
        tree.insert(2);
        tree.insert(6);
        //System.out.println(controllaIntervallo(tree,-4,21));
        System.out.println(controllaIntervalloIter(tree.getRoot(),-5,21)); //


    }
    public static boolean controllaIntervallo(BSTree t,int a, int b){
        /*
        algoritmo che restituisce true se tutti i valori
        dell'albero binario sono compresi tra a e b, false altrimenti.
         */
        return a <= t.min().getValue() && b >= t.max().getValue();
    }
    public static boolean controllaIntervalloIter(BSTree.Node t, int a, int b){
        if(t==null) return true;
        else return a <= t.getValue() && t.getValue() <= b &&
                controllaIntervalloIter(t.getLeft(),a,t.getValue()) &&
                controllaIntervalloIter(t.getRight(),t.getValue(),b);
    }
}
