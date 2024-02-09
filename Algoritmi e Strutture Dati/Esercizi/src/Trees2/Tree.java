package Trees2;

import java.util.LinkedList;
import java.util.List;

public class Tree {
	private Node root;
	
	public static class Node {
		private int value;
		private List<Node> children;
		
		public Node(int value) {
			this.value = value;
			this.children = new LinkedList<>();
		}
		
		public Node(int value, List<Node> children) {
			this.value = value;
			this.children = children;
		}
		
		public void setValue(int value) {
			this.value = value;
		}
		
		public int getValue() {
			return value;
		}
		
		public List<Node> getChildren() {
			return children;
		}
		
		public void addChild(Node child) {
			this.children.add(child);
		}
		
		public static Node build(int value) {
			return new Node(value);
		}
		
		public static Node build(int value, List<Node> children) {
			return new Node(value, children);
		}
	}
	
	public Tree() {
	}
	
	public Tree(Node root) {
		this.root = root;
	}
	
	public Node getRoot() {
		return root;
	}
	
	public static Tree build() {
		return new Tree();
	}
	
	public static Tree build(Node root) {
		return new Tree(root);
	}
	
	String visit() {
		return visit(this.getRoot());
	}
	
	private String visit(Node node) {
		String s = "";
		if(node != null) {
			s = node.getValue()+"";
			for(Node child : node.getChildren()) {
				s += visit(child);
			}
		}
		return s;
	}

	public static void main(String[] args) {
		Tree tree = Tree.build(
			Node.build(1, List.of(
				Node.build(2, List.of(
					Node.build(3, List.of(
						Node.build(4),
						Node.build(5))
				)
			)
		))));
		System.out.println(tree.visit());
	}
}
