package Esercizi;

import Graphs.Graph;

public class CamminoMinimo {
    public static void main(String[] args) {
        Graph graph = new Graph();
        graph.addVertex("A");
        graph.addVertex("B");
        graph.addVertex("C");
        graph.addVertex("D");
        graph.addVertex("E");
        graph.addVertex("F");
        graph.addVertex("G");
        graph.addVertex("H");
        graph.addVertex("I");
        graph.addVertex("J");
        graph.addVertex("K");
        graph.addVertex("L");

        graph.addEdge("A", "B");
        graph.addEdge("A", "C");
        graph.addEdge("B", "C");
        graph.addEdge("B", "E");
        graph.addEdge("C", "E");
        graph.addEdge("D", "B");
        graph.addEdge("D", "E");
        graph.addEdge("A", "C");
        graph.addEdge("G", "E");
        graph.addEdge("G", "H");
        graph.addEdge("A", "C");
        graph.addEdge("E", "I");
        graph.addEdge("A", "C");
        graph.addEdge("E", "F");
        graph.addEdge("F", "J");
        graph.addEdge("I", "J");
        graph.addEdge("H", "I");
        graph.addEdge("I", "L");
        graph.addEdge("H", "K");
        graph.addEdge("H", "L");
        graph.addEdge("K", "L");
        graph.addEdge("L", "J");

        System.out.println(graph);
        /*
        Soluzione:
        BFS modificato
        vettore che memorizza per ogni nodo il numero di cammini minimi per esso

         */
    }
}
