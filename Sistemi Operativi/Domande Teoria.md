1. Cos'è un page fault, e come viene gestito dal Sistema Operativo?
    **Risposta**: Un page fault è un'interruzione generata quando un processo tenta di accedere a una pagina della memoria che **non è attualmente mappata nella memoria fisica**. Il sistema operativo gestisce un page fault caricando la pagina richiesta dalla memoria secondaria (es. disco rigido) nella memoria principale (RAM), aggiornando le tabelle delle pagine e riprendendo l'esecuzione del processo.
2. Cosa si intende con multiprogrammazione? Perché è importante, anche su macchine con un solo processore?
    **Risposta**: La multiprogrammazione è una tecnica che consente a più processi di essere caricati in memoria e di utilizzare la CPU in modo interattivo. È importante perché aumenta l'utilizzo della CPU riducendo i tempi di inattività, poiché la CPU può passare a eseguire un altro processo mentre uno è in attesa di I/O.
3. Spiegare il funzionamento dell’algoritmo di LRU replacement. Questo algoritmo è “pratico” (cioè è effettivamente implementato su SO) nell’ambito della paginazione?
    **Risposta**: L'algoritmo di sostituzione LRU (Least Recently Used) sostituisce la pagina che non è stata utilizzata per il periodo di tempo più lungo. L’algoritmo richiederebbe di memorizzare il tempo dell’ultimo accesso ad ogni pagina, sostanzialmente ogni volta che si accede ad una pagina ci sarebbe una informazione da aggiornare. Questo aggiungerebbe notevole overhead e renderebbe l’algoritmo non "pratico".
4. Per effettuare una operazione di Input/Output su periferica, è necessario l’intervento del SO? Come viene a sapere (il SO, o il processo che ha richiesto l’operazione) del completamento dell’operazione stessa?
    **Risposta**: Sì, è necessario l'intervento del SO per gestire le operazioni di I/O. Il SO utilizza driver di dispositivo per interfacciarsi con le periferiche. Le periferiche di input/output sono lente e quindi gestite in modo asynchronous. Una interrupt viene prodotta quando l’operazione e’ terminata. Nel frattempo la CPU puo’ dedicarsi ad altri processi (multiprogrammazione)
5. Nella crittografia, cosa significa adottare una codifica "a blocchi"? Come si evita che blocchi uguali diano codifiche identiche?
    **Risposta**: La codifica a blocchi divide il testo in chiaro in blocchi di dimensione fissa e cifra ogni blocco separatamente. Per evitare che blocchi uguali diano codifiche identiche, si utilizzano modalità operative come il CBC (Cipher Block Chaining), che introduce un vettore di inizializzazione (IV) e rende ogni blocco di testo cifrato dipendente dal blocco precedente.
6. Cos'è il principio di località dei programmi? Indicate almeno un esempio di politica del sistema operativo che sfrutta questo principio, e un esempio di di parte hardware in un calcolatore che è stato introdotto per sfruttare questo principio.
    **Risposta**: Il principio di località afferma che i programmi tendono ad accedere a una piccola porzione della memoria in modo ripetuto. Un esempio di politica del sistema operativo che sfrutta questo principio è la gestione della cache. Un esempio hardware è la **memoria cache della CPU**, che memorizza dati e istruzioni frequentemente utilizzati per velocizzare l'accesso, **la TLB e l'algoritmo LRU**
7. Quali sono i vantaggi della paginazione, rispetto ad una allocazione della memoria centrale di tipo contiguo? Ci sono anche degli svantaggi?
    **Risposta**: I vantaggi della paginazione includono una migliore gestione della memoria, riduzione della frammentazione esterna e supporto per la memoria virtuale. Gli svantaggi possono includere una maggiore complessità di gestione e una possibile frammentazione interna.
8. Qual è il più grave problema che può avere un algoritmo di scheduling a priorità, e come si risolve? Per un sistema time sharing, meglio usare un algoritmo di scheduling preemptive o non preemptive? Quale algoritmo suggerireste come migliore?
    **Risposta**: Il più grave problema di un algoritmo di scheduling a priorità è l'inanizione (starvation), dove i processi a bassa priorità possono non essere mai eseguiti. Questo problema può essere risolto con l'implementazione di una tecnica di aging, che aumenta gradualmente la priorità dei processi in attesa. Per un sistema time sharing è preferibile un algoritmo di scheduling preemptive per garantire che tutti i processi ottengano un tempo di CPU equo. L'algoritmo Round Robin è spesso suggerito come migliore per questi sistemi.
