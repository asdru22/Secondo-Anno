package WeightedGraph;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Objects;
import java.util.Set;

class Edge implements Comparable<Edge> {
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