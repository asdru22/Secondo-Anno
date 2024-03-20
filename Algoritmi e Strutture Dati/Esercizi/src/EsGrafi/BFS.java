package EsGrafi; /**
 * Implementation of BFS (Breadth First Search) algorithm.
 *
 * The input file must be formatted as follows: an initial line
 * contains two integers, the number n of nodes and the number m of
 * edges, respectively.  Then m lines follow: each line contains three
 * numbers, two integers between 0 and n-1 (the nodes connected by an
 * edge) and a double (the corresponding weight, that is ignored here).
 *
 * To compile: javac BFS.java 
 *
 * To execute: java -ea BFS <fileIn> (ea: enable assertions)
 *
 * (C) 2021 Moreno Marzolla (https://www.moreno.marzolla.name/)
 *
 * Distributed under the CC-zero 1.0 license
 * https://creativecommons.org/publicdomain/zero/1.0/
 * 
 */

import java.io.*;
import java.util.*;

public class BFS {
    
    int n;      // number of nodes in the input graph
    int m;      // number of edges in the input graph
    Vector< LinkedList<Edge> > adjList; // the input graph is stored using adjacency lists
    // adjList is an array of linked lists and each element of this array contains a Java linked list.
    int parent[];// parent[v] is the predecessor of node v in the BFS tree
    int dist[];  // dist[v] is the distance (number of edges) of node v from the source
    
    /**
     * Edge of a weighted, directed graph
     */
    private class Edge {
        final int src; // head of the edge/arc
        final int dst; // tail 
        final double w; // weight

        public Edge(int src, int dst, double w)
        {
            this.src = src;
            this.dst = dst;
            this.w = w;
        }
    }

    /* The constructor reads the graph from the input file */
    public BFS(String inputf)
    {
        readGraph(inputf);
    }

    public void dump( )
    {
        System.out.printf("v\tparent[v]\tdist[v]\n");
        for (int v=0; v<n; v++)  {
            System.out.printf("%d\t%d\t%d\n", v, parent[v], dist[v]);
        }
    }

    /* Prints the shortest path from src do dst, if it exists */
    public void print_path(int src, int dst)
    {
        if (dist[dst] < 0) {
            System.out.printf("No path from %d to %d\n", src, dst);
        } else if (src == dst) {
            System.out.print(src);
        } else {
            print_path(src, parent[dst]);
            System.out.print(" " + dst);
        }
    }
    
    private void readGraph(String inputf)
    {                
        Locale.setDefault(Locale.US);
        
        try {
	     Scanner f = new Scanner(new FileReader(inputf));
	     n = f.nextInt();
	     m = f.nextInt();
             
             adjList = new Vector< LinkedList<Edge> >(n);

             for (int i=0; i<n; i++) {
                 adjList.add(i, new LinkedList<Edge>());
             }
             
	     for (int i=0; i<m; i++) {
                 final int src = f.nextInt();
                 final int dst = f.nextInt();
                 final double weight = f.nextDouble();
                 final Edge newEdge = new Edge(src, dst, weight);
                 adjList.get(src).add( newEdge );
	     }
        } catch (IOException ex) {
	     System.err.println(ex);
	     System.exit(1);
        }
    }

    public void visit( int s )
    {
        parent = new int[n];
        dist = new int[n];

        Arrays.fill(dist, -1);
        Arrays.fill(parent, -1);
        
	dist[s] = 0;
        Queue<Integer> q = new LinkedList<Integer>(); // A FIFO queue
        q.add(s);
        
	while ( !q.isEmpty() ) {
	    final int u = q.poll();
            Iterator<Edge> iter = adjList.get(u).iterator(); // adjList.get(u): linked list corresponding to node u 
	    while ( iter.hasNext() ) {
                final Edge edge = iter.next();
                final int v = edge.dst;
                assert(edge.src == u);                                
	        if (dist[v] < 0) {
                    dist[v] = dist[u] + 1;
                    parent[v] = u;
                    q.add(v);
		}
	    }
	}        
    }

    /**
     * The main procedure creates a BSF object, invokes the BFS
     * algorithm, and dumps the BFS tree.
     */    
    public static void main( String args[])
    {
        if (args.length != 1) {
            final int n = 100;
            System.out.printf("%d %d\n", n, n*(n-1)/2);
            for (int i=0; i<n-1; i++) {
                for (int j=i+1; j<n; j++) {
                    final double weight = Math.random() * 100;
                    System.out.printf("%d %d %f\n", i, j, weight);
                }
            }
            return;
        }
	
        BFS bfs = new BFS(args[0]);
        final long tstart = System.currentTimeMillis();
        bfs.visit(0);
        final long tend = System.currentTimeMillis();
        final double elapsed = (tend - tstart) / 1000.0;
        System.err.println("Elapsed time " + elapsed + " sec");
        bfs.dump();
        System.out.printf("Shortest path from %d to %d\n", 0, bfs.n-1);
        bfs.print_path(0, bfs.n-1);
        System.out.println();
    }    
}    


