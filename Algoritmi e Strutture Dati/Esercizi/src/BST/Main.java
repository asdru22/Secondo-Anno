package BST;

public class Main {
    public static void main(String[] args) {
        BSTree tree = new BSTree(10);
        System.out.println("Create:\n" + tree.dfPreVisit());
        tree.insert(5);
        System.out.println("Add 5:\n" + tree.dfPreVisit());
        tree.insert(15);
        System.out.println("Add 15:\n" + tree.dfPreVisit());
        BSTree.Node node12 = tree.insert(12);
        System.out.println("Add 12:\n" + tree.dfPreVisit());
        tree.insert(18);
        System.out.println("Add 18:\n" + tree.dfPreVisit());
        tree.insert(1);
        System.out.println("Add 1:\n" + tree.dfPreVisit());
        tree.insert(8);
        System.out.println("Add 8:\n" + tree.dfPreVisit());
        System.out.println("Min: "+tree.min());
        System.out.println("Max: "+tree.max());
        System.out.println("Succ(12): "+tree.successor(node12));
        System.out.println("Succ(12): "+tree.successor(tree.findNode(12)));
        System.out.println("Pre(12): "+tree.predecessor(tree.findNode(12)));
        tree.removeValue(18);
        System.out.println("Remove 18:\n" + tree.dfPreVisit());
        tree.removeValue(15);
        System.out.println("Remove 15:\n" + tree.dfPreVisit());
        tree.removeValue(5);
        System.out.println("Remove 5:\n" + tree.dfPreVisit());
        tree.removeValue(10);
        System.out.println("Remove 10:\n" + tree.dfPreVisit());
    }
}
