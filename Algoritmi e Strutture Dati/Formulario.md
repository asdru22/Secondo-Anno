### Master Theorem
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


Buonasera, grazie mille per le foto.
Non ho capito se il colore che abbiamo indicato come "verde principale" usato nella prova della quale avete mandato la foto sia l'802 o quello alternativo che avete proposto. Nel caso non lo fosse secondo me l'802 è piu simile al colore che stiamo cercando come si vede anche nel cartoncino che avete allegato, se invece è effettivamente l'802 che risulta cosi spento una volta stampato preferisco venga usato il colore alternativo che avete proposto. 
Infine ho visto che l'azzurro che abbiamo proposto è troppo tendente al blu, e se è possibile vorremo utilizzare un verde-acqua (ad esempio il 339 indicato qua https://www.pantone-colours.com/).
Grazie ancora per la disponibilità e mi scuso per il disturbo.