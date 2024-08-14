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
        Tree t1 = readParentChildPairs(args[0]);
        Tree t2 = readNestedList(args[1]);

        t1.isEqualTo(t2);
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
        // Caso base: se la lista contiene un solo elemento, questo è un nodo dell'albero
        if (children.size() == 1) return new Node((Integer) children.get(0));
        else {
            // Il primo elemento della lista rappresenta sempre il genitore del sotto albero
            // Viene rimosso e si ripete l'algoritmo con i suoi figli
            Node parent = new Node((Integer) children.remove(0));
            for (Object o : children) parent.addChild(treeFromNestedList((List<Object>) o));
            // Si restituisce il nodo genitore con tutti i suoi figli
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
            HashMap<Integer, Node> nodes = new HashMap<>();
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

        public Tree(Node root) {
            this.root = root;
        }

        public Node getRoot() {
            return root;
        }

        String visit() {
            return visit(this.getRoot());
        }

        private String visit(Node node) {
            StringBuilder s = new StringBuilder();
            if (node != null) {
                s = new StringBuilder(node.getValue() + " ");
                for (Node child : node.getChildren()) {
                    s.append(visit(child));
                }
            }
            return s.toString();
        }

        private void isEqualTo(Tree other) {
            String t1 = visit(), t2 = other.visit();
            if (Objects.equals(t1, t2)){
                System.out.println("I due alberi sono uguali.");
            } else {
                System.out.println("I due alberi sono diversi.");

            }
        }

    }

    public static class Node {
        private int value;
        private List<Node> children;

        public Node(int value) {
            this.value = value;
            this.children = new LinkedList<>();
        }

        public int getValue() {
            return value;
        }

        public List<Node> getChildren() {
            return children;
        }

        public void addChild(Node child) {
            this.children.add(child);
            // ogni volta che viene aggiunto un figlio si riordina la lista
            children.sort(Comparator.comparingInt(Node::getValue));
        }
    }
}