9. È possibile che un processo P che gira su un sistema A dotato di memoria virtuale venga eseguito più velocemente che su un sistema B del tutto identico ad A ma non dotato di memoria virtuale?
    **Risposta**: Sì, è possibile se il processo P richiede più memoria di quella fisicamente disponibile su sistema B, **causando frequenti page fault** e rallentando l'esecuzione. La memoria virtuale permette a sistema A di gestire meglio queste richieste, riducendo il numero di page fault e migliorando le prestazioni complessive.
10. Nella cifratura a chiave simmetrica, perché una permutazione dell’alfabeto non è considerata una buona chiave? Nella "cifratura a blocchi" perché è desiderabile che blocchi identici siano tradotti diversamente tra loro, pur usando la stessa chiave? E come viene ottenuto questo?
    **Risposta**: Una permutazione dell’alfabeto non è considerata una buona chiave nella cifratura a chiave simmetrica perché è troppo semplice e può essere facilmente invertita con attacchi di forza bruta. Nella cifratura a blocchi, è desiderabile che blocchi identici siano tradotti diversamente per evitare schemi ripetitivi che possono essere sfruttati da attacchi statistici. Questo è ottenuto tramite modalità operative come CBC o l'uso di IV.
11. Disegnare il grafo che rappresenta gli stati possibili di un processo, e le transizioni tra stati. Per ogni transizione, indicare almeno una ragione che può causare quella transizione.
    **Risposta**:
    - **Stati possibili**: New, Ready, Running, Waiting, Terminated.
    - **Transizioni**:
        - New -> Ready: il processo è stato creato e pronto per l'esecuzione.
        - Ready -> Running: il processo viene schedulato sulla CPU.
        - Running -> Waiting: il processo richiede I/O.
        - Running -> Ready: il processo è preempted dalla CPU.
        - Waiting -> Ready: il processo ha completato l'I/O e può essere eseguito.
        - Running -> Terminated: il processo termina l'esecuzione.
12. Cos'è il process control block? A cosa serve? Che informazioni contiene (indicate almeno 2 campi)?
    **Risposta**: Il Process Control Block (PCB) è una struttura dati utilizzata dal sistema operativo per memorizzare informazioni su un processo. Serve per gestire l'esecuzione e lo stato dei processi. Contiene informazioni come:
    - Identificatore del processo (PID).
    - Stato del processo (Running, Waiting, etc.).
    - Contesto della CPU (registri, contatore di programma).
    - Informazioni di scheduling (priorità, tempo di esecuzione).
13. Allocazione di file su disco: supponiamo di avere un file system con file di piccole dimensioni. Quale o quali metodi di allocazione sono preferibili e perché?
    **Risposta**: Per file di piccole dimensioni, l'allocazione contigua può essere preferibile perché riduce la frammentazione e migliora le prestazioni di lettura/scrittura. Tuttavia, l'allocazione indicizzata può essere una buona scelta per gestire meglio la frammentazione e permettere l'accesso diretto ai blocchi.
14. Spiegate come avviene la traduzione da indirizzi logici in fisici in una allocazione con paginazione.
    **Risposta**: Nella paginazione, l'indirizzo logico è diviso in due parti: il numero di pagina e l'offset. Il numero di pagina viene utilizzato per cercare l'entry corrispondente nella page table, che contiene il numero di frame fisico. L'indirizzo fisico viene ottenuto combinando il numero di frame fisico con l'offset dell'indirizzo logico.
15. Riportare la distinzione tra crittografia a chiave simmetrica e a chiave pubblica. Quali sono i principali vantaggi della seconda? Descrivere i passi che portano alla determinazione della chiave pubblica e privata nell'algoritmo di RSA.
    **Risposta**: La crittografia a chiave simmetrica utilizza la stessa chiave per la cifratura e la decifratura, mentre la crittografia a chiave pubblica utilizza una coppia di chiavi: una pubblica per la cifratura e una privata per la decifratura. I principali vantaggi della crittografia a chiave pubblica includono una maggiore facilità nella distribuzione delle chiavi e la possibilità di gestire le firme digitali.
