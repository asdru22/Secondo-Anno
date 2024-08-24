### Algoritmi di ordinamento
Gli **algoritmi di ordinamento** sono metodi utilizzati per riordinare una sequenza di elementi (come numeri, stringhe o oggetti) secondo un ordine specifico, solitamente crescente o decrescente. Sono fondamentali nell'informatica poiché molti problemi richiedono dati ordinati per essere risolti in modo efficiente
#### 1. Bubble Sort
- **Descrizione**: Confronta ogni coppia di elementi adiacenti e li scambia se sono nell'ordine sbagliato. Questo processo viene ripetuto fino a quando la sequenza è ordinata.
- **Complessità Temporale**:
    - Caso peggiore: O(n^2)
    - Caso medio: O(n^2)
    - Caso migliore: O(n) (quando l'array è già ordinato)
- **Caratteristiche**:
    - Semplice da implementare.
    - Non efficiente per grandi dataset.
    - In-place (non richiede memoria aggiuntiva significativa).
    - Stabilità: stabile (mantiene l'ordine relativo degli elementi uguali).
#### 2. Selection Sort
- **Descrizione**: Trova l'elemento minimo (o massimo) e lo posiziona all'inizio (o alla fine) della sequenza, ripetendo il processo per il resto dell'array.
- **Complessità Temporale**:
    - Caso peggiore: O(n^2)
    - Caso medio: O(n^2)
    - Caso migliore: O(n^2)
- **Caratteristiche**:
    - Più efficiente di Bubble Sort in termini di numero di scambi.
    - In-place.
    - Non stabile (potrebbe cambiare l'ordine relativo degli elementi uguali).
#### 3. Insertion Sort
- **Descrizione**: Costruisce l'array ordinato un elemento alla volta, inserendo ogni nuovo elemento nella posizione corretta rispetto agli elementi già ordinati.
- **Complessità Temporale**:
    - Caso peggiore: O(n^2)
    - Caso medio: O(n^2)
    - Caso migliore: O(n) (quando l'array è già ordinato)
- **Caratteristiche**:
    - Efficiente per piccoli dataset o array quasi ordinati.
    - In-place.
    - Stabile.
#### 4. Merge Sort
- **Descrizione**: Divide ricorsivamente l'array in metà fino a ottenere array di un solo elemento, quindi li combina (merge) in modo ordinato.
- **Complessità Temporale**:
    - Caso peggiore: O(n \log n)
    - Caso medio: O(n \log n)
    - Caso migliore: O(n \log n)
- **Caratteristiche**:
    - Divide et impera.
    - Non in-place (richiede spazio aggiuntivo per l'array temporaneo).
    - Stabile.
    - Efficiente per grandi dataset.
#### 5. Quick Sort
- **Descrizione**: Sceglie un "pivot" e riordina l'array in modo che tutti gli elementi minori del pivot vengano prima e quelli maggiori dopo. Applica ricorsivamente lo stesso processo agli array ottenuti.
- **Complessità Temporale**:
    - Caso peggiore: O(n^2) (se il pivot è scelto male, ad esempio sempre il minimo o il massimo)
    - Caso medio: O(n \log n)
    - Caso migliore: O(n \log n)
- **Caratteristiche**:
    - Divide et impera.
    - In-place (usando tecniche avanzate di partizionamento).
    - Non stabile.
    - Molto efficiente in media.
#### 6. Heap Sort
- **Descrizione**: Costruisce un **heap** dall'array e poi estrae ripetutamente l'elemento massimo (o minimo) per ottenere un array ordinato.
- **Complessità Temporale**:
    - Caso peggiore: O(n \log n)
    - Caso medio: O(n \log n)
    - Caso migliore: O(n \log n)
- **Caratteristiche**:
    - In-place.
    - Non stabile.
    - Efficiente con complessità garantita O(n \log n).
    - Utilizza una struttura dati ausiliaria (heap)
### Alberi
Gli **alberi** sono strutture dati fondamentali nell'informatica, ampiamente utilizzate per rappresentare gerarchie, relazioni parentali e strutture ricorsive. Un albero è una collezione di nodi collegati da archi che rappresentano le relazioni padre-figlio.
#### 1. Definizione e Caratteristiche
- **Nodo**: L'elemento base dell'albero, che contiene un valore o un dato.
- **Radice (Root)**: Il nodo principale dell'albero, che non ha un nodo genitore.
- **Figlio (Child)**: Un nodo diretto discendente di un altro nodo.
- **Padre (Parent)**: Un nodo che ha uno o più nodi figli.
- **Foglia (Leaf)**: Un nodo che non ha figli.
- **Arco (Edge)**: Una connessione tra due nodi.
- **Sottoalbero (Subtree)**: Un sottoinsieme dell'albero che include un nodo e tutti i suoi discendenti.
- **Altezza (Height)**: La lunghezza del percorso più lungo dalla radice a una foglia.
- **Profondità (Depth)**: La lunghezza del percorso dalla radice a un nodo specifico.
- **Grado (Degree)**: Il numero di figli di un nodo.
#### 2. Tipi di Alberi
##### Albero Generico
- **Descrizione**: Un albero in cui ogni nodo può avere un numero arbitrario di figli.
- **Utilizzo**: Utile per rappresentare gerarchie complesse, come file system o strutture organizzative.
##### Albero Binario
- **Descrizione**: Un albero in cui ogni nodo ha al massimo due figli, chiamati "sinistro" e "destro".
- **Utilizzo**: Utilizzato in molte strutture dati e algoritmi, come heap binari, alberi binari di ricerca, etc.
- **Varietà**:
    - **Albero Binario Completo**: Ogni livello dell'albero è completamente riempito eccetto, forse, l'ultimo livello, che è riempito da sinistra a destra.
    - **Albero Binario Perfetto**: Un albero binario in cui tutti i livelli sono completamente riempiti.
    - **Albero Binario Bilanciato**: Un albero binario in cui la differenza di altezza tra il sottoalbero sinistro e quello destro di qualsiasi nodo non è maggiore di uno.

##### Albero Binario di Ricerca (BST - Binary Search Tree)
- **Descrizione**: Un albero binario in cui per ogni nodo, i valori del sottoalbero sinistro sono minori del valore del nodo, e i valori del sottoalbero destro sono maggiori.
- **Operazioni**:
    - **Ricerca**: O(\log n) nel caso medio e migliore; O(n) nel caso peggiore.
    - **Inserimento**: O(\log n) nel caso medio; O(n) nel caso peggiore.
    - **Cancellazione**: O(\log n) nel caso medio; O(n) nel caso peggiore.
- **Utilizzo**: Efficienti per operazioni di ricerca, inserimento e cancellazione di dati ordinati.
##### Albero AVL
- **Descrizione**: Un tipo di albero binario di ricerca bilanciato in cui per ogni nodo, l'altezza dei due sottoalberi differisce al massimo di uno.
- **Utilizzo**: Mantiene l'efficienza di O(\log n) per operazioni di ricerca, inserimento e cancellazione anche nei casi peggiori.
- **Rotazioni**: Per mantenere l'albero bilanciato, l'albero AVL utilizza rotazioni (sinistra, destra, sinistra-destra, destra-sinistra) durante le operazioni di inserimento e cancellazione.
##### Albero Rosso-Nero (Red-Black Tree)
- **Descrizione**: Un albero binario di ricerca bilanciato con nodi colorati in rosso o nero. Ha regole aggiuntive per garantire che il percorso più lungo dalla radice a una foglia non sia più del doppio del più corto.
- **Proprietà**:
    - Ogni nodo è rosso o nero.
    - La radice è nera.
    - Le foglie (nodi nulli) sono nere.
    - Un nodo rosso non può avere figli rossi.
    - Ogni percorso dalla radice a una foglia ha lo stesso numero di nodi neri.
- **Utilizzo**: Molto utilizzato in strutture dati come set, mappe e database.
##### Heap (Min-Heap e Max-Heap)
- **Descrizione**: Un albero binario completo dove:
    - In un **min-heap**, il valore del nodo genitore è sempre minore o uguale ai valori dei suoi figli.
    - In un **max-heap**, il valore del nodo genitore è sempre maggiore o uguale ai valori dei suoi figli.
- **Utilizzo**: Usato per implementare code di priorità e nell'algoritmo di ordinamento heap sort.
#### 3. Operazioni sugli Alberi
- **Inserimento**: Aggiungere un nuovo nodo in una posizione appropriata nell'albero.
- **Cancellazione**: Rimuovere un nodo dall'albero mantenendo la struttura dell'albero.
- **Ricerca**: Trovare un nodo con un valore specifico.
- **Attraversamenti (Traversal)**:
    - **Preordine (Preorder)**: Visita la radice, poi il sottoalbero sinistro, infine il sottoalbero destro.
    - **Ordine Simmetrico (Inorder)**: Visita il sottoalbero sinistro, poi la radice, infine il sottoalbero destro. (Utilizzato per ottenere un output ordinato in un BST).
    - **Postordine (Postorder)**: Visita il sottoalbero sinistro, poi il sottoalbero destro, infine la radice.
    - **Livello (Level Order)**: Visita i nodi livello per livello dall'alto verso il basso (BFS - Breadth-First Search).
#### 4. Applicazioni degli Alberi

- **File System**: Gli alberi rappresentano le gerarchie delle directory e dei file.
- **Compilatori**: Gli alberi sintattici astratti (AST) rappresentano la struttura sintattica del codice sorgente.
- **Ricerca**: Gli alberi binari di ricerca (BST), gli alberi AVL e gli alberi rosso-neri sono utilizzati per la ricerca efficiente di dati.
- **Gestione delle Priorità**: Gli heap vengono utilizzati per implementare code di priorità, cruciali per algoritmi come Dijkstra.
- **Database**: Gli alberi B e B+ sono utilizzati nei sistemi di gestione di database per garantire un accesso rapido e bilanciato ai dati.
#### 5. Vantaggi e Svantaggi degli Alberi
- **Vantaggi**:
    - Rappresentano naturalmente strutture gerarchiche.
    - Efficienti per operazioni di ricerca, inserimento e cancellazione in molte implementazioni.
    - Flessibili, con molte varianti specifiche per casi d'uso diversi.
- **Svantaggi**:
    - Possono diventare non bilanciati, riducendo l'efficienza delle operazioni.
    - Richiedono una gestione attenta per mantenere le proprietà dell'albero (bilanciamento, colori, ecc.).
    - Possono richiedere memoria aggiuntiva per i puntatori.
### HashMap
Le **HashMap** sono una delle strutture dati più utilizzate e fondamentali nell'informatica. Sono implementazioni della mappa (o dizionario), una struttura che associa chiavi a valori, permettendo un accesso rapido e diretto ai dati basato sulle chiavi.
#### 1. Definizione e Caratteristiche
- Una **HashMap** è una struttura dati che memorizza coppie di elementi, dove ogni elemento è costituito da una chiave unica e un valore associato.
- **Chiave (Key)**: Un identificatore univoco utilizzato per accedere al valore associato.
- **Valore (Value)**: L'informazione o il dato associato a una chiave.
- **Hash Function**: Una funzione che prende una chiave come input e restituisce un numero (l'hash code) che corrisponde a un indice nella struttura di archiviazione (solitamente un array).
- **Tabella Hash (Hash Table)**: Una struttura dati che utilizza un array per memorizzare le coppie chiave-valore.
#### 2. Funzionamento Interno
- **Hashing**: Quando una chiave viene inserita nella HashMap, viene passata attraverso una funzione di hashing che genera un hash code. Questo hash code viene quindi utilizzato per determinare l'indice nella tabella hash dove memorizzare la coppia chiave-valore.
- **Collisioni**: Quando due chiavi diverse producono lo stesso hash code (e quindi lo stesso indice nella tabella), si verifica una collisione. Le HashMap utilizzano vari metodi per gestire le collisioni:
    - **Catena (Chaining)**: Ogni posizione nella tabella hash contiene una lista di tutte le coppie chiave-valore che generano lo stesso hash code. Quando si verifica una collisione, la nuova coppia chiave-valore viene aggiunta alla lista.
    - **Indirizzamento Aperto (Open Addressing)**: Quando si verifica una collisione, l'algoritmo cerca un'altra posizione disponibile nella tabella hash per memorizzare la coppia chiave-valore, utilizzando varie strategie come il **linear probing** o il **quadratic probing**.
- **Rehashing**: Quando la tabella hash si riempie troppo (cioè quando il **load factor** supera una certa soglia), la dimensione della tabella viene aumentata e tutte le coppie chiave-valore vengono rimappate in una nuova tabella di dimensioni maggiori. Questo processo è noto come **rehashing**.
#### 3. Complessità Computazionale
- **Inserimento**: Nel caso medio, l'inserimento di una nuova coppia chiave-valore in una HashMap ha una complessità di O(1). Tuttavia, nel caso peggiore (quando ci sono molte collisioni), la complessità può avvicinarsi a O(n).
- **Ricerca**: Come per l'inserimento, la ricerca di un valore basato su una chiave nella HashMap ha una complessità media di O(1), ma nel caso peggiore può arrivare a O(n).
- **Cancellazione**: Anche la cancellazione di una coppia chiave-valore ha una complessità media di O(1) e un caso peggiore di O(n).
- **Rehashing**: L'operazione di rehashing può essere costosa, con una complessità O(n), ma viene eseguita raramente e quindi non influisce significativamente sulle operazioni comuni.
#### 4. Proprietà delle HashMap
- **Non Ordinata**: Le HashMap non garantiscono alcun ordine specifico delle coppie chiave-valore. L'ordine degli elementi dipende dall'hash code e dalle collisioni gestite.
- **Chiavi Uniche**: In una HashMap, ogni chiave deve essere unica. Se una chiave esistente viene utilizzata per un nuovo inserimento, il valore precedente viene sovrascritto.
- **Valori Null**: Molte implementazioni di HashMap permettono l'uso di valori nulli e, in alcuni casi, anche di chiavi nulle (ad esempio, la `HashMap` in Java permette una singola chiave nulla).
#### 5. Vantaggi e Svantaggi delle HashMap
- **Vantaggi**:
    - Accesso molto rapido ai dati grazie alla complessità O(1) nel caso medio.
    - Facilmente scalabile grazie alla capacità di rehashing.
    - Flessibile e ampiamente supportata nelle librerie standard di molti linguaggi di programmazione.
- **Svantaggi**:
    - Non ordinata: L'ordine delle coppie chiave-valore non è prevedibile.
    - Efficienza dipendente dall'hashing: Una funzione di hashing inefficace può causare molte collisioni, degradando le prestazioni.
    - Utilizzo di memoria: Le HashMap possono richiedere più memoria rispetto ad altre strutture dati, specialmente se il load factor è basso e la tabella hash è grande.
#### 6. Applicazioni delle HashMap
- **Caching**: Le HashMap sono utilizzate per memorizzare i risultati di calcoli costosi in modo da evitare di ripeterli.
- **Memorizzazione delle Frequenze**: Usate per contare la frequenza di elementi in una collezione (es. conteggio delle parole in un testo).
- **Implementazione di Dizionari e Set**: In molti linguaggi di programmazione, i dizionari e i set sono implementati utilizzando HashMap.
- **Lookup Rapido**: Ideali per applicazioni in cui è necessario un lookup rapido e costante, come database in-memory o motori di ricerca.
### Grafi
I **grafi** sono una delle strutture dati più generali e potenti in informatica, utilizzate per modellare una vasta gamma di problemi complessi che implicano relazioni tra oggetti. Un grafo è costituito da un insieme di **nodi** (o **vertici**) e da un insieme di **archi** (o **spigoli**) che collegano coppie di nodi.
#### 1. Definizione e Terminologia
- **Nodo (Vertice)**: Un'entità di base in un grafo. Può rappresentare oggetti come città, persone, pagine web, ecc.
- **Arco (Spigolo)**: Una connessione tra due nodi. Può rappresentare una relazione o un'interazione tra le entità.
- **Grado (Degree)**: Il numero di archi che incidono su un nodo. In un grafo orientato, si distingue tra **grado entrante** (numero di archi che entrano nel nodo) e **grado uscente** (numero di archi che escono dal nodo).
- **Ciclo**: Un percorso in un grafo che inizia e termina nello stesso nodo senza ripetere archi o nodi (tranne l'inizio e la fine).
- **Cammino (Percorso)**: Una sequenza di archi che collega una sequenza di nodi.
- **Sottografo**: Un grafo che è un sottoinsieme di un altro grafo.
- **Componenti Connesse**: Sottografi in cui qualsiasi coppia di nodi è collegata da un percorso, e che non sono collegati a nodi al di fuori del sottografo.
#### 2. Tipi di Grafi
- **Grafo Non Orientato**: Un grafo in cui gli archi non hanno direzione. Se esiste un arco tra i nodi u e v, è possibile viaggiare da u a v e viceversa.
- **Grafo Orientato (Digrafo)**: Un grafo in cui ogni arco ha una direzione. Un arco u→v permette solo di viaggiare da u a v, non viceversa.
- **Grafo Ponderato**: Un grafo in cui gli archi sono associati a un peso o un costo. Utilizzato in problemi come il calcolo del percorso più breve.
- **Grafo Completo**: Un grafo in cui ogni coppia di nodi è collegata da un arco.
#### 3. Rappresentazione dei Grafi

- **Matrice di Adiacenza**: Una matrice n×n dove n è il numero di nodi. Se esiste un arco tra i nodi i e j, la posizione (i, j) nella matrice contiene un valore (tipicamente 1 o il peso dell'arco). Altrimenti, contiene 0.
    - **Vantaggi**: Facile da implementare e ideale per grafi densi (con molti archi).
    - **Svantaggi**: Richiede O(n^2) memoria, quindi inefficiente per grafi sparsi.
- **Lista di Adiacenza**: Ogni nodo ha una lista di nodi adiacenti (quelli con cui è direttamente collegato da un arco). Questa rappresentazione utilizza meno memoria per grafi sparsi.
    - **Vantaggi**: Più efficiente in termini di memoria per grafi sparsi.
    - **Svantaggi**: Meno intuitivo e richiede più tempo per controllare la presenza di un arco specifico.
#### 4. Algoritmi sui Grafi
- **Ricerca in Ampiezza (BFS - Breadth-First Search)**:
    - **Descrizione**: Esplora i nodi di un grafo a partire da un nodo sorgente, visitando prima tutti i nodi vicini al livello corrente prima di passare al livello successivo.
    - **Complessità**: $O(V + E)$, dove $V$ è il numero di vertici ed $E$ il numero di archi.
    - **Utilizzo**: Trovare il percorso più breve in un grafo non ponderato, trovare componenti connesse, ecc.
- **Ricerca in Profondità (DFS - Depth-First Search)**:
    - **Descrizione**: Esplora un grafo partendo da un nodo sorgente e segue un cammino il più a lungo possibile prima di fare backtracking.
    - **Complessità**: $O(V + E)$.
    - **Utilizzo**: Rilevamento di cicli, ordinamento topologico, trovare componenti fortemente connesse in grafi orientati.
- **Dijkstra**:
    - **Descrizione**: Trova il percorso più breve da un nodo sorgente a tutti gli altri nodi in un grafo ponderato con pesi non negativi.
    - **Complessità**: O((V + E) log V)) con una coda di priorità.
    - **Utilizzo**: Navigazione GPS, reti di comunicazione, routing nei grafi.
- **Bellman-Ford**:
    - **Descrizione**: Trova il percorso più breve da un nodo sorgente a tutti gli altri nodi in un grafo ponderato, anche con pesi negativi.
    - **Complessità**: O(VE).
    - **Utilizzo**: Situazioni in cui gli archi possono avere pesi negativi, rilevamento di cicli di peso negativo.
- **Floyd-Warshall**:
    - **Descrizione**: Trova il percorso più breve tra tutte le coppie di nodi in un grafo ponderato.
    - **Complessità**: O(V^3).
    - **Utilizzo**: Grafi densi, quando è necessario calcolare tutti i percorsi minimi.
- **Prim** e **Kruskal**:
    - **Descrizione**: Algoritmi per trovare l'albero ricoprente minimo (MST) di un grafo ponderato.
    - **Complessità**: O(E \log V).
    - **Utilizzo**: Costruzione di reti di comunicazione, ottimizzazione delle infrastrutture.
#### 5. Applicazioni dei Grafi

- **Reti di Comunicazione**: Modellano la topologia delle reti, come internet, reti sociali, e sistemi di trasporto.
- **Navigazione e GPS**: Utilizzano grafi per calcolare il percorso più breve tra due punti su una mappa.
- **Reti Sociali**: Rappresentano utenti come nodi e relazioni come archi, per analizzare connessioni, influenze e diffusione delle informazioni.
- **Informatica Teorica**: Grafi sono fondamentali in problemi come il problema del commesso viaggiatore, il problema di Hamilton, e il problema di Euler.
- **Compilatori e Analisi del Codice**: Utilizzano grafi per rappresentare la dipendenza tra moduli di codice, ottimizzazione dei calcoli e rilevamento di cicli.
- **Biologia Computazionale**: Rappresentano reti di interazioni tra proteine, reti metaboliche, e sequenze genetiche.
#### 6. Proprietà e Teoria dei Grafi
- **Connettività**:
    - Un grafo è **connesso** se esiste un cammino tra ogni coppia di nodi.
    - Un grafo orientato è **fortemente connesso** se esiste un cammino orientato tra ogni coppia di nodi.
### Heap
Gli **Heap** sono una struttura dati specializzata, utilizzata principalmente per implementare code di priorità e per algoritmi di ordinamento come l'Heap Sort. Un Heap è un tipo di albero binario che soddisfa alcune proprietà specifiche, che lo rendono molto utile in una varietà di contesti.
#### 1. Definizione e Caratteristiche di un Heap
- Un **Heap** è un albero binario completo, cioè un albero in cui tutti i livelli sono completamente riempiti tranne forse l'ultimo, che è riempito da sinistra verso destra.
- Gli Heap possono essere classificati in due principali categorie:
    - **Max-Heap**: In un Max-Heap, ogni nodo genitore ha un valore maggiore o uguale ai suoi figli. Questo significa che il valore massimo si trova sempre nella radice dell'albero.
    - **Min-Heap**: In un Min-Heap, ogni nodo genitore ha un valore minore o uguale ai suoi figli. Questo significa che il valore minimo si trova sempre nella radice dell'albero.
#### 2. Min-Heap
- **Proprietà del Min-Heap**: In un Min-Heap, la chiave (o valore) in ogni nodo è minore o uguale a quelle dei suoi figli. Questo garantisce che la radice del Min-Heap contenga sempre il valore più piccolo.
- **Utilizzi Comuni**: I Min-Heap sono spesso utilizzati per implementare code di priorità, dove l'elemento con la priorità più alta (che in questo contesto ha il valore numerico più basso) deve essere servito per primo. Sono anche utilizzati in algoritmi come Dijkstra e Prim, dove è necessario estrarre ripetutamente il nodo con il valore più piccolo.
#### 3. Operazioni Fondamentali sugli Heap
- **Inserimento**:
    - Per inserire un nuovo elemento in un Heap, si aggiunge l'elemento nella prima posizione disponibile nell'ultimo livello dell'albero (per mantenere la struttura dell'albero completo).
    - Dopo l'inserimento, si risale l'albero ("percolate up" o "bubble up") scambiando l'elemento con il suo genitore fino a quando l'ordine del Max-Heap o Min-Heap non è ripristinato.
    - Complessità: O(log n), dove n è il numero di elementi nel Heap.
- **Estrazione del Massimo/Minimo**:
    - In un Max-Heap, l'elemento massimo (la radice) può essere estratto facilmente. Lo stesso vale per il minimo in un Min-Heap.
    - Dopo l'estrazione, l'ultimo elemento nell'ultimo livello dell'albero sostituisce la radice, e l'albero viene riordinato ("percolate down" o "bubble down") per ripristinare la proprietà di Max-Heap o Min-Heap.
    - Complessità: O(log n).
#### 4. Rappresentazione di un Heap
- Gli Heap sono spesso rappresentati come array piuttosto che come alberi puntati, poiché l'albero binario completo può essere mappato facilmente su un array.
- **Nodi in un array**: Se un nodo è alla posizione i nell'array:
    - Il figlio sinistro è alla posizione $2i + 1$.
    - Il figlio destro è alla posizione $2i + 2$.
    - Il genitore è alla posizione $(i−1)/2$.
- Questa rappresentazione permette un accesso rapido e riduce l'overhead di memoria associato ai puntatori nei nodi degli alberi.
#### 5. Applicazioni degli Heap
- **Code di Priorità**: Utilizzate in sistemi operativi per la gestione dei processi, in reti per il routing, e in algoritmi come il branch-and-bound.
- **Heap Sort**: Un algoritmo di ordinamento che utilizza un Max-Heap o un Min-Heap per ordinare un array in tempo $O(n \log n)$.
- **Algoritmo di Dijkstra**: Utilizza un Min-Heap per trovare il percorso più breve da un nodo sorgente a tutti gli altri nodi in un grafo ponderato.
- **Algoritmo di Prim**: Utilizza un Min-Heap per trovare l'albero ricoprente minimo in un grafo ponderato.
#### 6. Heap Sort
- **Descrizione**: L'Heap Sort è un algoritmo di ordinamento che utilizza un Max-Heap per ordinare un array in ordine crescente (o un Min-Heap per ordinarlo in ordine decrescente).
- **Passaggi**:
    - Costruire un Max-Heap dall'array.
    - Estrarre l'elemento massimo (la radice del heap) e posizionarlo alla fine dell'array.
    - Ridurre la dimensione del heap di 1 e applicare heapify per ripristinare la proprietà di Max-Heap.
    - Ripetere fino a quando tutti gli elementi sono stati estratti e l'array è ordinato.
- **Complessità**: O(n log n) in tutti i casi (caso migliore, medio e peggiore), che lo rende molto efficiente e stabile in termini di prestazioni.
#### 7. Proprietà e Vantaggi degli Heap
- **Accesso Rapido agli Elementi di Priorità**: Un Heap permette di accedere all'elemento con la priorità più alta (massimo o minimo) in tempo O(1).
- **Bilanciamento**: Gli Heap mantengono una struttura bilanciata grazie alla proprietà dell'albero binario completo, garantendo che le operazioni di inserimento, cancellazione e accesso siano efficienti.
- **Efficienza di Spazio**: Grazie alla rappresentazione tramite array, gli Heap utilizzano la memoria in modo efficiente, senza overhead per i puntatori.
#### 8. Limitazioni degli Heap
- **Non Ottimale per la Ricerca di Elementi Arbitrari**: Sebbene gli Heap siano eccellenti per trovare il massimo o minimo, non sono altrettanto efficienti per la ricerca di un elemento specifico, che può richiedere tempo O(n).
- **Non Mantiene Ordinamento Completo**: Gli Heap non mantengono un ordinamento completo di tutti gli elementi; solo la radice è garantita essere il massimo o il minimo.
### Priority queue
Una **priority queue** (coda a priorità) è una struttura dati astratta simile a una coda, ma con un'importante differenza: ogni elemento ha una **priorità** associata, e gli elementi vengono estratti dalla coda in base alla loro priorità, non in base all'ordine di inserimento (FIFO - First In, First Out).
#### 1. Definizione e Caratteristiche
- **Comportamento**: In una priority queue, l'elemento con la priorità più alta viene sempre servito prima, indipendentemente dall'ordine in cui è stato inserito. Se due elementi hanno la stessa priorità, l'ordine di estrazione può essere definito dall'implementazione (alcune implementazioni usano l'ordine di inserimento come tie-breaker).
- **Priority Queue Min**: Gli elementi con priorità inferiore vengono estratti per primi.
- **Priority Queue Max**: Gli elementi con priorità superiore vengono estratti per primi.
#### 2. Operazioni Fondamentali
- **Insert (Enqueue)**: Inserisce un elemento nella coda con una certa priorità.
- **Extract-Min/Extract-Max (Dequeue)**: Estrae l'elemento con la priorità più alta (o più bassa) dalla coda.
- **Peek/Top**: Restituisce l'elemento con la priorità più alta (o più bassa) senza rimuoverlo dalla coda.
- **Decrease-Key/Increase-Key**: Modifica la priorità di un elemento già presente nella coda. È un'operazione comune in algoritmi come Dijkstra.
- **Delete**: Rimuove un elemento specifico dalla coda (anche se non è la radice).
#### 3. Implementazione della Priority Queue
Le priority queue possono essere implementate in vari modi, ognuno con vantaggi e svantaggi in termini di complessità temporale delle operazioni.
- **Heap Binario**:
    - **Descrizione**: Una delle implementazioni più comuni delle priority queue è tramite un **heap binario**. In un Min-Heap, la radice (l'elemento con la priorità più alta) è sempre il valore minimo, mentre in un Max-Heap è sempre il valore massimo.
    - **Complessità**:
        - Inserimento: O(log n)
        - Estrazione del minimo/massimo: O(log n)
        - Accesso al minimo/massimo: O(1)
        - Decrease/Increase-Key: O(log n)
        - Costruzione dell'Heap: O(n)
- **Heap di Fibonacci**:
    - **Descrizione**: Una struttura dati più complessa che permette operazioni di decrease-key più efficienti. Utilizzata in algoritmi avanzati come Dijkstra.
    - **Complessità**:
        - Inserimento: O(1)
        - Estrazione del minimo/massimo: O(log n) ammortizzato
        - Decrease/Increase-Key: O(1) ammortizzato
- **Heap Binomiale**:
    - **Descrizione**: Basato su una collezione di alberi binomiali, supporta efficientemente l'operazione di unione di due heap.
    - **Complessità**: Simile a quella del heap binario, ma con un'unione efficiente O(log n).
- **Coda Non Ordinata**:
    - **Descrizione**: Utilizza un array o una lista collegata non ordinata per memorizzare gli elementi.
    - **Complessità**:
        - Inserimento: O(1)
        - Estrazione del minimo/massimo: O(n) (poiché è necessario scorrere tutta la lista per trovare l'elemento con la priorità corretta).
- **Coda Ordinata**:
    - **Descrizione**: Utilizza un array o una lista collegata ordinata per memorizzare gli elementi.
    - **Complessità**:
        - Inserimento: O(n) (poiché è necessario inserire l'elemento nella posizione corretta per mantenere l'ordine).
        - Estrazione del minimo/massimo: O(1).
#### 4. Applicazioni delle Priority Queue
- **Algoritmo di Dijkstra**: Utilizza una priority queue per selezionare il nodo successivo con la distanza minima non ancora processato.
- **Algoritmo di Prim**: Utilizzato per trovare l'albero ricoprente minimo, la priority queue gestisce i archi di taglio (cut edges) per scegliere quello con il peso minimo.
- **Gestione dei Processi in Sistemi Operativi**: Le priority queue possono essere utilizzate per gestire i processi, assicurando che quelli con la priorità più alta vengano eseguiti per primi.
- **Schedulazione dei Lavori (Job Scheduling)**: Per gestire le code di lavori nei sistemi di elaborazione distribuita o nei server di stampa.
- **Simulazioni Discrete Event**: Le priority queue gestiscono eventi in cui l'evento con la data/ora più bassa deve essere elaborato per primo.
- **Compressione di Huffman**: Utilizza una priority queue per costruire un albero di codifica efficiente basato sulle frequenze dei caratteri.
#### 5. Vantaggi e Limiti delle Priority Queue
- **Vantaggi**:
    - **Accesso Rapido al Minimo/Massimo**: Le priority queue sono estremamente efficienti per l'accesso e l'estrazione dell'elemento con la priorità più alta.
    - **Flessibilità**: Possono essere utilizzate per implementare una vasta gamma di algoritmi di ottimizzazione e gestione delle risorse.
    - **Supporto per Operazioni Dinamiche**: Come decrease-key, che sono cruciali in molti algoritmi.
- **Limiti**:
    - **Ricerca di Elementi Arbitrari**: Le priority queue non sono efficienti per trovare o manipolare elementi che non sono al minimo/massimo.
    - **Costo di Mantenimento**: Il costo di mantenere l'ordine di priorità può essere elevato, soprattutto in implementazioni semplici come le code non ordinate.
### Minimum spanning tree
Il **Minimum Spanning Tree** (MST), o **Albero Ricoprente Minimo**, è un concetto fondamentale nella teoria dei grafi e ha numerose applicazioni in informatica, ingegneria delle reti, e altre discipline. Ecco una panoramica completa:
#### 1. Definizione
- **Grafo**: Un grafo è costituito da un insieme di nodi (o vertici) e un insieme di archi (o spigoli) che collegano coppie di nodi.
- **Albero Ricoprente**: Un albero ricoprente di un grafo connesso e non orientato è un sottografo che include tutti i nodi del grafo originale e un sottoinsieme degli archi tali che il sottografo sia un albero (nessun ciclo) e sia connesso.
- **Minimum Spanning Tree**: È un albero ricoprente in cui la somma dei pesi degli archi è minima rispetto a tutte le possibili configurazioni di alberi ricoprenti dello stesso grafo.
#### 2. Proprietà
- Un grafo con V vertici avrà V−1 archi nel suo albero ricoprente minimo.
- Il MST di un grafo connesso è unico se tutti i pesi degli archi sono distinti.
- Se ci sono pesi uguali, possono esistere più MST diversi con lo stesso costo minimo.
#### 3. Algoritmi Principali per Trovare il MST
Ci sono due algoritmi classici e molto utilizzati per trovare un MST in un grafo ponderato:
##### a. Algoritmo di Kruskal
- **Descrizione**: L'algoritmo di Kruskal è un approccio "greedy" che costruisce l'MST aggiungendo archi in ordine crescente di peso, assicurandosi che non si formino cicli.
- **Passaggi**:
    1. Ordina tutti gli archi del grafo in ordine crescente di peso.
    2. Inizia con un grafo vuoto.
    3. Aggiungi gli archi uno alla volta, partendo da quello con il peso minore.
    4. Se l'aggiunta di un arco forma un ciclo, scartalo.
    5. Ripeti finché non sono stati aggiunti V−1 archi.
- **Complessità**: $O(E \log E)$, dove $E$ è il numero di archi, poiché il passo dominante è l'ordinamento degli archi.
##### b. Algoritmo di Prim
- **Descrizione**: L'algoritmo di Prim è un altro approccio "greedy" che costruisce l'MST partendo da un nodo arbitrario e aggiungendo progressivamente gli archi connessi di peso minimo.
- **Passaggi**:
    1. Inizia da un nodo arbitrario e aggiungilo all'MST.
    2. Scegli l'arco di peso minimo che collega un nodo nell'MST a un nodo fuori dall'MST.
    3. Aggiungi questo arco e il nodo collegato all'MST.
    4. Ripeti finché tutti i nodi non sono inclusi nell'MST.
- **Complessità**: Può variare da $O(E \log V)$ a $O(V^2)$ a seconda dell'implementazione, con il più efficiente che utilizza un Min-Heap (priority queue) per gestire i vertici.
#### 4. Applicazioni del Minimum Spanning Tree
- **Progettazione di Reti**: Per minimizzare il costo di cablaggio in reti elettriche, reti di comunicazione, o reti idriche.
- **Clusterizzazione**: Nell'analisi dei dati, il MST può essere utilizzato per raggruppare punti in cluster minimizzando la distanza interna al cluster.
- **Progettazione di Circuiti**: Per minimizzare la lunghezza totale del filo in un circuito stampato.
- **Compressione dei Dati**: L'MST può essere utilizzato in alcune tecniche di compressione come l'algoritmo di Huffman modificato.
- **Approssimazione di Cammini Hamiltoniani**: Un MST può essere utilizzato come base per trovare approssimazioni di problemi NP-difficili come il problema del commesso viaggiatore.
#### 5. Proprietà Teoriche
- **Proprietà del Taglio (Cut Property)**: Per ogni taglio del grafo, l'arco di peso minimo che attraversa il taglio fa parte di tutti gli MST del grafo.
- **Proprietà del Ciclo (Cycle Property)**: Per ogni ciclo nel grafo, l'arco di peso massimo in quel ciclo non fa parte di nessun MST.
- **Unicità**: Se tutti i pesi degli archi sono distinti, l'MST è unico.
### Cammini di costo minimo
Il concetto di **cammini di costo minimo** riguarda la determinazione del percorso più economico o meno dispendioso per viaggiare tra due nodi in un grafo ponderato. Questo problema è centrale in molte applicazioni pratiche, come la navigazione GPS, le reti di telecomunicazioni, la logistica e la pianificazione.
#### 1. Definizione
Un **cammino di costo minimo** (o **cammino minimo**), in un grafo ponderato, è un percorso tra due nodi (origine e destinazione) tale che la somma dei pesi degli archi lungo il percorso sia minima rispetto a tutti i possibili percorsi tra quei due nodi.
#### 2. Tipi di Problemi di Cammini Minimi
- **Single Source Shortest Path**: Trova il cammino di costo minimo da un nodo sorgente a tutti gli altri nodi del grafo.
- **Single Destination Shortest Path**: Trova il cammino di costo minimo da tutti i nodi a un nodo destinazione.
- **Single Pair Shortest Path**: Trova il cammino di costo minimo tra due nodi specifici.
- **All-Pairs Shortest Path**: Trova i cammini di costo minimo per ogni coppia di nodi del grafo.
#### 3. Algoritmi Principali per i Cammini di Costo Minimo
##### a. Algoritmo di Dijkstra
- **Descrizione**: È l'algoritmo più utilizzato per trovare il cammino di costo minimo da un nodo sorgente a tutti gli altri nodi in un grafo con pesi non negativi.
- **Passaggi**:
    1. Inizializza la distanza del nodo sorgente a 0 e tutte le altre distanze a infinito.
    2. Usa una coda a priorità (spesso implementata come un Min-Heap) per selezionare il nodo con la distanza minima non ancora processato.
    3. Aggiorna le distanze dei vicini del nodo corrente.
    4. Ripeti finché tutti i nodi non sono stati processati.
- **Complessità**: $O((V + E) \log V)$, dove V è il numero di nodi ed E è il numero di archi.
- **Limitazioni**: Non funziona con grafi che contengono archi con pesi negativi.
##### b. Algoritmo di Bellman-Ford
- **Descrizione**: Questo algoritmo trova i cammini minimi da un nodo sorgente a tutti gli altri nodi anche in grafi che contengono archi con pesi negativi.
- **Passaggi**:
    1. Inizializza la distanza del nodo sorgente a 0 e tutte le altre distanze a infinito.
    2. Per ogni nodo, esamina tutti gli archi e rilassa (aggiorna) la distanza se un cammino più corto viene trovato.
    3. Ripeti l'operazione $V-1$ volte, dove V è il numero di nodi.
    4. Effettua un ulteriore passaggio per rilevare eventuali cicli di peso negativo (se una distanza può essere ulteriormente ridotta, esiste un ciclo di peso negativo).
- **Complessità**: $O(V \times E)$.
- **Vantaggi**: Gestisce i pesi negativi e può rilevare cicli di peso negativo.
##### c. Algoritmo di Floyd-Warshall
- **Descrizione**: È un algoritmo dinamico utilizzato per trovare i cammini minimi tra tutte le coppie di nodi in un grafo.
- **Passaggi**:
    1. Inizializza una matrice di distanze dove ogni cella $[i][j]$ contiene il peso dell'arco diretto da i a j (o infinito se non esiste arco diretto).
    2. Iterativamente, per ogni nodo k, aggiorna la matrice confrontando il percorso diretto tra due nodi i e j con il percorso che passa per k.
    3. Continua fino a che tutti i nodi siano stati considerati come possibili intermediari.
- **Complessità**: $O(V^3)$.
- **Vantaggi**: Calcola i cammini minimi per tutte le coppie di nodi e gestisce i pesi negativi (ma non cicli negativi).
#### 4. Proprietà Teoriche
- **Ottimalità dei Cammini Minimi**: Un cammino di costo minimo trovato da un algoritmo corretto è garantito essere il cammino ottimale, ossia non esiste un altro cammino con un costo inferiore tra due nodi dati.
- **Sottostruttura Ottimale**: Un cammino minimo tra due nodi A e B include tutti i cammini minimi intermedi tra i nodi lungo questo percorso.
### Algoritmi MST
>**Taglio**: dato un grafo non orientato, un taglio in esso è una partizione dell'insieme dei vertici in due. Un arco $u$ attraversa il taglio tra i due insiemi se un nodo dell'arco è contenuto in un insieme e l'altro nodo nell'altro insieme.

>**Regola del taglio**: scegli un taglio che non contiene archi blu. Tra tutti gli archi non colorati del taglio, seleziona quello di costo minimo e coloralo di blu.

>**Regola del ciclo**: scegli un ciclo semplice che non contiene archi rossi. Tra tutti gli archi non colorati del ciclo, seleziona un arco di costo massimo e coloralo di rosso.

>**Algoritmo generico Greedy**: esiste sempre un MST che contiene tutti gli archi blu, e nessun arco rosso.
#### Algoritmo di Kruskal
Si parte da una foresta di $n$ alberi blu che hanno un solo elemento nella radice, ed $n$ è il numero dei nodi. Per ogni arco del grafo (da quello con costo minore, a quello con costo maggiore) viene applicato il seguente passo:
> **Kruskal**: se l'arco ha entrambi i vertici nello stesso albero blu, coloralo di rosso, altrimenti coloralo di blu.

Alla fine verrà restituito un MST fatto di archi blu.
Kruskal può essere implementato più efficacemente con le strutture union-find. L'operazione di unione verine usata per unire due alberi blu, e quella di find per verificare se i due estremi dell'arco appartengono allo stesso albero blu.
#### Algoritmo di Prim
Si parte da un unico albero blu $T$ radicato in un solo vertice, algoritmo di Prim applica $n-1$ volte il seguente passo:
>**Prim**: scegli un arco di costo minimo incidente su $T$ e coloralo di blu. (regola del taglio)

L'algoritmo di Prim termina quando non è più possibile applicare la regola del taglio.
Prim può essere implementato più efficacemente con code di priorità.
### Cammini Minimi
Sia $G=(V,E)$ un grafo orientato con funzione di costo $w:E\to\mathbb R$. Il costo $w(\pi)$ di un cammino $\pi=\langle v_0,v_1,\ldots,v_k\rangle$ in $G$ è dato da
$$w(\pi)=\sum^k_{i=1}w(v_{i-1},v_i)$$
Un cammino minimo tra due vertici $x$ e $y$ si indica $\pi^*_{xy}$  
>**Distanza**:$$d_{xy}=\left\{\begin{array}{l} \pi^*_{xy}\text{ se x e y sono connessi}\\+\infty\text{ altrimenti} \end{array}\right.$$

> **Appartenenza ad un cammino minimo**: $d_{su}+w(u,v)= d_{sv}$ se e solo se $(u,v)$ appartiene al cammino minimo.

> **Condizione di Bellman**: Per ogni arco $(u,v)$ e vertice $s$, le distanze tra vertici soddisfano la seguente disuguaglianza: $d_{su}+w(u,v)\ge d_{sv}$. *(la distanza tra s e u + il peso di u, v è maggiore della distanza tra s e v). Allora il valore della distanza è minore di quello del peso.*

> **Tecnica del rilassamento**: $d_{xv}+w(\pi_{xv})<d_{xy}\implies d_{xy} = d_{xv}+w(\pi_{xv})$ . *se la distanza tra xv + il peso del cammino vy è minore della distanza xy, si rende quella la nuova distanza xy.*

#### Algoritmo di Bellman-Ford
```
BellmanFord(G, S):
	Inizializza dist[] con infinito per tutti i nodi eccetto dist[S] = 0
	
		Per ogni nodo i da 1 a |V|-1:
			Per ogni arco (u, v) con peso w: 
				Se dist[u] + w < dist[v]: 
					dist[v] = dist[u] + w 
					
	Per ogni arco (u, v) con peso w:
		Se dist[u] + w < dist[v]:
			Riporta "Ciclo negativo rilevato"
	Restituisci dist[]
```

La complessità temporale dell'algoritmo di Bellman-Ford è $O(V \times E)$, dove $V$ è il numero di nodi e $E$ è il numero di archi.
Note:
- Funziona con cicli negativi
- Nodi non raggiungibili avranno distanza infinita
- Si itera $V-1$ volte
### Algoritmo di Dijkstra
L'algoritmo è costituito da due operazioni principali:
- Rilassamento dei nodi adiacenti
- Scelta del prossimo nodo, ovvero quello inesplorato con distanza minima

Dato un grafo e un nodo sorgente
```
inizalizza tutte le distanze a infinito
imposta la distanza del nodo sorgente a 0
imposta il nodo sorgente come visitato

rilassa i nodi adiacenti al nodo sorgente
	(nota, per tenere traccia del percorso dal nodo sorgente alla destinazione,
	ogni volta che si effettua un rilassamento indicare anche il nodo precedente)
scegli il nodo non visitato con distanza minore
esegui l'operazione di rilassamento su di esso e ripeti
```
### Algoritmo di Floyd-Warshall
Usa la programmazione dinamica
$d_{uv}^k$ è la distanza minima da u a v, nell'ipotesi che eventuali nodi intermedi possono appartenere solo a $\{1,\ldots,k\}$.
$$d_{uv}^0=\left\{\begin{array}{l}0 \text{ se } u=v\\ w(u,v) \text{ se } (u,v)\in E\\ +\infty \text{ se } (u,v)\notin E \end{array}\right.$$
$d_{uv}^0$ è la distanza minima nel ipotesi di non poter passare da alcun nodo intermedio.
Caso generale: $D_{uv}^k=\min(D_{uv}^{k-1},D^{k-1}_{uk}+D^{k-1}_{kv})$

```FloydWarshall(n, dist[][]):
    Per ogni k da 1 a n:
        Per ogni i da 1 a n:
            Per ogni j da 1 a n:
                Se dist[i][j] > dist[i][k] + dist[k][j] allora:
                    dist[i][j] = dist[i][k] + dist[k][j]
    Restituisci dist[][]```
