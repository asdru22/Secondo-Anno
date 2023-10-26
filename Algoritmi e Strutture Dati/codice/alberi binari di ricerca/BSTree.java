import java.util.Arrays;
public class BSTree {
    
    private Node root;
    
    public static class Node {
        private int key;
        private Node left;
        private Node right;
        private Node parent;
        
        public void setKey(int key) {this.key = key;}
        
        public void setLeft(Node left) {this.left = left;}
        
        public void setRight(Node right) {this.right = right;}
        
        public void setParent(Node parent) {this.parent = parent;}
        
        public int getKey() {return key;}
        
        public Node getLeft() {return left;}
        
        public Node getRight() {return right;}
        
        public Node getParent() {return parent;}
        
        private Node(int key) {this.key = key;}
        
        private Node(int key, Node parent, Node left, Node right) {
            this.key = key;
            this.parent = parent;
            this.left = left;
            this.right = right;
        }
        
        public int depth() {
            int depth = -1;
            Node current = this;
            while (current != null) { 
                current = current.getParent();
                depth++;
            }
            return depth;
        }

        public static Node build(int key) {return new Node(key);}
    
        public static Node build(int key, Node parent, Node left, Node right) {return new Node(key, parent, left, right);}
    }
    
    public BSTree (Node node){
        this.root = node;
    }

    public static BSTree build(int key){
        Node root = Node.build(key);
        return new BSTree(root);
    }

    public String toString(Node node){
        if(node==null){return "";}
        else{
            char[] indent = new char[node.depth()];
            Arrays.fill(indent,' ');
            return String.valueOf(indent) + node.getKey() + "\n" + toString(node.getLeft()) + toString(node.getRight());
        }
    }

    public String toString(){
        return toString(getRoot());
    }

    public Node getRoot() {
        return root;
    }
    
    public void setRoot(Node root) {
        this.root = root;
    }
    
    private Node findNode(Node node, int key) {
        Node current = node;
        while (current != null && current.getKey() != key) {
            if (key < current.getKey())
            current = current.getLeft();
            else
            current = current.getRight();
        }
        return current;
    }
    
    public Node findNode(int key) {
        return findNode(getRoot(), key);
    }
    
    public Node min() {
        return min(getRoot());
    }
    
    public Node max() {
        return max(getRoot());
    }
    
    public Node min(Node current) {
        if (current == null)
        return null;
        else
        while (current.getLeft() != null)
        current = current.getLeft();
        return current;
    }
    
    public Node max(Node current) {
        if (current == null)
        return null;
        else
        while (current.getRight() != null)
        current = current.getLeft();
        return current;
    }
    
    // successore: il successore di un nodo u è il più piccolo nodo maggiore di u
    public Node successor(Node node) {
        if (node == null)
        return null;
        else if (node.getRight() != null)
        return min(node.getRight());
        else {
            Node current = node.getParent();
            while (current != null && node.getParent().getRight() == current)
            current = current.getParent();
            return current;
        }
    }
    
    public Node precessor(Node node) {
        if (node == null) return null;
        else if (node.getLeft() != null)
        return max(node.getLeft());
        else {
            Node current = node.getParent();
            while (current != null && node.getParent().getLeft() == current) current = current.getParent();
            return current;
        }
    }
    private void attach(Node parent, Node node){
        if(node.getKey()<parent.getKey()){
            parent.setLeft(node);
            node.setParent(parent);
        } else if(node.getKey()>parent.getKey()){
            parent.setRight(node);
            node.setParent(parent);
        }
    }
    
    public Node insert(int key){
        Node current = getRoot();
        if(current== null){
            Node node = Node.build(key);
            setRoot(node);
            return node;
        }
        else{
            Node parent = null;
            while(current!=null&&current.getKey()!=key){
                parent = current;
                current = (key < current.getKey()) ? current.getLeft() : current.getRight();
            }
            if(current!=null && current.getKey()==key) return null;
            else{
                Node node = Node.build(key);
                attach(parent,node);
                return node;
            }
        }
    }
    
}