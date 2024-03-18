package PrimAlg;

/**
 * Implementation of Prim's algorithm to find a Minimum Spanning Tree
 * (MST) of a weighted, undirected graph.
 * The input file must be formatted as follows: an initial line
 * contains two integers, the number n of nodes and the number m of
 * edges, respectively.  Then m lines follow: each line contains three
 * numbers, two integers between 0 and n-1 (the nodes connected by an
 * edge) and a double (the corresponding weight).
 * To compile: javac Prim.java MinHeap.java
 * To execute: java Prim <fileIn>
 * (C) 2017 Gianluigi Zavattaro (https://www.unibo.it/sitoweb/gianluigi.zavattaro)
 * (C) 2020, 2021 Moreno Marzolla (https://www.moreno.marzolla.name/)
 * (C) 2022 Jocelyne Elias (https://www.unibo.it/sitoweb/jocelyne.elias)
 * Distributed under the CC-zero 1.0 license
 * https://creativecommons.org/publicdomain/zero/1.0/
 */

import java.io.*;
import java.util.*;

/**
 Implementation of Prim's algorithm
 */
public class Prim {

    int n;       // number of nodes in the input graph
    int m;       // number of edges in the input graph
    Vector<LinkedList<Edge>> adjList; // the input graph is stored using adjacency lists
    LinkedList<Edge> mst; // edges belonging to the MST
    double wtot; // total weight of the MST

    /**
     * Edge of a weighted, undirected graph
     */
    private class Edge {
        final int src;
        final int dst;
        final double w;

        public Edge(int src, int dst, double w) {
            this.src = src;
            this.dst = dst;
            this.w = w;
        }

        public int opposite(int v) {
            /*
            usato per raggiungere l'altra estremità:
            head restituisce tail e viceversa
             */
            assert ((src == v) || (dst == v));

            return (v == src ? dst : src);
        }
    }

    /* The constructor reads the graph from the input file */
    public Prim(String inputf) {
        wtot = 0.0;
        mst = new LinkedList<Edge>();

        /* Read input data */
        readGraph(inputf);
        
        /* Run Prim's algorithm to compute the MST using node 0 as the
           root (if the graph is connected, the root can actually
           be any node) */
        MST(0);
    }

    public void dump() {
        System.out.printf("%d %d\n", n, mst.size());
        for (Edge e : mst) {
            System.out.printf("%d %d %f\n", e.src, e.dst, e.w);
        }
        System.out.printf("# MST weight = %f\n", wtot);
    }

    private void readGraph(String inputf) {
        Locale.setDefault(Locale.US);

        try {
            Scanner f = new Scanner(new FileReader("C:\\Users\\Ale\\Documents\\GitHub\\Secondo-Anno\\Algoritmi e Strutture Dati\\Esercizi\\src\\PrimAlg\\"+inputf));
            n = f.nextInt();
            m = f.nextInt();

            adjList = new Vector<LinkedList<Edge>>(n); // vettore di n Linked list con gli edge

            for (int i = 0; i < n; i++) { // iterazione sui nodi
                adjList.add(i, new LinkedList<Edge>());
            }

            for (int i = 0; i < m; i++) { // iterazione sugli edge
                // lettura 3 valori di una riga
                final int src = f.nextInt();
                final int dst = f.nextInt();
                final double weight = f.nextDouble();
                // vettore liste di adiacenza ha stessa dimensione dei nodi del grafo
                /* adjlist:
                0   1   2   3   4   5   6   7   8
                a   b   c   d   e   f   g   h   i
                b   a
                h   c
                    h
                 */
                final Edge newEdge = new Edge(src, dst, weight); // Aggiunta nuovo edge
                adjList.get(src).add(newEdge);
                adjList.get(dst).add(newEdge);
            }
        } catch (IOException ex) {
            System.err.println(ex);
            System.exit(1);
        }
    }

    private void MST(int s) { // s è l'indice del nodo di partenza
        /* mst_edges[v] is the edge connecting v with its parent in the MST */
        Edge[] mst_edges = new Edge[n];
        
        /* weights[v] is the minimum weight among edges connecting
           v to a neighbor already in the MST */
        double[] weights = new double[n];

        /* added[v] == true iff node v has already been added to the
           MST, and therefore should be ignored */
        boolean[] added = new boolean[n];

        /* Array of parents; this is actually not necessary in this
           implementation, but is included anyway to be consistent
           with the pseudocode */
        int[] parents = new int[n];

        Arrays.fill(weights, Double.POSITIVE_INFINITY); // tutti i pesi inizializzati a infinito
        Arrays.fill(parents, -1);
        Arrays.fill(added, false); // tutti i nodi inizializzati a "non aggiunti"

        weights[s] = 0.0; // s è il nodo di partenza
        wtot = 0.0;

        MinHeap minHeap = new MinHeap(n);

        for (int v = 0; v < n; v++) {
            minHeap.insert(v, weights[v]);
        }

        while (!minHeap.isEmpty()) {
            final int u = minHeap.min(); // valore min del minheap
            minHeap.deleteMin(); // cancella valore min
            added[u] = true; // segnalo come aggiunto
            wtot += weights[u]; // aggiungi il suo peso a quello totale
            if (mst_edges[u] != null) {
                mst.add(mst_edges[u]);
            }
            for (Edge edge : adjList.get(u)) { // itera su ogni arco adiacente della lista di adiacenza del nodo u
                final double w = edge.w;
                final int v = edge.opposite(u); // vai al nodo opposto connesso da quell'arco
                if (!added[v] && (w < weights[v])) { // se il nodo opposto non è stato aggiunto all'mst e
                                                     // SE IL PESO DELL'ARCO è MINORE DEL PESO ATTUALE DEL NODO !!!!
                                                     // allora modifico la priorità
                    weights[v] = w;
                    minHeap.changePrio(v, weights[v]);
                    parents[v] = u;
                    mst_edges[v] = edge;
                }
            }
        }
    }

    /**
     * The main procedure creates a Prim object, invokes the Prim
     * algorithm, and dumps the MST.
     */
    public static void main(String[] args) {
        if (args.length != 1) {
            final int n = 100;
            System.out.printf("%d %d\n", n, n * (n - 1) / 2);
            for (int i = 0; i < n - 1; i++) {
                for (int j = i + 1; j < n; j++) {
                    final double weight = Math.random() * 100;
                    System.out.printf("%d %d %f\n", i, j, weight);
                }
            }
        }
        /*
        nei file txt, il primo valore nella prima riga è il numero di nodi (n)
        il secondo valore nella prima riga è il numero di edge (m)
         */
        Prim mst = new Prim(args[0]);
        mst.dump();
    }
}    


