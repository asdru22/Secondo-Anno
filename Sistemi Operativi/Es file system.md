Un hard disk ha la capacità di 64 Gigabyte, ed e’ formattato in blocchi da 1 Kilobyte, e usa la allocazione indicizzata per memorizzare i file su disco. Sull’hard disk è memorizzato un file F grande 1/3 (un terzo) di Megabyte. Quante operazioni di I/O su disco sono necessarie per portare in RAM l’ultimo blocco del file F (come al solito, si assuma che inizialmente sia presente in RAM solo la copia della directory che contiene F)

Conosciamo taglia blocco fisico: 1KB posso calcolare quanti blocchi fisici su HD:  
HD ha taglia 64GB = 1GB x 64 = 2^30 B x 2^6 = 2^36 B 
quindi: # blocchi su HD  2^36 B / 1KB = 2^36 / 2^10 = 2^26 
Quanti sono i blocchi su HD?  2^26
Quanti B prende un puntatore a blocco?  4B (=32 bit)
(avendo 2^26 blocchi, mi servono almeno 26 bit per scrivere il numero di ciascun blocco)
Dentro un singolo blocco fisico posso mettere quanti puntatori? 
2^10 B / 2^2 B = 2^8 = 256    (\*)
Il file F: ha una taglia 1/3 di MB ( 1 MB = 2^20 B)
Quindi la taglia di F e' tra 1/4 di MB (cioe' 2^20/2^2 = 2^18 ) 
e un 1/2  di MB (cioe' 2^20/2 = 2^19)
Quindi il numero di blocchi in cui e' diviso il file F e' strettamente compreso tra 
2^18 B / 2^10 B = 2^8   e 2^19  B  / 2^10  B  = 2^9 
Cioè il numero di blocchi in cui e' diviso F e' strettamente compreso tra 256 e 512
Ne consegue da (\*) che abbiamo bisogno di 2 blocchi indice 
Assumendo che i 2 blocchi che contengono la tabella indice siano concatenati tra di loro, avrò quindi bisogno di 3 accessi a disco per leggere ultimo blocco del file F

Se avessimo supposto la taglia di F essere 1/2 MB, allora F avrebbe necessitato di 2^9
puntatori (512). Ma allora 2 blocchi indici concatenati tra loro non sarebbe stati sufficienti perché nel primo blocco un puntatore andava speso per contenere il puntatore al secondo blocco indice. Quindi avrei avuto bisogno di 3 blocchi indice concatenati tra di
loro. Il numero di accessi per leggere ultimo blocco del file F sarebbe diventato 4. 

----
Si ha un HD di capienza 2^26 B, formattato in blocchi da 1024 B (= 2^10 B = 1KB). Quanti bit occorrono per memorizzare il numero di un blocco?
taglia HD 2^26 B / 2^10 B = 2^16  (numero blocchi), quindi servono 16 bit per scrivere il numero di un blocco

Si consideri un file A della dimensione di 800 KB, Un solo blocco indice e' sufficiente per indirizzare tutti i blocchi di A? Quanti blocchi necessari per memorizzare il file A?  800 

Occorre capire quanti puntatori sono memorizzabili in un blocco (il blocco contenente la
tabella indice) ? 
 2^10 B /2 B = 2^9  = 512

512 < 800, 1 solo blocco non e' sufficiente per indicizzare tutti i blocchi di A 

Ne servono 2. Notare: in tutto l'occupazione di blocchi da parte di A e' 802

---
Si ha un HD di capienza 2^41 B e formattato in blocchi di taglia 4096 B. Che taglia ha un puntatore a blocco? 

Dobbiamo capire quanti sono i blocchi.
2^ 41 B (taglia HD) / 2^12 (taglia del singolo blocco)  = 2^29

Quindi mi servono 29 bit per scrivere numero di blocco, cioè 4B

---
Abbiamo un file di taglia 16384 B = 2^14 B. Quanti accessi al disco saranno necessari per leggere l'ultimo blocco del file se viene adottata una allocazione concatenata dello spazio su disco?  Si assuma, come al solito, che sia gia' in RAM il numero del primo blocco
Il file e' grande 2^14 B 
il singolo blocco e' 2^12 B 

2^14 B / 2^12 B = 2^2 = 4 

I bocchi in cui sarebbe diviso in mio file, SE che non fosse spazio sprecato per i
puntatori tra i blocchi stessi. 
Siccome però i puntatori tra blocchi prendono un po' di spazio, mi serviranno 5 blocchi. 
E gli accessi per leggere l'ultimo blocco del file sono 5. 

Quanta memoria è inutilizzata a causa della frammentazione interna? 
I B di dati del  file sul quinto blocco sono 4x 4B = 16B 
Quindi la memoria inutilizzata e' 2^12 B - 16 B 
(possiamo anche assumere che anche nel blocco finale ci sia un puntatore che per default
segnala la fine del file, quindi lo spazio di questo puntatore non dovrebbe essere
considerato parte della memoria "persa". In questo caso quindi 
la memoria inutilizzata e'  2^12 B - (5x 4 B)  = 2^12 B - 20 B 

Se avessimo usato allocazione indicizzata: 
Il mio file ha bisogno di 4 puntatori. Ogni puntatore prende 4B, quindi 4B x4 = 16B 
Quindi un solo blocco e' sufficiente per contenere la tabella indice. 
Allora in questo caso per leggere l'ultimo blocco del file sono sufficienti 2 accessi.
