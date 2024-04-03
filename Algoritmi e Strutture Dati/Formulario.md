# Master Theorem
La relazione di ricorrenza
$$T(n)=\begin{cases}aT(\frac n b)+f(n)\ \textup{se}\ n>1\\1\ \textup{se}\ n=1\end{cases}$$
ha soluzione
$$T(n) = \begin{cases} O(n^{\log_b{a}}) & \text{se } f(n) = O(n^{\log_b{a}}) \\ O(f(n)) & \text{se } f(n) = \Omega(n^{\log_b{a}}) \\ O(n^{\log_b{a}}\log{n}) & \text{se } f(n) = \Theta(n^{\log_b{a}}) \end{cases}
$$

Si applica
1. individuando $a, b, f(n)$
2. calcolando $n\log_ba$
3. confrontando asintoticamente $f(n)$ con $n\log_ba$
4. applicando opportunamente il Master Theorem.

# Cammini di costo minimo
Per ogni arco $(u,v)$, se il percorso dal nodo $s$ sorgente ad un nodo $v$ attraverso un nodo $u$ (cioè $d_{s,v}+\omega(u,v)$) è minore o uguale alla distanza minima conosciuta da $s$ a $v$ (cioè $d_{s,v}$), allora la distanza $d_{s,v}$ minima è stata trovata.
$$d_{s,v}+\omega(u,v)\le d_{s,v}\to d_{s,v}\textup{ è il cammino minimo}$$
# Tecnica del rilassamento
Supponiamo di mantenere una stima $D_{s,v}\ge d_{s,v}$ della lunghezza del cammino di costo minimo tra $s$ e $v$. Effettuiamo dei passi di rilassamento riducendo la stima finché si ha $D_{s,v}=d_{s,v}$.
$$
D_{s,u}+\omega(u,v)<D_{s,v}\implies D_{s,v}=D_{s,u}+\omega(u,v)
$$

# Algoritmo di Bellman-Ford
https://algorithms.discrete.ma.tum.de/graph-algorithms/spp-bellman-ford/index_en.html
# Algrotimo di Dijkstra
L'algoritmo di Dijkstra calcola il costo dei percorsi più brevi da un nodo di partenza dato a tutti gli altri nodi nel grafo.
L'algoritmo inizia dal suo nodo di partenza e aggiorna iterativamente i percorsi più brevi correnti tramite il nodo corrente. Nel processo, l'algoritmo può trovare scorciatoie. Continua finché tutti gli archi non sono stati visitati e non è possibile alcun miglioramento.
L'algoritmo mantiene i nodi che ha trovato, ma non ancora elaborato, in una coda prioritaria. I nodi con la distanza più piccola dal punto di partenza sono il primo nodo nella coda.
Prima inizializziamo l'algoritmo:
1. Il punto di partenza ha distanza 0, poiché la sua distanza da se stesso è 0.
2. Non conosciamo ancora nessun percorso agli altri nodi, quindi il loro costo è infinito. Durante il corso dell'algoritmo, questi costi verranno migliorati. L'algoritmo ricorda il percorso più breve per ogni nodo.
3. Il nodo di partenza viene aggiunto alla coda prioritaria.
Successivamente, viene rimosso il primo nodo dalla coda prioritaria. All'inizio, questo sarà il nodo di partenza. Poi vengono considerati tutti i suoi vicini (con i rispettivi archi). Controlliamo la seguente condizione: questo nodo è contenuto nella coda prioritaria e, in tal caso, l'arco che lo collega è un shortcut?
Se questo è il caso, allora i costi per il nodo diminuiscono. Altrimenti, controlliamo una seconda condizione: questo nodo è già stato visitato? Se il nodo non è stato ancora visitato, allora viene aggiunto alla coda prioritaria. In futuro, esamineremo anche i suoi vicini. Inoltre, il suo costo è impostato sulla somma del costo dell'arco che lo lascia e il costo del suo predecessore. 
L'algoritmo continua finché la coda prioritaria è vuota. Quando la coda prioritaria è vuota, l'algoritmo termina.