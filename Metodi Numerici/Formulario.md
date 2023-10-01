## Errore Assoluto ($\epsilon$)
$$\epsilon_\alpha=\alpha-fl(\alpha)$$
## Errore Relativo ($\epsilon_r$)
$$\epsilon_{r\alpha}=\bigg|\frac{\alpha-fl(\alpha)}\alpha\bigg|$$
### Unità di arrotondamento ($u$)
$u=\beta^{1-t}$ se si tronca
$u=\frac1 2\beta^{1-t}$ se si arrotonda
### Teorema Precisione di Rappresentazione
$$\forall\alpha\in\mathbb R,\alpha\ne0\implies\epsilon_r(\alpha)=\bigg|\frac{\alpha-fl(\alpha)}\alpha\bigg|<u$$
#### Corollario
$$\forall\alpha\in\mathbb R,\ \alpha\ne0\implies fl(\alpha)=\alpha(1\pm\epsilon_r),\ \epsilon<u$$
### Operazioni in aritmetica floating point
- $x\ \tilde{\textup{op}}\ y=fl(x\ \textup{op}\ y)$
- $fl(x)=x(1+\epsilon_x),\ fl(y)=y(1+\epsilon_y)$
- $fl(x\ \textup{op}\ y)=(fl(x)\ \textup{op}\ fl(y))(1+\epsilon_+)$
### Errore inerente ($E_{IN}$)
$$E_{IN}=\bigg|\frac{f(\tilde x)-f(x)}{f(x)}\bigg|$$
L'errore inerente si riferisce all'imprecisione dovuta al fatto che i numeri in una rappresentazione numerica (come numeri floating-point) non possono rappresentare esattamente tutti i numeri reali. Questo tipo di errore si verifica quando si eseguono operazioni matematiche su numeri in virgola mobile, e il risultato è un'approssimazione del valore reale. Gli errori aritmetici possono portare all'accumulo di errori in calcoli iterativi o in algoritmi che coinvolgono molte operazioni aritmetiche.
### Errore algoritmico ($E_{ALG}$)
$$E_{ALG}=\bigg|\frac{\tilde f(\tilde x)-f(\tilde x)}{f(\tilde  x)}\bigg|$$
L'errore algoritmico rappresenta la discrepanza tra il risultato prodotto da un algoritmo e il risultato esatto o desiderato, questo tipo di errore può derivare da semplificazioni o approssimazioni fatte dall'algoritmo durante il calcolo. Gli errori algoritmici possono verificarsi, ad esempio, quando si utilizzano algoritmi approssimati o quando si effettuano arrotondamenti numerici per semplificare calcoli complessi.
### Teorema Errore totale ($E_{TOT}$)
$$x,\tilde x|\ f(x)\ne0,\ f(\tilde x)\ne0\implies E_{TOT}=E_{ALG}(1+E_{IN})+E_{IN}\ \widetilde=\ E_{ALG}+E_{IN}$$
L'errore totale è la somma degli errori algoritmici e degli errori aritmetici associati a un calcolo o a un algoritmo. Rappresenta la discrepanza complessiva tra il risultato calcolato e il risultato atteso, considerando sia gli errori dovuti all'algoritmo che quelli dovuti alla rappresentazione numerica.
### Numero di condizione ($N_c$)
$$N_c=\bigg|\frac{x_0\ f'(x_0)}{f(x_0)}\bigg|$$
### Stima Errore Inerente per $f$ differenziali e $x$ vettore con $n$ elementi
$$E_{IN}=\Sigma^n_{i=1}|c_i\epsilon_i|\ \ \ \ c_i=\bigg|\frac{x_{0i}\frac{\delta f}{\delta x_{0i}}}{f(x_0)}\epsilon_i\bigg|\ \ \ \ \epsilon_i=\bigg|\frac{\widetilde{x_i}-x_{0i}}{x_{0i}}\bigg|$$
