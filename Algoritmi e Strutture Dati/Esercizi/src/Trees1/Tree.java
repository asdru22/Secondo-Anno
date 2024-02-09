package Trees1;

import java.util.Arrays;
import java.util.Stack;

public class Tree {
	private Node root;
	
	public static class Node {
		private Node parent = null;
		private Node left = null;
		private Node right = null;
		private String value = null;
		private int depth = 0;

		public static Node build(String value) {
			return new Node(value);
		}
		
		public static Node build(String value, Node left, Node right) {
			return new Node(value, left, right);
		}
		
		private Node(String value) {
			this.value = value;
		}
		
		private Node(String value, Node left, Node right) {
			this.value = value;
			insertLeft(left);
			insertRight(right);
		}
		
		private void updateSubtreeDepth(Node node, int depth) {
			if(node != null) {
				node.setDepth(depth);
				updateSubtreeDepth(node.getLeft(), depth + 1);
				updateSubtreeDepth(node.getRight(), depth + 1);
			}
		}
		
		public void insertLeft(Node left) {
			this.left = left;
			if(left != null) {
				left.parent = this;
				updateSubtreeDepth(left, this.getDepth() + 1);
			}
		}

		public void insertRight(Node right) {
			this.right = right;
			if(right != null) {
				right.parent = this;
				updateSubtreeDepth(right, this.getDepth() + 1);
			}
		}
		
		public void setValue(String value) {
			this.value = value;
		}
		
		public String getValue() {
			return value;
		}
		
		public Node getLeft() {
			return left;
		}
		
		public Node getRight() {
			return right;
		}
		
		public Node getParent() {
			return parent;
		}
		
		public void setDepth(int depth) {
			this.depth = depth;
		}
		
		public int getDepth() {
			return depth;
			
//			Alternatively:
//			int depth = -1;
//			Node current = this;
//			while(current != null) {
//				current = current.getParent();
//				depth++;
//			}
//			return depth;
		}
	}
	
	private Tree(Node root) {
		this.root = root;
	}
	
	public static Tree build(Node root) {
		return new Tree(root);
	}
	
	public Node getRoot() {
		return root;
	}

	private String depthFirstVisitPreorder(Node node) {
		if(node == null) {
			return "";
		} else {
			char[] pad = new char[node.getDepth()];
			Arrays.fill(pad, ' ');
			String stringPad = String.valueOf(pad);
			return  stringPad + node.value + "\n" +
					depthFirstVisitPreorder(node.getLeft()) +
					depthFirstVisitPreorder(node.getRight());
		}
	}
	
	private String depthFirstVisitPostorder(Node node) {
		if(node == null) {
			return "";
		} else {
			return  depthFirstVisitPostorder(node.getLeft()) +
					depthFirstVisitPostorder(node.getRight()) +
					node.getValue();
		}
	}
	
	private String depthFirstVisitInorder(Node node) {
		if(node == null) {
			return "";
		} else {
			return  depthFirstVisitPostorder(node.getLeft()) +
					node.getValue() +
					depthFirstVisitPostorder(node.getRight());
		}
	}
	
	public String depthFirstVisitInorder() {
		return depthFirstVisitInorder(getRoot());
	}
	
	public String depthFirstVisitPreorder() {
		return depthFirstVisitPreorder(getRoot());
	}

	public String depthFirstVisitPreorderIterative() {
		Stack<Node> stack = new Stack<>();
		stack.push(getRoot());
		String s = "";
		while(!stack.isEmpty()) {
			Node current = stack.pop();
			if(current != null) {
				s += current.getValue();
				stack.push(current.getRight());
				stack.push(current.getLeft());
			}
		}
		return s;
	}

	public String depthFirstVisitPostorder() {
		return depthFirstVisitPostorder(getRoot());
	}
}
