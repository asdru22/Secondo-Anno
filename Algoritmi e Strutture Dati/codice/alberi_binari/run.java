class run{ 
public static void main(String[] args) {
    Tree tree = Tree.build(
        Tree.Node.build("A",
            Tree.Node.build("B",
                Tree.Node.build("C"),
                Tree.Node.build("D")
            ),
            Tree.Node.build("E", 
                Tree.Node.build("F"),
                Tree.Node.build("G")
            )
        )
    );
    /*
     * A
            B
                C
                D
            E
                F
                G
     */         
    System.out.println("Pre Order: "+tree.depthFirstVisitPreOrder());
    //System.out.println("Pre Order Iterativa: "+tree.depthFirstVisitPreorderIterative());
    //System.out.println("Post Order: "+tree.depthFirstVisitPostOrder());
    //System.out.println("In Order: "+tree.depthFirstVisitInOrder());

    }
}