package WeightedGraph;

public class Main {

    public static void main(String[] args) {


        Graph wGraph = new Graph();
        wGraph.addVertex("0");
        wGraph.addVertex("1");
        wGraph.addVertex("2");
        wGraph.addVertex("3");
        wGraph.addVertex("4");
        wGraph.addVertex("5");
        wGraph.addVertex("6");
        wGraph.addVertex("7");
        wGraph.addVertex("8");
        wGraph.addEdge("0", "3", 1);
        wGraph.addEdge("0", "4", 8);
        wGraph.addEdge("1", "2", 1);
        wGraph.addEdge("1", "3", 2);
        wGraph.addEdge("1", "6", 1);
        wGraph.addEdge("2", "6", 5);
        wGraph.addEdge("3", "7", 6);
        wGraph.addEdge("4", "7", 7);
        wGraph.addEdge("5", "7", 1);
        wGraph.addEdge("6", "7", 7);

        System.out.println(wGraph.primMST());
        //System.out.println(wGraph.primMST().toGraphviz());
    }
}
