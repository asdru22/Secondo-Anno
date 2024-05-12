Un file è un insieme di dati relativi a informazioni memorizzata in memoria secondaria. Dati non possono essere scritti in memoria secondaria a meno che non siano dentro un file.
### Attributi dei file
- Nome
- Identificatore numerico
- Tipo: determina la struttura del file (numerico/binario/testuale)
- Località: Questa informazione è un puntatore a un dispositivo e all'indirizzo del file su quel dispositivo
- Dimensione
- Protezione
- Tempo, data e identificazione utente
### Operazioni dei file
- Creazione: si libera spazio in memoria e si crea un entrata nella directory per il nuovo file
- Scrittura: si effettua una chiamata di sistema specificando sia il nome del file che le informazioni da scrivere. Il sistema cerca il file nel directory tramite il nome e tiene traccia di un puntatore di scrittura alla posizione nel file dove avverrà la prossima scrittura. Questo puntatore viene aggiornato ad ogni scrittura.
- Lettura: si utilizza una chiamata di sistema specificando il nome del file e la posizione (in memoria) dove dovrebbe essere messo il prossimo blocco del file. Il sistema cerca il file nella directory tramite il nome e tiene traccia di un puntatore di lettura alla posizione nel file dove avverrà la prossima lettura. Dopo la lettura, il puntatore di lettura viene aggiornato. Poiché un processo di solito legge o scrive su un file, la posizione corrente dell'operazione può essere mantenuta come un puntatore di posizione corrente del file per processo. Entrambe le operazioni di lettura e scrittura utilizzano lo stesso puntatore, risparmiando spazio e riducendo la complessità del sistema.
- Riposizionamento: si cerca la voce appropriata nel directory e il riposizionamento del puntatore di posizione corrente del file a un dato valore. Questa operazione non richiede necessariamente I/O effettivo ed è nota come "file seek".
- Eliminazione: si cerca il file nel directory tramite il nome, si libera tutto lo spazio del file in modo che possa essere riutilizzato da altri file, e si cancella l'entrata del directory associata.
- Troncamento: consente all'utente di cancellare i contenuti di un file mantenendone le attribuzioni. Piuttosto che costringere l'utente a eliminare il file e poi ricrearlo, questa funzione consente a tutte le attribuzioni di rimanere invariate - tranne la lunghezza del file - ma consente al file di essere resettato a lunghezza zero e di rilasciare il suo spazio di file.
Il sistema operativo utilizza due livelli di tabelle interne: una tabella per processo e una tabella a livello di sistema. La tabella per processo tiene traccia di tutti i file che un processo ha aperto e include informazioni come il puntatore corrente del file e i diritti di accesso. Ogni voce nella tabella per processo punta a una tabella a livello di sistema che contiene informazioni indipendenti dal processo, come la posizione del file su disco e la dimensione del file. Quando un file viene aperto da un processo, viene creata un'entrata nella tabella a livello di sistema. Quando un altro processo apre lo stesso file, viene aggiunta semplicemente un'entrata alla tabella del processo che punta all'entrata appropriata nella tabella a livello di sistema. Di solito, la tabella dei file aperti tiene anche traccia di quante istanze di processo hanno aperto un file. Ogni volta che un file viene chiuso, il conteggio delle istanze aperte diminuisce e quando questo conteggio raggiunge zero, il file non è più in uso e la sua voce viene rimossa dalla tabella dei file aperti.

A un file aperto sono associati
- Puntatore: il SO deve tenere traccia delle ultime posizioni lette o scritte con un puntatore, che è unico per ogni processo che opera sul file e deve essere separato dagli attributi del file salvati su disco.
- Contatore dei file aperti: tiene traccia del numero di aperture e chiusure.
- Posizione del file sul disco
- Diritti di accesso
### Tipi di file
 Una tecnica per implementare tipi di file è includere il tipo come parte del nome. Il sistema usa l'estensione per indicare che tipo di file è e che operazioni possono essere eseguite su di esso.
 I tipi sono anche usati per indicare la struttura interna di un file. File oggetto e sorgente hanno strutture apposite per le necessità dei programmi che li leggono. 
 Se un SO supporta più tipi di file, deve avere strutture in grado di capire ognuno di essi. Inoltre può essere necessario definire ogni file come uno dei tipi supportati dal SO.
