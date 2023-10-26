import java.util.Queue;
import java.util.Stack;
import java.util.LinkedList;

public class Tree{
    private Node root;
    public static class Node{
        private Node parent = null;
        private Node left  = null;
        private Node right = null;
        private String value = null;
        private int depth = 0;

        public static Node build(String value){
            return new Node(value);
        }
        
        public static Node build(String value,Node left, Node right){
            return new Node(value,left,right);
        }

        private Node(String value){this.value=value;}

        private Node(String value,Node left, Node right){
            this.value = value;
            this.insertLeft(left);
            this.insertRight(right);
        }

        public void insertLeft(Node left){
            this.left = left;
            if(left!=null){
                this.left.parent = this;
                this.left.depth = depth + 1;
            }
        }
        public void insertRight(Node right){
            this.right = right;
            if(right!=null){
                this.right.parent = this;
                this.right.depth = depth + 1;
            }
        }
        public Node getLeft(){return left;}

        public Node getRight(){return right;}

        public String getValue(){return value;}

        public void setValue(String value){this.value = value;}

        public void setDepth(int depth){this.depth = depth;}

        public int getDepth(){return depth;}

        private String print(){
            return value;
        }
    }
    private Tree(Node root){this.root = root;}

    public static Tree build(Node root){return new Tree(root);}

    public Node getRoot(){return root;}

    public String depthFirstVisitPreOrder(Node node){
        if (node == null) return "";
        else{

            return node.print() + depthFirstVisitPreOrder(node.getLeft()) + depthFirstVisitPreOrder(node.getRight());
        }
    }

    public String breadthFirstVisit(){
        String s = "";
        Queue<Node> queue = new LinkedList<>();
        queue.add(getRoot());
        while(!queue.isEmpty()){
            Node current = queue.remove();
            if(current!=null){
                s+=current.getValue();
                if(current.getLeft()!=null) queue.add(current.getLeft());
                if(current.getRight()!=null) queue.add(current.getRight());
            }
        }
        return s;
    }
    
    public String depthFirstVisitPreOrder(){
        return depthFirstVisitPreOrder(getRoot());
    }

    public String depthFirstVisitPostOrder(Node node){
        return (node == null) ? "" : depthFirstVisitPostOrder(node.getLeft()) + depthFirstVisitPostOrder(node.getRight()) + node.value;
    }
    public String depthFirstVisitPostOrder(){
        return depthFirstVisitPostOrder(getRoot());
    }
    
    public String depthFirstVisitInOrder(Node node){
        return (node == null) ? "" : depthFirstVisitInOrder(node.getLeft()) + node.value + depthFirstVisitInOrder(node.getRight());
    }
    public String depthFirstVisitInOrder(){
        return depthFirstVisitInOrder(getRoot());
    }
    public String depthFirstVisitPreorderIterative(){
        Stack<Node> stack = new Stack<>();
        stack.push(getRoot());
        String s = "";
        while(!stack.isEmpty()){
            Node current = stack.pop();
            s+=current.getValue();
            // ordine inverso
            if(current.getRight()!=null) stack.push(current.getRight());
            if(current.getLeft()!=null) stack.push(current.getLeft());

        }
        return s;
    }
}