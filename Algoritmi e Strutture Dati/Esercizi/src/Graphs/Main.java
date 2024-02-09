package Graphs;

public class Main {

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
		graph.addEdge("A", "C");
		graph.addEdge("A", "E");
		graph.addEdge("B", "C");
		graph.addEdge("B", "F");
		graph.addEdge("C", "D");
		graph.addEdge("D", "F");
		graph.addEdge("D", "G");
		graph.addEdge("E", "H");
		graph.addEdge("F", "G");
		graph.addEdge("G", "J");
		graph.addEdge("H", "J");
		graph.addEdge("I", "K");

		System.out.println(graph);
		System.out.println(graph.bfVisit("A"));
		System.out.println(graph.dfVisit("A"));
		System.out.println(graph.distances("A"));
		System.out.println(graph.components());
		System.out.println(graph.toGraphviz());
		System.out.println(graph.dfConnected());
		
		WGraph wGraph = new WGraph();
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
		System.out.println(wGraph.primMST().toGraphviz());
		
		DGraph dGraph = new DGraph();
		dGraph.addVertex("A");
		dGraph.addVertex("B");
		dGraph.addVertex("C");
		dGraph.addVertex("D");
		dGraph.addVertex("E");
		dGraph.addVertex("F");
		dGraph.addVertex("G");
		dGraph.addVertex("H");
		dGraph.addVertex("I");
		dGraph.addVertex("J");
		dGraph.addVertex("K");
		dGraph.addEdge("A", "C");
		dGraph.addEdge("A", "E");
		dGraph.addEdge("B", "C");
		dGraph.addEdge("B", "F");
		dGraph.addEdge("C", "D");
		dGraph.addEdge("D", "F");
		dGraph.addEdge("D", "G");
		dGraph.addEdge("E", "H");
		dGraph.addEdge("F", "B");
		dGraph.addEdge("F", "G");
		dGraph.addEdge("G", "J");
		dGraph.addEdge("H", "J");
		dGraph.addEdge("I", "K");
		dGraph.addEdge("K", "I");
		System.out.println(dGraph.toGraphviz());
	}
}
