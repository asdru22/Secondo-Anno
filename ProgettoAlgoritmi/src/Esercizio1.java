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
        costrutto del genere. Ha costo computazionale O(n) dove n è la lunghezza della stringa
        */

        // Quando si incontra un nuovo livello di nesting
        // (indicato dal carattere '['), una nuova lista viene aggiunta allo stack.
        // Quando si incontra il carattere ']', si torna al livello di annidamento precedente,
        // rimuovendo la lista dal top dello stack.

        Stack<List<Object>> stack = new Stack<>();
        List<Object> currentList = new ArrayList<>(), newList;
        StringBuilder stringBuilder = new StringBuilder();

        for (char c : str.toCharArray()) {
            if (c == '[') {
                /*
                Quando si incontra '[', viene creata una nuova lista. Se c'è già una lista nello stack
                (ovvero c'è un livello di annidamento superiore), questa nuova lista viene
                aggiunta alla lista in cima allo stack. Successivamente, la nuova lista
                viene spinta nello stack, diventando la lista corrente.
                */
                newList = new ArrayList<>();
                if (!stack.isEmpty()) {
                    // se lo stack contiene già liste, si mette la nuova in cima
                    stack.peek().add(newList);
                }
                // la lista corrente viene messa in cima allo stack (è il livello di nesting più esterno)
                stack.push(newList);

            } else if (Character.isDigit(c)) {
                // caso numero reale, viene definito come nodo padre di quelli
                // della lista a seguire
                stringBuilder.append(c);
            } else if (c == ',' && !stringBuilder.isEmpty()) { // gestione virgole separatrici
                // come nel caso ']', l'int che si ottiene facendo il parsing del builder
                // viene messo all'inizio della nuova lista come nodo padre
                stack.peek().add(Integer.parseInt(stringBuilder.toString()));
                stringBuilder.setLength(0);

            } else if (c == ']' && !stringBuilder.isEmpty()) {
                // Termina la lista e viene rimossa dallo stack,
                // tornando al livello di annidamento precedente.
                // se la lista non è vuota si prova a convertire la stringa costruita
                // in un intero e poi si resetta lo stringBuilder
                // l'int appena creato viene messo all'inizio della nuova lista come nodo padre
                stack.peek().add(Integer.parseInt(stringBuilder.toString()));
                stringBuilder.setLength(0);

                currentList = stack.pop();

            }
        }
        return currentList;
    }

    private static Tree readNestedList(String filename) {
        try (BufferedReader reader = new BufferedReader(new FileReader(filename))) {
            String line;
            while ((line = reader.readLine()) != null) {
                // c'è solo una riga da leggere
                List<Object> list = parseNestedList(line);
                return new Tree(treeFromNestedList(list));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static Node treeFromNestedList(List<Object> children) {
        // Questo algoritmo ha costo computazionale O(n^2), dove n è il numero di nodi nell'albero
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
            // dizionario che contiene il valore e il nodo corrispondente a quel valore
            HashMap<Integer, Node> nodes = new HashMap<>();
            // lista dei nodi genitori, ovvero quelli che hanno parent = null
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

                // Se il valore del nodo figlio è già presente nel dizionario,
                // viene prelevato, altrimenti viene aggiunto
                if (nodes.containsKey(childValue)) {
                    // questa assegnazione garantisce di lavorare sul nodo giusto
                    // se un nodo figlio con lo stesso valore era già presente
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
            // si crea un nuovo albero che ha come radice l'unico nodo dalla lista dei padri
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

        public String visit() {
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
            if (Objects.equals(t1, t2)) {
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
            // questa funzione di sorting ha costo computazionale O(n*log(n)),
            // dove n è la dimensione della lista
            children.sort(Comparator.comparingInt(Node::getValue));
        }
    }
}