import java.io.FileReader;
import java.io.IOException;
import java.util.*;

/*
 * Nanni Alessandro
 * Matricola 0001027757
 * alessandro.nanni17@studio.unibo.it
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
        roadGraph.printPath(roadGraph.intersections-1);
    }

    public static class MinHeap {
        heapElem[] heap;
        /* pos[id] is the position of "id" inside the heap. Specifically,
           heap[pos[id]].key == id. This array is required to make
           decreaseKey() run in log(intersections) time. */
        int[] pos;
        int size, maxSize;

        /**
         * Build an empty heap with at most maxSize elements
         */
        public MinHeap(int maxSize) {
            this.heap = new heapElem[maxSize];
            this.maxSize = maxSize;
            this.size = 0;
            this.pos = new int[maxSize];
            Arrays.fill(this.pos, -1);
        }


        //controlla se è un indice valido ovvero i>=0 and i<size

        private boolean valid(int i) {
            return ((i >= 0) && (i < size));
        }

        // scambia heap[i] with heap[j]
        private void swap(int i, int j) {
            assert (pos[heap[i].data] == i);
            assert (pos[heap[j].data] == j);

            heapElem elemTmp = heap[i];
            heap[i] = heap[j];
            heap[j] = elemTmp;
            pos[heap[i].data] = i;
            pos[heap[j].data] = j;
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

        public boolean isEmpty() {
            return (size == 0);
        }

        // controlla se non ci sono più posti disponibili nel heap
        public boolean isFull() {
            return (size > maxSize);
        }

        // restituisce il valore dell'elemento con priorità minore
        public int min() {
            assert (!isEmpty());
            return heap[0].data;
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
        // nel heap. Richiede tempo O(log n) con n numero di elementi nello heap.
        // Questa funzione viene chiamata quando si inserisce un nuovo elemento o viene diminuita
        // la priorità di un heap.
        private void moveUp(int i) {
            assert (valid(i));

            int p = parent(i);
            while ((p >= 0) && (heap[i].priority < heap[p].priority)) {
                swap(i, p);
                i = p;
                p = parent(i);
            }
        }

        // Scambia heap[i] con il figlio di priorità minore fino a quando si trova nella
        // posizione corretta nello heap. Richiede tempo O(log n) con n numero di elementi nello heap.
        // Viene usata quando si rimuove l'elemento minimo (la radice) o viene diminuita la priorità.
        private void moveDown(int i) {
            assert (valid(i));

            boolean done = false;
            do {
                int dst = minChild(i);
                if (valid(dst) && (heap[dst].priority < heap[i].priority)) {
                    swap(i, dst);
                    i = dst;
                } else {
                    done = true;
                }
            } while (!done);
        }

        /**
         * Insert a new pair (data, prio) into the queue.
         * This method requires time O(log intersections).
         */
        public void insert(int data, double prio) {
            assert ((data >= 0) && (data < maxSize));
            assert (pos[data] == -1);
            assert (!isFull());

            final int i = size++;
            pos[data] = i;
            heap[i] = new heapElem(data, prio);
            moveUp(i);
        }

        /**
         * Delete the element with minimum priority. This method requires
         * time O(log intersections).
         */
        public void deleteMin() {
            assert (!isEmpty());

            swap(0, size - 1);
            pos[heap[size - 1].data] = -1;
            size--;
            if (size > 0) moveDown(0);
        }

        /**
         * Change the priority associated to |data|. This method requires
         * time O(log intersections).
         */
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

    /**
     * A heap element is a pair (id, priority), where
     * id is an integer in 0..(maxSize-1)
     */
    public static class heapElem {
        public final int data;
        public double priority;

        public heapElem(int data, double priority) {
            this.data = data;
            this.priority = priority;
        }
    }

    // arco direzionato pesato
    public static class Road {
        final int src;
        final int dst;
        final double time;

        public Road(int src, int dst, double time) {
            // Dijkstra può essere utilizzato solo con pesi positivi
            assert (time >= 0.0);

            this.src = src;
            this.dst = dst;
            this.time = time;
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

        // crea il grafico dal file di input
        public RoadGraph(String inputf) {
            this.shortestTimeRoads = new LinkedList<>();
            readGraph(inputf);
        }

        // Stampa il percorso più corto dalla sorgente alla destinazione
        protected void printPath(int dst){
            System.out.printf("%.2f%n", time[dst]);
            printPathRecursive(dst);
        }
        protected void printPathRecursive(int dst) {
            if (dst == source)
                System.out.print(dst);
            else if (parents[dst] < 0)
                System.out.print("Irraggiungibile");
            else {
                printPathRecursive(parents[dst]);
                System.out.print(" " + dst);
            }
        }

        private void readGraph(String inputf) {
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
                System.err.println(ex);
                System.exit(1);
            }
        }

        /*
        Algoritmo di Dijkstra per trovare il cammino minimo dal nodo sorgente
        */
        public void shortestPaths(int source) {
            // strade che appartengono al cammino minimo
            Road[] shortestRoads = new Road[intersections];
            // incroci processati/visitati
            boolean[] visitedIntersections = new boolean[intersections];
            // coda di priorità che indica il prossimo nodo da esplorare
            MinHeap priorityQueue = new MinHeap(intersections);
            // tempo dal nodo sorgente a tutti gli altri
            time = new double[intersections];
            // usato per visitare il percorso più breve partendo dalla destinazione
            parents = new int[intersections];

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
                priorityQueue.deleteMin();
                visitedIntersections[minNode] = true;

                // alla prima iterazione sarà null
                if (shortestRoads[minNode] != null) {
                    shortestTimeRoads.add(shortestRoads[minNode]);
                }

                // rilassamento degli edge (che portano a nodi adiacenti a minNode)
                for (Road road : adjList.get(minNode)) {
                    final int dstNode = road.dst;

                    // Nuovo tempo considerando il tempo di attesa del semaforo
                    double newTime = time[minNode] + road.time;
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
                        priorityQueue.changePriority(dstNode, time[dstNode]);
                        parents[dstNode] = minNode;
                        // road viene messo come percorso più breve per andare da minNode a dstNode
                        shortestRoads[dstNode] = road;
                    }
                }
            }
        }

        public double waitConst(int id, double arrivalTime) {
            return arrivalTime + 5;
        }

        public double waitRandom(int id, double arrivalTime) {
            return arrivalTime + random.nextDouble();
        }
    }
}