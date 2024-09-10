import java.io.FileReader;
import java.io.IOException;
import java.util.*;

/*
 Nanni Alessandro
 Matricola 0001027757
 alessandro.nanni17@studio.unibo.it

 Strutture usate:
    minHeap, heapElem, Road, RoadGraph
 Metodi usati:
    shortestPath, richiede tempo O((n+m)*log(n))
 */
public class Esercizio3 {
    public static final boolean USE_RANDOM = false;
    public static final long SEED = 1027757;
    public static Random random = new Random(SEED);

    // viene creato un grafo pesato dal file in input.
    public static void main(String[] args) {
        RoadGraph roadGraph = new RoadGraph(args[0]);

        roadGraph.shortestPaths(0);
        // roadGraph.intersections-1 è l'ultimo nodo
        roadGraph.printPath(roadGraph.intersections - 1);
    }

    public static class MinHeap {
        // pos[id] indica la posizione del heapElem nello heap.
        // heap[pos[id]] è l'elemento heapElem il cui id è uguale a id.
        // heap[x] = y, pos[y] = x, heap[pos[x]].id = x
        // Questo array è usato per eseguire la funzione decreaseKey in tempo log(n).
        heapElem[] heap;
        int[] pos;
        int size, maxSize;

        // costruttore
        public MinHeap(int maxSize) {
            this.heap = new heapElem[maxSize];
            this.maxSize = maxSize;
            this.size = 0;
            this.pos = new int[maxSize];
            Arrays.fill(this.pos, -1);
        }

        //controlla se è un indice valido ovvero 0<i<size
        private boolean valid(int i) {
            return ((i >= 0) && (i < size));
        }

        // scambia heap[i] con heap[j]
        private void swap(int i, int j) {
            // questi controlli vengono utilizzati per assicurarsi che ci
            // sia coerenza tra gli oggetti dello heap prima di scambiarli.
            assert (pos[heap[i].id] == i);
            assert (pos[heap[j].id] == j);

            heapElem tempElem = heap[i];
            heap[i] = heap[j];
            heap[j] = tempElem;
            pos[heap[i].id] = i;
            pos[heap[j].id] = j;
        }

        // restituisce l'indice del genitore di heap[i]
        private int parent(int i) {
            assert (valid(i));
            // -1 perché il primo elemento in un array ha indice 0
            return (i + 1) / 2 - 1;
        }

        // restituisce l'indice del figlio sinistro di heap[i]
        private int leftChild(int i) {
            assert (valid(i));

            return (i + 1) * 2 - 1;
        }

        // restituisce l'indice del figlio destro di heap[i]
        private int rightChild(int i) {
            assert (valid(i));

            return leftChild(i) + 1;
        }

        // controlla se lo heap è vuoto
        public boolean isEmpty() {
            return size == 0;
        }

        // controlla se non ci sono più posti disponibili nel heap
        public boolean isFull() {
            return size > maxSize;
        }

        // restituisce il valore dell'elemento con priorità minore
        public int min() {
            assert (!isEmpty());
            return heap[0].id;
        }

        // restituisce l'indice del figlio di i con priorità minima
        // se non ne ha restituisce -1
        private int minChild(int i) {
            assert (valid(i));

            final int l = leftChild(i);
            final int r = rightChild(i);
            int result = -1;
            if (valid(l)) {
                result = l;
                if (valid(r) && (heap[r].priority < heap[l].priority)) {
                    result = r;
                }
            }
            return result;
        }

        // Scambia heap[i] con il genitore fino a quando si trova nella posizione giusta
        // nel heap con tempo O(log n), dove n è il numero di elementi nello heap.
        // Questa funzione viene chiamata quando si inserisce un nuovo elemento o viene diminuita
        // la priorità di un heap.
        private void moveUp(int i) {
            assert (valid(i));
            int p;
            // finché i non è la radice o la priorità di i è minore di quella del padre
            while (i > 0) {
                p = parent(i);
                if (heap[i].priority >= heap[p].priority) return;
                swap(i, p);
                i = p; // aggiorna l'indice per la prossima iterazione
            }
        }

