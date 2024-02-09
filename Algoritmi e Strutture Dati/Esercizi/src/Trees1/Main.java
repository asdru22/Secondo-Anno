package Trees1;

import Trees1.Tree.Node;

public class Main {

	public static void main(String[] args) {
		Tree tree = Tree.build(
			Node.build("A",
				Node.build("B",
					Node.build("C"),
					Node.build("D")
				),
				Node.build("E",
					Node.build("F"),
					Node.build("G")
				)
			)
		);
		System.out.println("Pre:\n"+ tree.depthFirstVisitPreorder());
		System.out.println("Pre - iterative: " + tree.depthFirstVisitPreorderIterative());
		System.out.println("Post: " + tree.depthFirstVisitPostorder());
		System.out.println("In: " + tree.depthFirstVisitInorder());
	}
}
