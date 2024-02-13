package Graphs;

import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.Stack;

public class Graph {
	private Map<String, Set<String>> graph = new HashMap<>();
	
	protected Map<String, Set<String>> getGraph() {
		return this.graph;
	}
	
	public Set<String> getNodes() {
		return this.graph.keySet();
	}
	
	public void addVertex(String value) {
		if(this.graph.containsKey(value)) {
			throw new IllegalArgumentException("Node with value " + value + " is already present");
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
			throw new IllegalArgumentException("Non-exising node(s)");
		}
		getAdjacents(first).add(second);
		getAdjacents(second).add(first);
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
	
	public Set<String> bfVisit(String value) {
		Set<String> inserted = new HashSet<String>();
		Set<String> values = new HashSet<String>();
		if(this.graph.containsKey(value)) {
			Queue<String> queue = new LinkedList<String>();
			queue.add(value);
			while(!queue.isEmpty()) {
				String current = queue.remove();
				if(!inserted.contains(current)) {
					values.add(current);
					inserted.add(current);
					queue.addAll(this.graph.get(current));
				}
			}
		}
		return values;
	}

	public Set<String> dfVisit(String value) {
		Set<String> inserted = new HashSet<String>();
		Set<String> values = new HashSet<String>();
		if(this.graph.containsKey(value)) {
			Stack<String> stack = new Stack<String>();
			stack.push(value);
			while(!stack.isEmpty()) {
				String current = stack.pop();
				if(!inserted.contains(current)) {
					values.add(current);
					inserted.add(current);
					for(String linked: this.graph.get(current)) {
						stack.push(linked);
					}
				}
			}
		}
		return values;
	}
	
	public String toGraphviz() {
		return toGraphviz(Set.of());
	}

	public String toGraphviz(Set<String> highlight) {
		String s = "graph {";
		Set<Set<String>> visitedLinks = new HashSet<>();
		for(String value: this.graph.keySet()) {
			s += " " + value + " ";
			if(highlight.contains(value)) {
				s += "[color=red] ";
			}
		}
		for(String first: this.graph.keySet()) {
			for(String second: this.graph.get(first)) {
				if(!visitedLinks.contains(Set.of(first, second))) {
					visitedLinks.add(Set.of(first, second));
					s += " " + first + " -- " + second + " ";
				}
			}
		}
		return s + "}";
	}

	public Map<String, Integer> distances(String from) {
		if(!this.graph.containsKey(from)) {
			throw new IllegalArgumentException(from + "is not a node of the graph");
		}
		Queue<String> queue = new LinkedList<String>();
		Map<String, Integer> distance = new HashMap<String, Integer>();
		for(String value: this.graph.keySet()) {
			distance.put(value, -1);
		}
		queue.add(from);
		queue.add(null);
		int currentDistance = 0;
		while(!queue.isEmpty()) {
			String current = queue.remove();
			if(current == null) {
				currentDistance++;
				if(queue.size() > 0) {
					queue.add(null);
				}
			} else if(distance.get(current) == -1) {
				distance.put(current, currentDistance);
				queue.addAll(this.graph.get(current));
			}
		}
		return distance;
	}

	public Map<String, Integer> dfConnected() {
		Stack<String> nodeStack = new Stack<>();
		for(String node: getNodes()) {
			nodeStack.push(node);
		}
		return dfConnected(nodeStack);
	}
	
	public Map<String, Integer> dfConnected(Stack<String> stack) {
		Map<String, Integer> marks = new HashMap<>(size());
		int count = 0;
		while(!stack.isEmpty()) {
			String vertex = stack.pop();
			if(!marks.containsKey(vertex)) {
				count++;
				marks.put(vertex, count);
				dfMark(vertex, marks, count);
			}
		}
		return marks;
	}
	
	public void dfMark(String vertex, Map<String, Integer>marks, int count) {
		marks.put(vertex, count);
		for(String adjacent: getAdjacents(vertex)) {
			if(!marks.containsKey(adjacent)) {
				dfMark(adjacent, marks, count);
			}
		}
	}
	
	public Set<Set<String>> components() {
		Set<Set<String>> components = new HashSet<Set<String>>();
		Set<String> toVisit = new HashSet<String>(this.graph.keySet());
		while(!toVisit.isEmpty()) {
			String current = toVisit.iterator().next();
			Set<String> visited = bfVisit(current);
			toVisit.removeAll(visited);
			components.add(visited);
		}		
		return components;
	}
}
