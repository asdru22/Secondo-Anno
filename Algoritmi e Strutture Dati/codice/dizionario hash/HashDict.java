public class HashDict {
    private static final int INITIAL_SIZE = 16;
    private Node[] buckets;
    public static class Node{
        private Object key;
        private Object value;
        private Node next;

        public Node(Object key, Object value){
            this.key = key;
            this.value = value;
        }

        public Object getKey() {return key;}
        public Object getValue() {return value;}
        public Node getNext() {return next;}
        public void setNext(Node next) {this.next = next;}
        
    }
    public HashDict(){
        this(INITIAL_SIZE);
    }
    public HashDict(int size){
        this.buckets = new Node[size];
    }
    public void put(Object key, Object value){
        int index = key.hashCode() % INITIAL_SIZE; // dimensione hash code a quella del dizionario
        if(this.buckets[index]==null) this.buckets[index] = new Node(key,value);
        else{ // se gia occupato memorizzo l'elemento successivo e lo aggiungo alla lista
            Node newNode = new Node(key, value);
            Node currentNode = this.buckets[index].getNext();
            this.buckets[index]= newNode;
            newNode.setNext(currentNode);
        }
    }
    
    public Object get(Object key){
        int index = key.hashCode()%this.buckets.length;
        if(this.buckets[index]==null) return null; 
        else{
            Node currentNode = this.buckets[index];
            Node found = null;
            while(currentNode!=null&& found == null){
                if(currentNode.getKey().equals(key)) found = currentNode; 
                else currentNode = currentNode.getNext();
            }
            return found == null ? null : found.getValue();
        }
    }
    public void remove(Object key){
        int index = key.hashCode()% this.buckets.length;
        if(this.buckets[index]!=null){
            if(this.buckets[index].getKey().equals(key)) this.buckets[index]= this.buckets[index].getNext();
            else{
                Node currentNode = this.buckets[index];
                Node prevNode = this.buckets[index];
                Node found = null;
                while(currentNode!=null){
                    if(currentNode!=null && found ==null){
                        if(currentNode.getKey().equals(key)) found = currentNode;
                        else{
                            prevNode = currentNode;
                            currentNode = currentNode.getNext();
                        }
                    }
                    if(found!=null) prevNode.setNext(found.getNext());
                }
            }
        }
    }

}