        // Scambia heap[i] con il figlio di priorità minore fino a quando si trova nella
        // posizione corretta nello heap con tempo O(log n), dove n è il numero di elementi nello heap.
        // Viene usata quando si rimuove l'elemento minimo (la radice) o viene diminuita la priorità di
        // un elemento.
        private void moveDown(int i) {
            assert (valid(i));
            int child;

            do {
                child = minChild(i);
                if (valid(child) && (heap[child].priority < heap[i].priority)) {
                    swap(i, child);
                    i = child;
                } else return;
                
            } while (true);
        }

        // inserisce un valore con priorità nello heap in tempo O(log n)
        public void insert(int data, double priority) {
            assert ((data >= 0) && (data < maxSize));
            assert (pos[data] == -1);
            assert (!isFull());

            final int i = size++;
            pos[data] = i;
            heap[i] = new heapElem(data, priority);
            moveUp(i);
        }

        // rimuove l'elemento con priorità minore in tempo O(log n)
        public void deleteMin() {
            assert (!isEmpty());

            swap(0, size - 1);
            pos[heap[size - 1].id] = -1;
            size--;
            if (size > 0) moveDown(0);
        }

        // cambia la priorità di data in tempo O(log n)
        public void changePriority(int data, double newPriority) {
            int j = pos[data];
            assert (valid(j));
            final double oldPriority = heap[j].priority;
            heap[j].priority = newPriority;
            if (newPriority > oldPriority) {
                moveDown(j);
            } else {
                moveUp(j);
            }
        }
    }


    // un heapElem è una coppia (id, priorità),
    // con 0 < id < maxSize-1
    public static class heapElem {
        public final int id;
        public double priority;

        // costruttore
        public heapElem(int id, double priority) {
            this.id = id;
            this.priority = priority;
        }
    }

    // arco direzionato pesato
    public static class Road {
        final int src;
        final int dst;
        final double time;

        // costruttore
        public Road(int src, int dst, double time) {
            // Dijkstra può essere utilizzato solo con pesi positivi
            assert (time >= 0.0);

            this.src = src;
            this.dst = dst;
            this.time = time;
        }

        // override del metodo toString usato per debug
        @Override
        public String toString(){
            return src+" -> "+dst;
        }
    }

    public static class RoadGraph {
        // numero di incroci/nodi
        int intersections;
        // numero di strade/edge
        int roads;
        // lista di adiacenza
        Vector<LinkedList<Road>> adjList;
        // nodo sorgente
        int source;
        // genitori
        int[] parents;
        // distanza dal nodo sorgente
        double[] time;
        // strade che appartengono al cammino di costo minimo
        LinkedList<Road> shortestTimeRoads;

        // costruttore
        public RoadGraph(String inputf) {
            this.shortestTimeRoads = new LinkedList<>();
            makeGraph(inputf);
        }

        // stampa il percorso più corto dalla sorgente alla destinazione
        protected void printPath(int dst) {
            System.out.printf("%.2f%n", time[dst]);
            printPathRecursive(dst);
        }
        // funzione ricorsiva che risale alla sorgente dalla destinazione
        protected void printPathRecursive(int dst) {
            if (dst == source)
                // caso base
                System.out.print(dst);
            else if (parents[dst] < 0)
                System.out.print("Irraggiungibile");
            else {
                printPathRecursive(parents[dst]);
                System.out.print(" " + dst);
            }
        }

        // crea grafo dal nome del file
        private void makeGraph(String inputf) {
            Locale.setDefault(Locale.US);

            try {
                Scanner f = new Scanner(new FileReader(inputf));
                intersections = f.nextInt();
                roads = f.nextInt();
                // vettore di linkedList di Road
                adjList = new Vector<>();

                // inizializza la lista di adiacenza
                for (int i = 0; i < intersections; i++) {
                    adjList.add(i, new LinkedList<>());
                }

                for (int i = 0; i < roads; i++) {
                    final int src = f.nextInt();
                    final int dst = f.nextInt();
                    final double weight = f.nextDouble();
                    assert (weight >= 0.0);
                    // al nodo a indice della sorgente, aggiunge alla
                    // lista di adiacenza una strada che va da se stesso (src) a un altro (dst)
                    adjList.get(src).add(new Road(src, dst, weight));
                }
            } catch (IOException ex) {
                System.err.println("File non trovato");
                System.exit(1);
            }
        }


