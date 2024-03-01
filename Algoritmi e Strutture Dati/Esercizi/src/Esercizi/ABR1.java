package Esercizi;

import BST.BSTree;

public class ABR1 {
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
        System.out.println(tree.dfPreVisit());

    }
}
