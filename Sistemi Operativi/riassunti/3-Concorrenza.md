La concorrenza riguarda la gestione di processi multipli, come:
- Multiprogramming: più processi su un solo processore
- Multiprocessing: più processi su una macchina con processori multipli
- Distributed Processing: più processi su un insieme di computer.
Due programmi si dicono in esecuzione concorrente se vengono eseguiti in parallelo.
Con concorrenza si intende l'insieme di notazioni per descrivere l'esecuzione concorrente di due o più programmi. è l'insieme di tecniche per risolvere problemi associati all'esecuzione concorrente (comunicazione e sincronizzazione).
In un sistema multiprocessore/distribuito si hanno dei processori in esecuzione in contemporanea, ma il problema di base è lo stesso: più processi eseguiti simultaneamente su processori diversi (overlapping). I problemi sono gli stessi perché non è possibile predire la velocità relativa dei processi. Non vi è sostanziale differenza tra i problemi relativi a multiprogramming e multiprocessing.
Esempio con 2 processi che vogliono accedere alla stessa variabile globale (`totale`)
```java
void modifica(int valore) {
	totale = totale + valore;
}

void main(){
	global int totale = 100;
	modifica(10); //processo 1
	modifica(-10); // processo 2
	print(totale);
}
```
I due processi hanno insiemi di registri distinti, ma l'accesso alla memoria su `totale` non può essere simultaneo, per cui non sempre `totale` avrà valore 100 alla fine dei 2 processi.