        // Algoritmo di Dijkstra per trovare il cammino minimo dal nodo sorgente.
        // Implementato con code di priorità ha costo O((n+m)*log(n)),
        // con n edge e m archi. Costo di estrazione dallo heap O(n*log(n))
        // costo di rilassamento O(m*log(n)).
        public void shortestPaths(int source) {
            // strade che appartengono al cammino minimo
            Road[] shortestRoads = new Road[intersections];
            // coda di priorità che indica il prossimo nodo da esplorare
            MinHeap priorityQueue = new MinHeap(intersections);
            // incroci processati/visi tati
            boolean[] visitedIntersections = new boolean[intersections];
            // tempo dal nodo sorgente a tutti gli altri
            time = new double[intersections];
            // usato per visitare il percorso più breve partendo dalla destinazione
            parents = new int[intersections];
            double newTime;

            // inizializzazione valori
            Arrays.fill(time, Double.POSITIVE_INFINITY);
            Arrays.fill(parents, -1);
            Arrays.fill(visitedIntersections, false);
            time[source] = 0.0;

            // si inseriscono i nodi nella coda, dove la priorità
            // per i nodi diversi da quello sorgente sarà infinito
            for (int n = 0; n < intersections; n++) {
                priorityQueue.insert(n, time[n]);
            }

            // finché la coda ha elementi
            while (!priorityQueue.isEmpty()) {

                // prendi il nodo con priorità minore, ovvero quello più
                // vicino alla sorgente che ancora non è stato visitato,
                // e segnalo come visitato
                // (alla prima iterazione sarà il nodo sorgente)
                final int minNode = priorityQueue.min();
                // nel caso peggiore questa funzione viene chiamata n volte,
                // quindi ha costo totale O(n*log(n))
                priorityQueue.deleteMin();
                visitedIntersections[minNode] = true;

                // alla prima iterazione sarà null
                if (shortestRoads[minNode] != null) {
                    shortestTimeRoads.add(shortestRoads[minNode]);
                }

                // Rilassamento degli edge (che portano a nodi adiacenti a minNode)
                // ogni arco viene visitato solo una volta dato che ci si trova in
                // un grafo direzionato.
                // Questo ciclo for ha un costo trascurabile dato che
                // il numero di strade adiacenti non dipende da n ed è un sottoinsieme di m.
                for (Road road : adjList.get(minNode)) {
                    final int dstNode = road.dst;
                    // Nuovo tempo considerando il tempo di attesa del semaforo
                    newTime = time[minNode] + road.time;
                    if (USE_RANDOM) {
                        newTime = waitRandom(minNode, newTime);
                    } else {
                        newTime = waitConst(minNode, newTime);
                    }

                    // Aggiornamento del tempo minimo se il nodo non è stato
                    // visitato ed è soddisfatta la condizione di rilassamento
                    // newTime minore del tempo attualmente memorizzato per raggiungere dstNode
                    // time[minNode] + road.time + wait < time[dstNode]
                    if (!visitedIntersections[dstNode] && (newTime < time[dstNode])) {
                        // aggiornamento del nuovo tempo, cambio di priorità del nodo destinazione
                        // aggiornamento del nuovo genitore
                        time[dstNode] = newTime;
                        // nel caso peggiore in cui ogni strada deve essere rilassata, questa funzione
                        // viene eseguita m volte, quindi il costo totale è O(m*log(n))
                        priorityQueue.changePriority(dstNode, time[dstNode]);
                        parents[dstNode] = minNode;
                        // road viene messo come percorso più breve per andare da minNode a dstNode
                        shortestRoads[dstNode] = road;
                    }
                }
            }
        }

        // funzione di attesa costante, +5 al tempo di arrivo
        public double waitConst(int id, double arrivalTime) {
            return arrivalTime + 5;
        }

        // funzione di attesa casuale
        public double waitRandom(int id, double arrivalTime) {
            return arrivalTime + random.nextDouble();
        }
    }
}