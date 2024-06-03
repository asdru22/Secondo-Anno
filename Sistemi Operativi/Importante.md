- Sistema Operativo: sicurezza/protezione e gestione delle risorse
- Context Switch: sul processore si passa ad eseguire un processo P un processo Q
- Time sharing: interattività->reattività->quanto di tempo
- Interrupt: segnala al processore il termine di un'operazione
- Multicore: processore con più core (a loro volta processori). Ogni core ha una propria ALU, CU e cache.
- Pipelining: La CU è composta da F, D, E, che portano al parallelismo
- Superscalarità: risolve situazioni nel pipelining dove ci sono fasi che hanno necessità di più tempo. Si usa un buffer di contenimento con più execute unit.
- Bus: fili in cui passano i dati (bit). Il numero di bit che possono transitare contemporaneamente sui bus determinano l'architettura del computer.
- Controller: circuito elettronico che controlla l'hardware. Contiene registri che vengono usati dal processore per inviare istruzioni a una specifica periferica.
- Driver: mettono in contatto l'hardware con i livelli superiori del sistema operativo
- RAM: memoria centrale, divisa in celle grandi 1 byte, indirizzabili dal processore tramite MAR, MDR e command (registri) (nella cella \<MAR\> vado a \<command\> il valore \<MDR\>.
- Control Unit: cervello del processore, decide la prossima istruzione da eseguire. Contiene registri quali **program counter**: indica la cella di memoria che contiene l'istruzione che deve essere eseguita, e **Instruction register**: contiene l'istruzione che deve essere eseguita. (nella cella \<PC> si trova l'istruzione \<IR\>)
- Registri: forma di memoria più veloce, si trovano all'interno del processore.
- Cache: memorizza informazioni usate più frequentemente dal processore. Ci sono diversi livelli di cache. Cache principale: vicina al processore, Cache interne: all'interno della CPU
- Operazioni dual mode:
	- user mode: si eseguono operazioni di un processo e non di un sistema operativo
	- monitor mode: il processore sta eseguendo operazioni per conto del SO.
	Le istruzioni privilegiate possono essere eseguite solamente dal SO. Se lo user prova ad eseguire un istruzione privilegiata, avviene un interrupt che farà intervenire il SO.
- Protezione memoria: Ogni processo ha una zona di memoria designata dal **base register** (prima cella di memoria che il processo può utilizzare) e dal **limit register** (dimensione del processo). (il processo occupa le celle dalla \<base\> alla \<base+limit\>)
- Protezione della CPU: si usa l'hardware per controllare che il tempo trascorso da un processo sul processore sia inferiore del quanto di tempo, facendo decrementare un timer in base ad un orologio presente sull'hardware.
- Processo: programma in esecuzione
- Stati del processo: 
	- new
	- running: il processo è in esecuzione sul processore
	- waiting: il processo sta aspettando che accada qualcosa (istruzione I/O)
	- ready: il processo è pronto per essere eseguito ma non può perché in quel momento c'è un altro processo in esecuzione sul processore.
	- terminated
- Process control block: struttura che contiene informazioni relative ad un processo (stato, registri, program counter, puntatore e id)
- Threads: si separa la componente **risorse** di un processo da quella di **flusso di esecuzione**. In questo modo è possibile avere più flussi in esecuzione. I threads sono più leggeri dei processi, e fare context switch tra processi richiede tempo.
	- Vantaggi: concorrenza e parallelismo. se un thread si blocca il processo non è bloccato
	- Svantaggi: sincronizzazione, possibilità di interferenza e non determinismo
- CPU scheduling: parte del SO che si occupa delle politiche di scelta del processo che deve essere eseguito quando il processore è libero. Ci sono 3 tipi di scheduling:
	- Lungo termine: da memoria secondaria a RAM
	- Breve termine: da RAM a CPU
	- Swapper: da RAM a memoria secondaria
	Viene effettuato quando un processo va da
	- running a waiting
	- running a ready
	- waiting a ready
	- termina
	Lo scheduling può essere:
	- Nonpreemptive: non soggetto a context switch
	- Preemptive: il processo può perdere il processore anche quando ha ancora compiti da eseguire.
- **Criteri di scheduling dei processi**
	- First come, first served (FCFS): il primo processo che arriva è il primo processo ad essere eseguito (non preemptive)
	- Shortest job first (SJR): si esegue per primo il processo più corto (non implementabile perché non si sa quando o se un processo termina)
	- Priority scheduling: ogni processo ha un numero di priorità associato, viene eseguito per primo quello con priorità maggiore (preemptive e non).
	- Round robin (RR): FCFS, ma ogni processo ha un quanto di tempo, quando questo scade il processo viene messo nella coda dei processi ready.
- Multilevel Queue: nei SO vengono combinate queste politiche di scheduling. I processi ready vengono divisi in base alla loro priorità. I processi interattivi usano RR e quelli di background usano FCFS
- Processor Affinity: Si fanno eseguire gli stessi processi sempre sui stessi processori anche dopo un context switch perché c'è una buona probabilità che informazioni relative a quel processo siano ancora sulla cache di quel processore.
- Concorrenza
	- Apparente: diverse attività che la macchina sembra stia svolgendo contemporaneamente, ma c'è solo un processore quindi vengono eseguite solo una alla volta
	- Reale: ci sono più processori
	I problemi relativi alla concorrenza si risolvono con la comunicazione e la sincronizzazione
- Sezione critica: parte di un processo che accede a delle strutture dati condivise (globali). Si risolve il problema della sezione critica tramite:
	- **Mutual exclusion**: Quando un processo accede ad una variabile globale, bisogna garantire che nessun alto processo vi stia accedendo
	- **Progress**: se dei processi vogliono entrare nella loro sezione critica, questo non può essere rimandato all'infinito.
	- **Bounded waiting**: ci deve essere un limite di attesa per un processo.
- Algoritmi per gestire la CS
	- Problema alg1: impone un'alternanza esatta della sezione critica da parte dei due thread. Può portare alla violazione della condizione di progresso (deadlock)
	- Problema alg2: ci può essere un deadlock se i flag di entrambi i thread sono settati a true e rimangono bloccati sul while (deadlock)
	- Problema alg3: se entrambi i thread provano ad accedere in contemporanea alla sezione critica.
- Semafori: operazioni di incremento e decremento. Sono implementati a livello del SO, quindi il SO decide che quando vengono eseguite le operazioni di somma e sottrazione del semaforo non possono avvenire context switch, garantendo cosi l'atomicità delle operazioni.
- Memory management unit (MMU): a livello hardware, implementa la circuiteria per effettuare controlli sugli indirizzi.
- **Strategie per limitare i buchi di memoria**
	- First fit: il processo viene allocato nel primo buco di memoria abbastanza grande da conterlo.
	- Best fit: si cerca il hole che meglio approssima il processo.
	- Worst fit: si alloca il processo nel buco più grande possibile
- Frammentazione:
	- esterna: la memoria libera è suddivisa in piccoli blocchi non contigui che non possono essere usati efficacemente
	- interna: la memoria allocata è maggiore della memoria effettivamente richiesta dal processo
- Memoria associativa (TLB): è una memoria cache usata dai processori per velocizzare la traduzione degli indirizzi virtuali in indirizzi fisici. TLB migliora significativamente le prestazioni del sistema e l'efficienza della memoria virtuale riducendo il numero di accessi necessari alla tabella delle pagine nella memoria principale.
-  Formula EAT
$$EAT=(1-p)\times ma+p\times pft$$
	 - $p$: tasso di page fault
	 - $ma$: tempo di accesso alla memoria
	 - $pft$: tempo per page fault (page fault overhead + swap page out + swap page in + restart overhead)
- Inverted page table: invece di avere una page table per ogni processo, si ha un’unica page table per tutta la memoria centrale. Ogni entry corrisponde ad una pagina
- Page fault: quando viene prodotto l’indirizzo logico, a seguito dell’esecuzione di un processo, potrebbe darsi che la parte interessata di un processo non sia caricata effettivamente su RAM, quindi bisogna andarla a cercare sulla memoria secondaria. Un page fault viene prodotto da un processo che cerca di accedere a una pagina che in quel dato momento non è presente su memoria centrale.
- Pagina vittima: pagina che si trova su memoria centrale e che si decide di eliminare per fare spazio alla nuova pagina
- **Algoritmi di page replacement**
	- First in, first out (FIFO): si sostituisce la pagina che è stata caricata in memoria centrale per prima
	- Optimal: si sostituisce la pagina che sarà utilizzata più in la nel tempo (non implementabile)
	- Least recently used (LRU): i sostituisce la pagina usata meno recentemente (invece che guardare il futuro si guarda il passato)
	- Reference bit: si associa ad ogni pagina un bit che indica se la pagina è stata utilizzata nell'ultimo intervallo di tempo. Si sostituisce una pagina con reference bit uguale a 0.
	- Second chance: unisce FIFO e reference bit. Si sceglie la pagina guardando il suo reference bit. Se questo è settato a 0, diventerà la vittima, se è 1 gli viene data un'altra possibilità e il bit viene settato a 0 (pagina più vecchia con reference bit = 0).
- Algoritmi di allocazione frame: 
	- equal
	- proportional: i frame vengono allocati in maniera proporzionale alla taglia del processo stesso.
- Trashing: Quando il livello di multiprogrammazione diventa troppo elevato rispetto a quello che sono le esigenze dei singoli processi, allora c’è il rischio che il numero di page fault sia elevato. Diventa necessario ridurre il livello di multiprogrammazione
- Problemi nelle comunicazioni a distanza: confidenzialità, autenticazione, integrità dei messaggi.
- Tipi di crittografia:
	- simmetrica (cifrario di cesare, substitution cipher, cifratura a blocchi)
	- pubblica (RSA)
- Funzione toziente: $a^{F(n)}\mod n=1$
- Implementazione RSA
	1. $p$ e $q$ numeri primi
	2. $n=p\times q$
	3. $F(n)=(p-1)\times(q-1)$
	4. $1<e<n$ non divisibile per $F(n)$
	5. $d|(e\times d)\mod F(n)=1$
	6. crittazione di $m$: $c=m^e\mod n$ ($n,e$ chiave pubblica)
	7. decrittazione di $c$: $m=c^d\mod n$ ($n,d$ chiave privata)
- Firme digitali
	1. **Applicazione della funzione di hash**: Il mittente applica una funzione di hash al messaggio originale.
	2. **Crittazione**: L'impronta (digest) del messaggio viene crittata con la chiave privata del mittente, creando la firma digitale.
	3. **Ricezione**: Il destinatario riceve il messaggio originale e la firma digitale.
	4. **Applicazione della funzione di hash**: Il destinatario applica la stessa funzione di hash al messaggio ricevuto.
	5. **Decrittazione**: La firma digitale viene decrittata con la chiave pubblica del mittente, ottenendo l'impronta originale.
	6. **Confronto**: Il destinatario confronta l'impronta generata dalla funzione di hash con l'impronta ottenuta dalla firma digitale decrittata.
- Tipi di accesso al record logico:
	- sequenziale
	- diretto
- **Tipi di allocazione**
	- Contigua: ogni file occupa un numero di blocchi contigui sul disco, sono richiesti solo il numero del primo blocco e il numero di blocchi totale. Usa un accesso casuale e causa frammentazione esterna
	- Concatenata: si frammentano i vari file utilizzando un puntatore per riconoscere il blocco successivo del file system. Evita la frammentazione esterna, ma è poco efficiente perché bisogna scorrere tutto il blocco per raggiungere l'ultimo elemento.
	- Indicizzata: per ogni file system si usa un blocco separato per scrivere la sequenza in cui il file è stato memorizzato. All'interno si trovano i puntatori dei blocchi del file. Evita la frammentazione esterna. Non conviene usarla con file molto piccoli