### Struttura interna del file
I dischi hanno una dimensione di blocco definita, ma spesso la dimensione del record logico non corrisponde esattamente a quella del blocco fisico. L'impacchettamento di record logici in blocchi fisici è una soluzione comune. La conversione da record logici a blocchi fisici è un problema software relativamente semplice. La frammentazione interna è inevitabile nei sistemi di file, con una maggiore dimensione del blocco che aumenta tale frammentazione.
### Metodi di accesso
#### Accesso sequenziale
Dati nel file vengono processati in ordine, un record dopo l'altro. Si usano operazioni di `read_next()` per leggere una porzione di file e far avanzare il puntatore. `write_next()` aggiunge alla fine del file i nuovi dati e avanza il puntatore alla fine di essi.
#### Accesso diretto
Un file è composto da indirizzi logici di lunghezza fissa che permettono ai programmi di leggere e scrivere record velocemente in un ordine qualsiasi. Il metodo di accesso diretto è basato sul modello del file su disco, dato che i dischi permettono accesso casuale ad ogni blocco di file. 
### Struttura della directory e del disco
Un dispositivo di memorizzazione può essere utilizzato interamente per un sistema di file o suddiviso per un controllo più dettagliato. Ad esempio, un disco può essere partizionato e ogni parte può contenere un sistema di file separato. La partizione è utile per limitare le dimensioni dei singoli sistemi di file, mettere più tipi di sistemi di file sullo stesso dispositivo, o lasciare parte del dispositivo disponibile per altri usi. Ogni entità che contiene un sistema di file è chiamata volume e può essere una parte di un dispositivo, l'intero dispositivo o più dispositivi collegati in un set RAID. Ogni volume può essere considerato un disco virtuale e può anche memorizzare più sistemi operativi. Ogni volume deve contenere informazioni sui file nel sistema, mantenute in una directory del dispositivo o una tabella dei contenuti del volume. La directory registra informazioni come nome, posizione, dimensione e tipo per tutti i file su quel volume.
### Directory di grafo aciclico
Una struttura ad albero vieta la condivisione di file o cartelle. Un grafo aciclico permette alle cartelle di condividere sottocartelle e file. Il grafo aciclico è una generalizzazione della struttura a ad albero delle directory.
Le modifiche fatte al file condiviso verranno percepite all'interno di entrambe le cartelle dato che non si tratta semplicemente di una copia del file.

Una struttura di directory a grafo aciclico è più flessibile delle struttura ad albero, ma è anche più complessa.
Un file può avere più percorsi assoluti. Di conseguenza, nomi di file distinti possono fare riferimento allo stesso file. Questa situazione è simile al problema dell'aliasing per i linguaggi di programmazione. Se stiamo cercando di attraversare l'intero sistema di file - per trovare un file, accumulare statistiche su tutti i file o copiare tutti i file su un archivio di backup - questo problema diventa significativo, poiché non vogliamo attraversare strutture condivise più di una volta.

Un altro problema riguarda quando lo spazio allocato a un file condiviso può essere deallocato e riutilizzato (eliminazione). Una possibilità è rimuovere il file ogni volta che qualcuno lo elimina, ma questa azione può lasciare puntatori non validi al file non esistente. Peggio ancora, se i puntatori rimanenti al file contengono indirizzi effettivi del disco e lo spazio viene successivamente riutilizzato per altri file, questi puntatori non validi possono puntare nel mezzo di altri file.

Un altro approccio alla cancellazione è preservare il file finché tutti i riferimenti ad esso sono cancellati. Bisogna avere un meccanismo che determina l'ultimo riferimento al file che è stato cancellato tramite una lista di tutti i riferimenti al file. Quando un link o copia viene cancellata, si rimuove l'elemento corrispondente dalla lista.
### Directory strutturate ad albero
Sono una struttura con profondità non definita e prive di link (altrimenti si perderebbe l'aciclicità degli alberi).