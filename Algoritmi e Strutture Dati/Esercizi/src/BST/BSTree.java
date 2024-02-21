package BST;

import java.util.Arrays;

public class BSTree {
	private Node root;
	
	public static class Node {
		private int value;
		private Node parent;
		private Node left;
		private Node right;
		
		private Node(int value, Node parent, Node left, Node right) {
			this.value = value;
			this.parent = parent;
			this.left = left;
			this.right = right;
		}
		
		public int getValue() {
			return value;
		}
		
		public Node getLeft() {
			return left;
		}
		
		public Node getRight() {
			return right;
		}
		
		public void setLeft(Node left) {
			this.left = left;
			if(left != null) {
				left.setParent(this);
			}
		}
		
		public void setRight(Node right) {
			this.right = right;
			if(right != null) {
				right.setParent(this);
			}
		}
		
		public void setParent(Node parent) {
			this.parent = parent;
		}
		
		public Node getParent() {
			return parent;
		}
		
		public void setValue(int value) {
			this.value = value;
		}
		
		public int countChildren() {
			int count = 0;
			if(getLeft() != null) {
				count++;
			}
			if(getRight() != null) {
				count++;
			}
			return count;
		}
		
		public int depth() {
			int depth = -1;
			Node current = this;
			while(current != null) {
				current = current.parent;
				depth++;
			}
			return depth;
		}
		
		public static Node build(int value) {
			return new Node(value, null, null, null);
		}

		public static Node build(int value, Node parent) {
			return new Node(value, parent, null, null);
		}

		public static Node build(int value, Node parent, Node left, Node right) {
			return new Node(value, parent, left, right);
		}
		
		@Override
		public String toString() {
			return ""+getValue();
		}
	}
	
	public BSTree(int value) {
		this.root = Node.build(value);
	}
	
	public Node getRoot() {
		return root;
	}

	public String dfPreVisit(Node current) {
		if(current == null) {
			return "";
		} else {
			char[] indentChars = new char[current.depth() * 2];
			Arrays.fill(indentChars, ' ');
			return String.valueOf(indentChars) + current + "\n" +
					dfPreVisit(current.getLeft()) +
					dfPreVisit(current.getRight());
		}
	}

	public String dfPreVisit() {
		return dfPreVisit(getRoot());
	}

	public Node findNode(int value) {
		Node current = getRoot();
		Node found = null;
		while(current != null && found == null) {
			if(value == current.getValue()) {
				found = current;
			} else if(value < current.getValue()) {
				current = current.getLeft();
			} else {
				current = current.getRight();
			}
		}
		return found;
	}

	public void attach(Node parent, Node node) {
		if(node != null) {
			if(node.getValue() < parent.getValue()) {
				parent.setLeft(node);
			} else {
				parent.setRight(node);
			}
		}
	}
	
	public void detach(Node parent, Node child) {
		if(parent != null) {
			if(parent.getLeft() == child) {
				parent.setLeft(null);
			} else if(parent.getRight() == child) {
				parent.setRight(null);
			}
		}
	}

	public Node max() {
		return max(getRoot());
	}
	
	public Node max(Node node) {
		if(node == null) {
			return null;
		} else {
			if(node.getRight() == null) {
				return node;
			} else {
				return max(node.getRight());
			}
		}
	}
	
	public Node min(Node node) {
		if(node == null) {
			return null;
		} else {
			if(node.getLeft() == null) {
				return node;
			} else {
				return min(node.getLeft());
			}
		}
	}
	
	public Node min() {
		return min(getRoot());
	}

	public Node successor(Node node) {
		if(node.getRight() != null) {
			return min(node.getRight());
		} else {
			Node parent = node.getParent();
			while(parent != null && node == parent.getRight()) {
				node = parent;
				parent = node.getParent();
			}
			return parent;
		}
	}

	public Node predecessor(Node node) {
		if(node.getLeft() != null) {
			return max(node.getLeft());
		} else {
			Node parent = node.getParent();
			while(parent != null && node == parent.getLeft()) {
				node = parent;
				parent = node.getParent();
			}
			return parent;
		}
	}

	public Node insert(int value) {
		Node current = getRoot();
		Node previous = null;
		boolean found = false;
		while(current != null && !found) {
			if(current.value == value) {
				found = true;
			} else {
				previous = current;
				current = ( value < current.getValue() ) ? current.getLeft() : current.getRight();
			}
		}
		if(!found) {
			Node node = Node.build(value);
			attach(previous, node);
			return node;
		} else {
			return null;
		}
	}

	public void remove(Node node) {
		if(node.getLeft() == null && node.getRight() == null) {
			//case 1: node with no children
			detach(node.getParent(), node);
		} else if(node.countChildren() == 1) {
			//case 2: node with one child
			Node child = node.getLeft() == null ? node.getRight() : node.getLeft();
			detach(node.getParent(), node);
			attach(node.getParent(), child);
		} else {
			//case 3: node with two children
			//find the successor
			Node successor = min(node.getRight());
			//alternatively: Node successor = successor(node);
			//replace the current value with its successor's value
			node.setValue(successor.getValue());
			//link its parent with the successor's right child (the successor will have no left child)
			if(successor.getParent().getLeft() == successor) {
				successor.getParent().setLeft(successor.getRight());
			} else {
				successor.getParent().setRight(successor.getRight());
			}
		}
	}

	public void removeValue(int value) { // rimove valore
		Node node = findNode(value);
		if(node != null) {
			remove(node);
		}
	}

	public void removeNode(Node node) { // rimuove nodo
		if(node.getLeft() == null && node.getRight() == null) {
			//case 1: node with no children
			detach(node.getParent(), node);
		} else if(node.countChildren() == 1) {
			//case 2: node with one child
			Node child = node.getLeft() == null ? node.getRight() : node.getLeft();
			detach(node.getParent(), node);
			attach(node.getParent(), child);
		} else {
			//case 3: node with two children
			//find the max in the left subtree
			Node leftMax = max(node.getLeft());
			//copy its value overriding the value of current node
			node.setValue(leftMax.getValue());
			//detach leftMax
			if(leftMax.getParent().getLeft() == leftMax) {
				leftMax.getParent().setLeft(null);
			} else {
				leftMax.getParent().setRight(null);
			}
		}
	}

	public void removeNode(int value) {
		Node node = findNode(value);
		if(node != null) {
			removeNode(node);
		}
	}
}
