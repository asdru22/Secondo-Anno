class run{ 
public static void main(String[] args) {
        BSTree tree = BSTree.build(5);
        System.out.println(tree.toString());
        tree.insert(1);
        tree.insert(2);
        tree.insert(3);
        tree.insert(4);
        tree.insert(9);
        tree.insert(6);
        tree.insert(7);
        tree.insert(8);


        System.out.println(tree.toString());
    }
}  