16. Con riferimento ai microprocessori moderni, spiegare cosa indica la seguente terminologia: pipelining; multicore; arithmetical logical unit (ALU).
    **Risposta**:
    - **Pipelining**: È una tecnica di progettazione dei processori che consente di suddividere l'esecuzione delle istruzioni in diverse fasi, con ogni fase che viene eseguita in parallelo. Questo aumenta il throughput complessivo del processore poiché diverse istruzioni possono essere elaborate simultaneamente in diverse fasi della pipeline.
    - **Multicore**: Si riferisce a un singolo chip di processore che contiene due o più unità di elaborazione indipendenti chiamate core. Ogni core è in grado di eseguire le proprie istruzioni e operazioni in modo indipendente, permettendo un aumento della capacità di elaborazione parallela e migliorando le prestazioni complessive del sistema.
    - **Arithmetical Logical Unit (ALU)**: È un componente del processore che esegue operazioni aritmetiche (come addizione, sottrazione) e logiche (come AND, OR). È essenziale per l'elaborazione dei dati all'interno della CPU e viene utilizzato in quasi tutte le istruzioni di un programma.
17. Qual è la differenza tra "modalità utente" e "modalità monitor" (nell’esecuzione di codice su un processore)? È vero che una interrupt viene gestita in modalità utente? Perché?
    **Risposta**:
    - **Modalità utente**: Il processore esegue il codice di applicazione con limitazioni sui privilegi di accesso alle risorse hardware.
    - **Modalità monitor (o kernel)**: Il processore esegue il codice del sistema operativo con pieni privilegi di accesso alle risorse hardware.
    Una interrupt non viene gestita in modalità utente, ma in modalità monitor, perché richiede privilegi elevati per accedere alle risorse di sistema e per garantire la sicurezza e la stabilità del sistema.
18. Quali sono i vantaggi e svantaggi principali di un algoritmo di CPU scheduling di tipo Round Robin rispetto a un algoritmo FIFO?
    **Risposta**:
    - **Round Robin**:
        - Vantaggi: Equa distribuzione del tempo di CPU, buon supporto per sistemi time-sharing, riduzione dell'inedia.
        - Svantaggi: Potenziale aumento del numero di context switch, che può ridurre l'efficienza.
    - **FIFO**:
        - Vantaggi: Semplice da implementare, riduce il numero di context switch.
        - Svantaggi: Può causare l'inedia per processi con tempi di esecuzione più lunghi, non adatto per sistemi time-sharing.
19. In un processore: Cosa è la Arithmetical Logical Unit (ALU)? Cosa si intende per pipelining e per superscalarità?
    **Risposta**:
    - **ALU**: L'unità logico-aritmetica (ALU) è la componente del processore che esegue operazioni aritmetiche (somma, sottrazione, etc.) e logiche (AND, OR, etc.).
    - **Pipelining**: Tecnica che consente di sovrapporre l'esecuzione di istruzioni multiple suddividendo l'esecuzione in più fasi, migliorando l'efficienza della CPU.
    - **Superscalarità**: Capacità di un processore di eseguire più istruzioni per ciclo di clock utilizzando più unità di esecuzione.
20. Indicate almeno 4 motivi (se sono più di 4 ancora meglio) per cui un processo che sta eseguendo sul processore, quindi che si trova in stato running, potrebbe passare in uno stato diverso. Distinguete i casi in cui il cambio di stato avviene per cause che dipendono dal processo stesso (quindi un cambio volontario) e cause esterne (cambio involontario).
    **Risposta**:
    - **Cause volontarie**:
        - Richiesta di I/O.
        - Termine dell'esecuzione (processo completato).
    - **Cause involontarie**:
        - Preemption da parte del SO per gestire un processo a priorità più alta.
        - Interrupt di sistema.
        - Page fault.
        - Scadere del quanto di tempo
