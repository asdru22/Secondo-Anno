package Graphs;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class DGraph {
	private Map<String, Set<String>> graph = new HashMap<>();

	protected Map<String, Set<String>> getGraph() {
		return this.graph;
	}

	public Set<String> getVertices() {
		return this.graph.keySet();
	}

	public void addVertex(String value) {
		if(this.graph.containsKey(value)) {
			throw new IllegalArgumentException("Vertex with value " + value + " is already present");
		}
		this.graph.put(value, new HashSet<String>());
	}

	public Set<String> getAdjacents(String value) {
		return this.graph.get(value);
	}

	public boolean isAdjacent(String first, String second) {
		return this.graph.get(first) != null && this.graph.get(first).contains(second);
	}
	
	public void addEdge(String first, String second) {
		if(!this.graph.containsKey(first) || !this.graph.containsKey(second)) {
			throw new IllegalArgumentException("Non-exising vertex/vertices");
		}
		getAdjacents(first).add(second);
	}
	
	public DGraph subgraph(Set<String> vertices) {
		DGraph dGraph = new DGraph();
		getVertices().stream().filter(vertex -> vertices.contains(vertex)).forEach(vertex -> dGraph.addVertex(vertex));
		for(String vertex: dGraph.getVertices()) {
			for(String otherVertex: getAdjacents(vertex)) {
				if(dGraph.getVertices().contains(otherVertex)) {
					dGraph.addEdge(vertex, otherVertex);
				}
			}
		}
		return dGraph;
	}
	
	public int size() {
		return this.graph.size();
	}
	
	@Override
	public String toString() {
		String s = "{";
		for(String value: this.graph.keySet()) {
			s += "(" + value + " -> " + this.graph.get(value) + ")";
		}
		return s + "}";
	}

	public String toGraphviz() {
		String s = "digraph { ";
		String sep = "";
		for(String vertex: getVertices()) {
			s += sep + vertex;
			sep = " ";
		}
		for(String first: getVertices()) {
			for(String second: getAdjacents(first)) {
				s += sep + first + " -> " + second;
			}
		}
		return s + " }";
	}
}
