### Criteri di scheduling dei processi
- First come, first served (FCFS): il primo processo che arriva è il primo processo ad essere eseguito (non preemptive)
- Shortest job first (SJR): si esegue per primo il processo più corto (non implementabile perché non si sa quando o se un processo termina)
- Priority scheduling: ogni processo ha un numero di priorità associato, viene eseguito per primo quello con priorità maggiore (preemptive e non).
- Round robin (RR): FCFS, ma ogni processo ha un quanto di tempo, quando questo scade il processo viene messo nella coda dei processi ready.
### Strategie per limitare i buchi di memoria
- First fit: il processo viene allocato nel primo buco di memoria abbastanza grande da conterlo.
- Best fit: si cerca il hole che meglio approssima il processo.
- Worst fit: si alloca il processo nel buco più grande possibile
### Algoritmi di page replacement
- First in, first out (FIFO): si sostituisce la pagina che è stata caricata in memoria centrale per prima
- Optimal: si sostituisce la pagina che sarà utilizzata più in la nel tempo (non implementabile)
- Least recently used (LRU): i sostituisce la pagina usata meno recentemente (invece che guardare il futuro si guarda il passato)
- Reference bit: si associa ad ogni pagina un bit che indica se la pagina è stata utilizzata nell'ultimo intervallo di tempo. Si sostituisce una pagina con reference bit uguale a 0.
- Second chance: unisce FIFO e reference bit. Si sceglie la pagina guardando il suo reference bit. Se questo è settato a 0, diventerà la vittima, se è 1 gli viene data un'altra possibilità e il bit viene settato a 0.
### Tipi di allocazione
- Contigua: ogni file occupa un numero di blocchi contigui sul disco, sono richiesti solo il numero del primo blocco e il numero di blocchi totale. Usa un accesso casuale e causa spreco di spazio
- 