21. Nella allocazione di memoria centrale di tipo "contiguo", come decide il Sistema Operativo dove allocare un certo processo? Che svantaggi presenta questo tipo di allocazione? E che vantaggi vedete?
    **Risposta**: Il SO decide dove allocare un processo contiguo cercando uno spazio contiguo libero sufficientemente grande.
    - **Svantaggi**: Frammentazione esterna, difficoltà di gestione della memoria nel lungo periodo.
    - **Vantaggi**: Semplicità di implementazione e gestione, rapido accesso a memoria.
22. Qual è il problema più importante di un algoritmo di CPU scheduling a priorità? Come si può risolvere?
    **Risposta**: Il problema più importante è l'inedia (starvation), dove processi a bassa priorità possono non essere mai eseguiti. Si può risolvere con tecniche di aging, aumentando gradualmente la priorità dei processi in attesa.
23. Che differenza c'è tra frammentazione interna ed esterna? A partire da allocazione di file su memoria secondaria, dare esempi di frammentazione interna ed esterna (un esempio per parte è sufficiente).
    **Risposta**:
    - **Frammentazione interna**: Spazio di memoria inutilizzato all'interno di un blocco allocato. Esempio: un file piccolo allocato in un blocco molto più grande.
    - **Frammentazione esterna**: Spazio di memoria non allocato tra blocchi allocati. Esempio: numerosi piccoli spazi liberi tra file allocati su disco.
24. Che differenza c'è tra una variabile di tipo "intero" e un semaforo (non binario)?
    **Risposta**:
    - Una variabile di tipo 'intero' è un semplice contenitore per valori numerici.
    - Un semaforo (non binario) è una struttura di sincronizzazione utilizzata per controllare l'accesso a risorse condivise, permettendo l'accesso concorrente controllato tramite operazioni P (wait) e V (signal).
25. Cosa contiene la page table (cioè come è fatta)? C'è una qualche relazione tra la dimensione della page table e la dimensione degli indirizzi logici?
    **Risposta**: La page table contiene mappature tra numeri di pagina logici e frame fisici. Ogni entry tipicamente contiene il numero di frame e bit di controllo (validità, protezione, etc.). La dimensione della page table dipende dalla dimensione dello spazio degli indirizzi logici e dalla dimensione delle pagine.
26. Quelli sotto sono alcuni tra gli algoritmi per page-replacement visti a lezione. Indicare per ciascuno di essi il problema principale che comporta:
    - First-In First-Out: Può sostituire pagine frequentemente utilizzate, causando un aumento dei page fault.
    - Optimal Algorithm: Difficile da implementare in pratica poiché richiede la conoscenza futura degli accessi alle pagine.
    - LRU (Least Recently Used): Richiede un monitoraggio continuo dell'utilizzo delle pagine, che può essere costoso in termini di risorse.
27. Nell'algoritmo di RSA, il codaggio di un messaggio deve essere necessariamente fatto con una delle 2 chiavi, o può essere fatto con entrambe? Spiegare bene il perché, a partire dal modo con cui la crittografia è effettuata con RSA, se necessario richiamando proprietà aritmetiche.
    **Risposta**: Il codaggio di un messaggio con RSA può essere fatto con entrambe le chiavi (pubblica o privata). La chiave pubblica è usata per la cifratura dei messaggi e la chiave privata per la decifratura, garantendo riservatezza. Viceversa, la chiave privata può cifrare un messaggio e la chiave pubblica lo decifra, garantendo autenticità (firme digitali).
28. Cos'è un algoritmo di page replacement? Cosa si cerca di ottimizzare in un algoritmo del genere?
    **Risposta**: Un algoritmo di page replacement determina quale pagina rimpiazzare quando si verifica un page fault. Si cerca di ottimizzare il numero di page fault, mantenendo in memoria le pagine più utili per ridurre l'accesso al disco.
29. Esistono i semafori in Java? Perché? Se avete risposto "no" alla prima domanda sopra, scrivete una classe Java che implementa i semafori (non necessariamente binari).
    **Risposta**: Sì, esistono i semafori in Java. La classe `java.util.concurrent.Semaphore` fornisce un supporto per la sincronizzazione basata su semafori, consentendo un controllo più raffinato dell'accesso concorrente alle risorse rispetto ai blocchi di sincronizzazione tradizionali.
