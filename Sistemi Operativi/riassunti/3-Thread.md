### Processi singoli e multithread
Un thread possiede i propri dati, quelli della procedura che sta eseguendo, ma opera anche su dati globali visibili da tutti i thread. Un thread ha un puntatore che indica dove è arrivato all'esecuzione del processo. Il diagramma degli stati dei thread è uguale a quello dei processi.
I processi singlethreaded sono tipici dei SO tradizionali (i processi sono autonomi). I processi multithread lavorano su dati condivisi, sono leggeri e senza PCB.
### Esempio di utilizzo di un thread su un web server
- Dispatcher thread: ascolta le richieste in arrivo
- Worker thread(s): gestiscono la propria richiesta
- Web page cache: contiene le pagine più visitate, se non c'è bisogna andare a fare la richiesta sulla memoria secondaria. Quando si attende risposta dalla memoria secondaria si può attivare un altro worker thread, che può terminare prima se accede ad un elemento della cache.
### Vantaggi
- Più reattivo: dato che le richieste sono su più thread bisogna attendere la fine dell'esecuzione del processo e un altra istruzione può essere eseguita subito.
- Sfrutta il parallelismo: diversi thread girano su più processi in parallelo.
- Facilita la programmazione
### Svantaggi
- Interferenze
Esistono SO che prevedono l'esistenza dei thread. Ci possono essere dei SO che non usano i
thread ma dei processi standard in cui i thread sono aggiunti ai livelli superiori attraverso funzioni
di libreria con le quali si gestisce il context switch.
![[Pasted image 20240303133231.png]]