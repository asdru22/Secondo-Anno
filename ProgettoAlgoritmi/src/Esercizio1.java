import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

/*
 * Nanni Alessandro
 * Matricola 0001027757
 * alessandro.nanni17@studio.unibo.it
 */

public class Esercizio1 {

    public static void main(String[] args) {
        Tree t1 = readParentChildPairs("src/" + args[0]);
        Tree t2 = readNestedList("src/" + args[1]);

        // restituiscono due stringhe diverse
        // dato che l'ordine dei figli nella lista è diverso
        System.out.println(t1.visit());
        System.out.println(t2.visit());

        System.out.println(areEqual(t1, t2));
    }

    public static boolean areEqual(Tree t1, Tree t2) {
        /*
        Converto i due alberi in dizionari del tipo
        Key = depth, value = Lista di nodi a quella profondità/livello
        Confronto se i due dizionari hanno lo stesso numero di chiavi (= stessa profondità)
        Se è falso è ovvio che i due alberi sono diversi e non sono richiesti altri controlli
        Se è vero si controlla che le liste corrispondenti a ogni livello di profondità del dizionario
        siano uguali
        */
        Map<Integer, List<Integer>> d1 = t1.toDict(), d2 = t2.toDict();
        int size = d1.keySet().size();

        if (size != d2.keySet().size()) return false;
        List<Integer> l1, l2;
        for (int i = 0; i < size; i++) {
            l1 = d1.get(i);
            l2 = d2.get(i);

            // se tutti gli elementi di l2 sono in l1 e viceversa, allora
            // le due liste hanno gli stessi elementi (non serve ordinarla)
            if (!l1.containsAll(l2) && l2.containsAll(l1)) {
                return false;
            }
        }
        return true;
    }


    private static List<Object> parseNestedList(String str) {
        /*
        Si itera su ogni carattere della lista per costruire un costrutto del tipo
        (int, lista di oggetti). La lista di oggetti conterrà a sua volta un altro
        costrutto del genere.
        */
        Stack<List<Object>> stack = new Stack<>();
        List<Object> currentList = new ArrayList<>();
        StringBuilder stringBuilder = new StringBuilder();

        for (char ch : str.toCharArray()) {
            if (Character.isDigit(ch)) {
                // caso numero reale, viene definito come nodo padre di quelli
                // della lista a seguire
                stringBuilder.append(ch);
            } else if (ch == '[') {
                // Si crea una nuova lista che corrisponde al livello di nesting
                // se lo stack non è vuoto significa che c'è una lista ad livello superiore di nesting,
                // quindi mettiamo in testa la nuova lista per indicare che è quella a profondità massima.
                // Se lo stack è vuoto significa che siamo al livello di nesting massimo e possiamo
                List<Object> newList = new ArrayList<>();
                if (!stack.isEmpty()) {
                    stack.peek().add(newList);
                }
                stack.push(newList);
            } else if (ch == ']') {
                // caso fine lista
                if (stringBuilder.length() > 0) {
                    // se la lista non è vuota si prova a convertire la stringa costruita
                    // in un intero e poi si resetta lo stringBuilder
                    // l'int appena creato viene messo all'inizio della nuova lista come nodo padre
                    stack.peek().add(Integer.parseInt(stringBuilder.toString()));
                    stringBuilder.setLength(0);
                }
                // si ritorna al livello di nesting precedente
                currentList = stack.pop();
            } else if (ch == ',') { // gestione virgole separatrici
                if (stringBuilder.length() > 0) {
                    // come nel caso ']', l'int che si ottiene facendo il parsing del builder
                    // viene messo all'inizio della nuova lista come nodo padre
                    stack.peek().add(Integer.parseInt(stringBuilder.toString()));
                    stringBuilder.setLength(0);
                }
            }
        }

        return currentList;
    }

