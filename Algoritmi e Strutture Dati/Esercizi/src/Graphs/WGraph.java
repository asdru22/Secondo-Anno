package Graphs;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import java.util.PriorityQueue;
import java.util.Set;
public class WGraph {
	private Map<String, Set<Edge>> edges = new HashMap<>();

	private static class Edge implements Comparable<Edge> {
		private Set<String> vertices = new HashSet<>();
		private int weight;

		public Edge(String first, String second, int weight) {
			vertices.add(first);
			vertices.add(second);
			this.weight = weight;
		}
		
		@SuppressWarnings("unused")
		public boolean contains(String vertex) {
			return this.vertices.contains(vertex);
		}
		
		public int getWeight() {
			return weight;
		}
		
		@SuppressWarnings("unused")
		public Set<String> getVertices() {
			return this.vertices;
		}
		
		public String getOneVertex() {
			return this.vertices.iterator().next();
		}
		
		public String getOtherVertex(String vertex) {
			Iterator<String> iterator = this.vertices.iterator();
			String first = iterator.next();
			if(vertex.equals(first)) {
				return iterator.next();
			} else {
				return first;
			}
		}
		
		@Override
		public int hashCode() {
			return Objects.hash(this.vertices, this.weight);
		}
		
		@Override
		public boolean equals(Object obj) {
			if(obj == null) {
				return false;
			} else if(!(obj instanceof Edge)) {
				return false;
			} else {
				Edge otherEdge = (Edge)obj;
				return this.vertices.equals(otherEdge.vertices) && getWeight() == otherEdge.getWeight();
			}
		}
		
		@Override
		public int compareTo(Edge other) {
			return getWeight() - other.getWeight();
		}
		
		@Override
		public String toString() {
			Iterator<String> iterator = this.vertices.iterator();
			return iterator.next() + " -- " + iterator.next() + " [" + getWeight() + "]";
		}
	}

	public void addVertex(String value) {
		this.edges.put(value, new HashSet<>());
	}
	
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
	}
	
	@Override
	public String toString() {
		String s = "{";
		Set<Edge> allEdges = new HashSet<>();
		for(String vertex: this.edges.keySet()) {
			allEdges.addAll(this.edges.get(vertex));
		}
		String sep = "";
		for(Edge edge: allEdges) {
			s += sep + edge;
			sep = ", ";
		}
		return s + "}";
	}

	public String toGraphviz() {
		String s = "graph {";
		Set<Edge> allEdges = new HashSet<>();
		for(String vertex: this.edges.keySet()) {
			allEdges.addAll(this.edges.get(vertex));
		}
		String sep = "";
		for(Edge edge: allEdges) {
			String vertex = edge.getOneVertex();
			s += sep + vertex + "--" + edge.getOtherVertex(vertex) + "[label=" + edge.getWeight() + "]";
			sep = " ";
		}
		return s + "}";
	}

	public WGraph primMST() {
		WGraph mst = new WGraph();
		if(size() == 0) {
			return mst;
		}
		String initial = this.edges.keySet().iterator().next();
		Set<String> visited = new HashSet<String>();
		visited.add(initial);
		mst.addVertex(initial);
		PriorityQueue<Edge> priorityQueue = new PriorityQueue<>();
		priorityQueue.addAll(getEdges(initial));
		while(!priorityQueue.isEmpty() && visited.size() < size()) {
			Edge edge = priorityQueue.remove();
			String outreachVertex = edge.getOneVertex();
			if(visited.contains(outreachVertex)) {
				outreachVertex = edge.getOtherVertex(outreachVertex);
			}
			if(!visited.contains(outreachVertex)) {
				visited.add(outreachVertex);
				mst.addVertex(outreachVertex);
				mst.addEdge(edge);
				for(Edge outreachEdge: getEdges(outreachVertex)) {
					String linkedVertex = outreachEdge.getOtherVertex(outreachVertex);
					if(!visited.contains(linkedVertex)) {
						priorityQueue.add(outreachEdge);
					}
				}
			}
		}
		return mst;
	}
}