30. Descrivere una soluzione al problema delle firme digitali usando la crittografia.
    **Risposta**: Una soluzione al problema delle firme digitali utilizza la crittografia asimmetrica. Il mittente cifra un hash del messaggio con la sua chiave privata, creando la firma digitale. Il destinatario decifra la firma con la chiave pubblica del mittente e confronta l'hash decifrato con l'hash del messaggio ricevuto per verificarne l'integrità e l'autenticità.
31. Cos'è una memoria cache e perché si usa? Date degli esempi di strutture del Sistema Operativo per gestire le quali si fa ricorso a una qualche forma di memoria cache.
    **Risposta**: La memoria cache è una memoria veloce che memorizza copie di dati frequentemente utilizzati per ridurre i tempi di accesso. Si usa per migliorare le prestazioni del sistema. Esempi di strutture del Sistema Operativo che utilizzano la cache includono la CPU, TLB, 
32. Un sistema (hardware + sistema operativo) soffre spesso del problema del thrashing. Indicate due modifiche al sistema, una hardware e una software, che potrebbero migliorare la situazione.
    **Risposta**:
    - **Modifica hardware**: Aumentare la quantità di memoria fisica disponibile.
    - **Modifica software**: Ottimizzare la gestione della memoria virtuale, ad esempio utilizzando algoritmi di page replacement più efficienti o regolando la quantità di multiprogrammazione per limitare il numero di processi attivi.
33. Cos'è il context switch? Che operazioni fa il sistema operativo durante il context switch? Perché è importante che un sistema operativo minimizzi il tempo di context switch?
    **Risposta**: Il context switch è il processo di salvataggio dello stato di un processo e il caricamento dello stato di un altro processo. Durante un context switch, il sistema operativo salva i registri del processore, lo stato della CPU, e altre informazioni del processo corrente, e carica lo stato del processo successivo. È importante minimizzare il tempo di context switch (processo in esecuzione) per ridurre l'overhead e migliorare l'efficienza del sistema.
34. Cos'è la politica Least Recently Used e come funziona? La si trova implementata nei sistemi operativi moderni?
    **Risposta**: La politica Least Recently Used (LRU) è un algoritmo di page replacement che sostituisce la pagina che non è stata utilizzata per il periodo di tempo più lungo. Funziona mantenendo traccia dell'ordine di utilizzo delle pagine e sostituendo quella meno recente. Sì, è implementata in molti sistemi operativi moderni grazie alla sua buona approssimazione del comportamento ottimale.
35. Elencate quali tecniche usa un sistema operativo, in collaborazione con l'hardware del processore, per proteggersi da funzionamenti impropri (accidentali o voluti) dei programmi utente. Almeno 2 esempi.
    **Risposta**:
    - **Modalità utente e modalità kernel**: I processori moderni operano in modalità utente con privilegi limitati e modalità kernel con privilegi elevati per proteggere le risorse di sistema.
    - **Protezione della memoria**: Utilizzo di tecniche come la paginazione e la segmentazione per isolare la memoria di diversi processi, impedendo a un processo di accedere alla memoria di un altro processo.
 36. Descrivere il metodo di allocazione di file su disco detto "indexed". Come funziona? Che vantaggi e svantaggi presenta?
    **Risposta**: Nel metodo di allocazione indicizzata, ogni file ha un blocco di indice che contiene i puntatori ai blocchi dati del file.
    - **Vantaggi**: Accesso diretto ai blocchi dati, facile gestione dei file.
    - **Svantaggi**: Overhead di memorizzazione per il blocco di indice, limitazioni nella dimensione massima del file a seconda della dimensione del blocco di indice.
37. Perché può essere vantaggioso usare thread al posto di processi?
    **Risposta**: L'uso dei thread può essere vantaggioso perché i thread all'interno dello stesso processo condividono lo stesso spazio di indirizzi, rendendo più facile e veloce la comunicazione e la condivisione dei dati rispetto ai processi separati. Inoltre, il context switch tra thread è generalmente più veloce rispetto a quello tra processi.