    private static Tree readNestedList(String filename) {
        try (BufferedReader reader = new BufferedReader(new FileReader(filename))) {
            String line;
            while ((line = reader.readLine()) != null) {
                List<Object> list = parseNestedList(line);
                return new Tree(treeFromNestedList(list));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static Node treeFromNestedList(List<Object> children) {
        if (children.size() == 1) return new Node((Integer) children.get(0));
        else {
            Node parent = new Node((Integer) children.remove(0));
            for (Object o : children) parent.addChild(treeFromNestedList((List<Object>) o));
            return parent;
        }
    }

    private static Tree readParentChildPairs(String filename) {
        /*
        Legge ogni riga del file per trovare il valore dei due nodi.
        Il primo, che corrisponde al genitore viene aggiunto ad un dizionario, che ha come chiave il suo valore
        Il secondo, che corrisponde al figlio viene aggiunto alla lista dei figli del nodo padre, ottenendo l'oggetto
        del nodo padre tramite il valore del padre usato nel dizionario.
        Se il figlio era stato messo in precedenza nella lista dei padri, si elimina. In questo modo si ottiene una
        lista con un solo valore, quello che è mappato al nodo padre.
         */
        try (BufferedReader reader = new BufferedReader(new FileReader(filename))) {

            String line;
            Node parent, child;
            String[] pairs;
            HashMap<Integer, Node> nodes = new HashMap();
            ArrayList<Integer> parents = new ArrayList<>();
            int parentValue, childValue;
            while ((line = reader.readLine()) != null) {
                pairs = line.split(",");
                // Ottengo valore numerico del padre e del figlio
                parent = new Node(Integer.parseInt(pairs[0].trim()));
                child = new Node(Integer.parseInt(pairs[1].trim()));
                parentValue = parent.getValue();
                childValue = child.getValue();

                // se non è sul dizionario, aggiungi il genitore alla lista
                // dei genitori e al dizionario
                if (!nodes.containsKey(parentValue)) {
                    nodes.put(parentValue, parent);
                    parents.add(parentValue);
                }

                // Se il nodo figlio è già presente, viene aggiunto
                // alla dizionario, altrimenti viene cercato
                if (nodes.containsKey(childValue)) {
                    child = nodes.get(childValue);
                } else {
                    nodes.put(childValue, child);
                }

                // aggiunge il figlio al nodo genitore
                nodes.get(parentValue).addChild(child);

                // se la lista dei genitori contiene un valore che è anche figlio di un
                // altro nodo, rimuovilo
                if (parents.contains(childValue)) {
                    parents.remove((Integer) childValue);
                }

            }

            return new Tree(nodes.get(parents.get(0)));

        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static class Tree {
        private Node root;

        public Tree() {
        }

        public Tree(Node root) {
            this.root = root;
        }

        public Node getRoot() {
            return root;
        }

        public Map<Integer, List<Integer>> toDict() {
            /*
            Visita per livello dell'albero (BFS)
            Si usa una coda per tenere traccia dei nodi del livello.+
            Inizialmente vi è solo la radice, all'iterazione successiva ci saranno i
            figli della radice, e cosi via. Il ciclo while termina quando la coda
            è vuota, ovvero nessuno dei nodi del livello ha figli.
            */

            Map<Integer, List<Integer>> dict = new HashMap<>();
            Queue<Node> nodeQueue = new LinkedList<>();
            nodeQueue.add(root);
            int depth = 0, levelSize;
            Node currentNode;
            List<Integer> currentLevel;

            while (!nodeQueue.isEmpty()) {
                // nodeQueue contiene già i nodi corrispondenti a questo livello
                levelSize = nodeQueue.size();
                currentLevel = new ArrayList<>();

                // itera su ogni nodo della lisa per rimuoverlo e aggiungerlo
                // ai nodi di quel livello
                for (int i = 0; i < levelSize; i++) {
                    currentNode = nodeQueue.peek();
                    currentLevel.add(currentNode.getValue());

                    // aggiungi tutti i figli allo stack
                    nodeQueue.addAll(currentNode.children);
                }
                dict.put(depth, currentLevel);
                depth++;
            }
            return dict;
        }

        String visit() {
            return visit(this.getRoot());
        }

        private String visit(Node node) {
            String s = "";
            if (node != null) {
                s = node.getValue() + " ";
                for (Node child : node.getChildren()) {
                    s += visit(child);
                }
            }
            return s;
        }
    }

    public static class Node {
        private int value;
        private List<Node> children;
        private Node parent = null;

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

        public void setParent(Node parent) {
            this.parent = parent;
        }

        public Node getParent() {
            return parent;
        }

        public List<Node> getChildren() {
            return children;
        }

        public void addChild(Node child) {
            this.children.add(child);
            child.setParent(this);
        }
    }
}