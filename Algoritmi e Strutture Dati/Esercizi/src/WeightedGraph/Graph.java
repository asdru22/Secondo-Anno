package WeightedGraph;

import java.util.*;

public class Graph {
    // string sono i valori, edges sono i vertici
    private Map<String, Set<Edge>> edges = new HashMap<>();

    public void addVertex(String value) {this.edges.put(value, new HashSet<>());}

    public void addEdge(String first, String second, int weight) {
        Edge edge = new Edge(first, second, weight);
        this.getEdges(first).add(edge);
        this.getEdges(second).add(edge);
    }

    public void addEdge(Edge edge) {
        String first = edge.getOneVertex();
        String second = edge.getOtherVertex(first);
        this.getEdges(first).add(edge);
        this.getEdges(second).add(edge);
    }

    public Set<Edge> getEdges(String node) {
        return this.edges.get(node);
    }

    private int size() {
        return this.edges.size();
    } // metodo della classe set n 

    @Override
    public String toString() {
        String s = "{";
        Set<Edge> allEdges = new HashSet<>();
        for (String vertex : this.edges.keySet()) {
            allEdges.addAll(this.edges.get(vertex));
        }
        String sep = "";
        for (Edge edge : allEdges) {
            s += sep + edge;
            sep = ", ";
        }
        return s + "}";
    }

    public String toGraphviz() { // print in formato Graphviz
        String s = "graph {";
        Set<Edge> allEdges = new HashSet<>();
        for (String vertex : this.edges.keySet()) {
            allEdges.addAll(this.edges.get(vertex));
        }
        String sep = "";
        for (Edge edge : allEdges) {
            String vertex = edge.getOneVertex();
            s += sep + vertex + "--" + edge.getOtherVertex(vertex) + "[label=" + edge.getWeight() + "]";
            sep = " ";
        }
        return s + "}";
    }

    public Graph primMST() { // algoritmo di Pirm per il minimum spanning tree
        Graph mst = new Graph();
        if (size() == 0) {
            return mst;
        }
        String initial = this.edges.keySet().iterator().next();
        Set<String> visited = new HashSet<String>();
        visited.add(initial);
        mst.addVertex(initial);
        PriorityQueue<Edge> priorityQueue = new PriorityQueue<>();
        priorityQueue.addAll(getEdges(initial));
        while (!priorityQueue.isEmpty() && visited.size() < size()) {
            Edge edge = priorityQueue.remove();
            String outreachVertex = edge.getOneVertex();
            if (visited.contains(outreachVertex)) {
                outreachVertex = edge.getOtherVertex(outreachVertex);
            }
            if (!visited.contains(outreachVertex)) {
                visited.add(outreachVertex);
                mst.addVertex(outreachVertex);
                mst.addEdge(edge);
                for (Edge outreachEdge : getEdges(outreachVertex)) {
                    String linkedVertex = outreachEdge.getOtherVertex(outreachVertex);
                    if (!visited.contains(linkedVertex)) {
                        priorityQueue.add(outreachEdge);
                    }
                }
            }
        }
        return mst;
    }
}
