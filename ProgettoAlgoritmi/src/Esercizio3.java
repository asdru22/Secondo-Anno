import java.io.FileReader;
import java.io.IOException;
import java.util.*;

/*
 * Nanni Alessandro
 * Matricola 0001027757
 * alessandro.nanni17@studio.unibo.it
 */
public class Esercizio3 {
    public static final boolean USE_RANDOM = true;
    public static final long SEED = 10000;
    public static Random random = new Random(SEED);

    // viene creato un grafo pesato dal file in input.
    public static void main(String[] args) {
        RoadGraph roadGraph = new RoadGraph(args[0]);

        roadGraph.shortestPaths(0);
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

        /**
         * Return true iff index i is a valid index in the heap,
         * i.e., i>=0 and i<size
         */
        private boolean valid(int i) {
            return ((i >= 0) && (i < size));
        }

        /**
         * swap heap[i] with heap[j]
         */
        private void swap(int i, int j) {
            assert (pos[heap[i].data] == i);
            assert (pos[heap[j].data] == j);

            heapElem elemTmp = heap[i];
            heap[i] = heap[j];
            heap[j] = elemTmp;
            pos[heap[i].data] = i;
            pos[heap[j].data] = j;
        }

        /**
         * Return the index of the parent of heap[i]
         */
        private int parent(int i) {
            assert (valid(i));
            // -1 perché il primo elemento in un array ha indice 0
            return (i + 1) / 2 - 1;
        }

        /**
         * Return the index of the left child of heap[i]
         */
        private int leftChild(int i) {
            assert (valid(i));

            return (i + 1) * 2 - 1;
        }

        /**
         * Return the index of the right child of heap[i]
         */
        private int rightChild(int i) {
            assert (valid(i));

            return leftChild(i) + 1;
        }

        /**
         * Return true iff the heap is empty
         */
        public boolean isEmpty() {
            return (size == 0);
        }

        /**
         * Return true iff the heap is full, i.e., no more available slots
         * are available.
         */
        public boolean isFull() {
            return (size > maxSize);
        }

        /**
         * Return the data of the element with the lowest priority
         */
        public int min() {
            assert (!isEmpty());
            return heap[0].data;
        }

        /**
         * Return the position of the child of i (if any) with minimum
         * priority. If i has no children, return -1.
         */
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

        /**
         * Exchange heap[i] with the parent element until it reaches the
         * correct position into the heap. This method requires time O(log intersections).
         */
        private void moveUp(int i) {
            assert (valid(i));

            int p = parent(i);
            while ((p >= 0) && (heap[i].priority < heap[p].priority)) {
                swap(i, p);
                i = p;
                p = parent(i);
            }
        }

        /**
         * Exchange heap[i] with the child with the lowest priority, if any
         * exists, until it reaches the correct position into the heap.
         * This method requires time O(log intersections).
         */
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
        public void changePriority(int data, double newprio) {
            int j = pos[data];
            assert (valid(j));
            final double oldprio = heap[j].priority;
            heap[j].priority = newprio;
            if (newprio > oldprio) {
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

    /**
     * Edge of a weighted, directed graph
     */
    public static class Edge {
        final int src;
        final int dst;
        final double w;

        /**
         * Build a directed edge (src, dst) with weight w
         */
        public Edge(int src, int dst, double w) {
            /* Dijkstra's algorithm requires that weights are
               non-negative */
            assert (w >= 0.0);

            this.src = src;
            this.dst = dst;
            this.w = w;
        }
    }

    public static class RoadGraph {
        int intersections;      // number of nodes in the graph
        int roads;      // number of edges in the graph
        Vector<LinkedList<Edge>> adjList; // adjacency list
        int source; // the source node
        int[] parents;    // array of parents
        double[] time; // array of distances from the source
        LinkedList<Edge> shortestTimeIntersections;  // Edges belonging to the shortest path tree

        // crea il grafico dal file di input
        public RoadGraph(String inputf) {
            this.shortestTimeIntersections = new LinkedList<>();
            readGraph(inputf);
        }

        /**
         * Prints the shortest path from |source| to |dst|
         */
        protected void printPath(int dst){
            System.out.println(time[dst]);
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

        /**
         * Read the input graph from file inputf.
         *
         * @param inputf file name
         */
        private void readGraph(String inputf) {
            Locale.setDefault(Locale.US);

            try {
                Scanner f = new Scanner(new FileReader(inputf));
                intersections = f.nextInt();
                roads = f.nextInt();

                adjList = new Vector<>();

                for (int i = 0; i < intersections; i++) {
                    adjList.add(i, new LinkedList<>());
                }

                for (int i = 0; i < roads; i++) {
                    final int src = f.nextInt();
                    final int dst = f.nextInt();
                    final double weight = f.nextDouble();
                    assert (weight >= 0.0);
                    adjList.get(src).add(new Edge(src, dst, weight));
                }
            } catch (IOException ex) {
                System.err.println(ex);
                System.exit(1);
            }
        }

        /**
         * Execute Dijkstra's shortest paths algorithm starting from node s
         *
         * @param s source node
         */
        public void shortestPaths(int s) {
            Edge[] sp_edges = new Edge[intersections];
            boolean[] visited = new boolean[intersections];
            MinHeap q = new MinHeap(intersections);

            time = new double[intersections];
            parents = new int[intersections];

            Arrays.fill(time, Double.POSITIVE_INFINITY);
            Arrays.fill(parents, -1);
            Arrays.fill(visited, false);
            time[s] = 0.0;

            for (int v = 0; v < intersections; v++) {
                q.insert(v, time[v]);
            }

            while (!q.isEmpty()) {
                final int u = q.min();
                q.deleteMin();
                visited[u] = true;

                if (sp_edges[u] != null) {
                    shortestTimeIntersections.add(sp_edges[u]);
                }

                for (Edge e : adjList.get(u)) {
                    final int v = e.dst;

                    // Nuovo tempo considerando il tempo di attesa del semaforo
                    double waitTime = time[u] + e.w;
                    if (USE_RANDOM) {
                        waitTime = waitRandom(u, waitTime);
                    } else {
                        waitTime = waitConst(u, waitTime);
                    }

                    if (!visited[v] && (waitTime < time[v])) {
                        time[v] = waitTime;
                        q.changePriority(v, time[v]);
                        parents[v] = u;
                        sp_edges[v] = e;
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