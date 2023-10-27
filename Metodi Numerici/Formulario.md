### Errore Assoluto ($\epsilon$)
$$\epsilon_\alpha=\alpha-fl(\alpha)$$
## Errore Relativo ($\epsilon_r$)
$$\epsilon_{r\alpha}=\bigg|\frac{\alpha-fl(\alpha)}\alpha\bigg|$$
### Unità di arrotondamento ($u$)
$u=\beta^{1-t}$ se si tronca
$u=\frac1 2\beta^{1-t}$ se si arrotonda
- $\beta$: base
- $t$: cifre di mantissa
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
L'*errore inerente* si riferisce all'imprecisione dovuta al fatto che i numeri in una rappresentazione numerica (come numeri floating-point) non possono rappresentare esattamente tutti i numeri reali. Questo tipo di errore si verifica quando si eseguono operazioni matematiche su numeri in virgola mobile, e il risultato è un'approssimazione del valore reale. Gli errori aritmetici possono portare all'accumulo di errori in calcoli iterativi o in algoritmi che coinvolgono molte operazioni aritmetiche.
### Errore algoritmico ($E_{ALG}$)
$$E_{ALG}=\bigg|\frac{\tilde f(\tilde x)-f(\tilde x)}{f(\tilde  x)}\bigg|$$
L'*errore algoritmico* rappresenta la discrepanza tra il risultato prodotto da un algoritmo e il risultato esatto o desiderato, questo tipo di errore può derivare da semplificazioni o approssimazioni fatte dall'algoritmo durante il calcolo. Gli errori algoritmici possono verificarsi, ad esempio, quando si utilizzano algoritmi approssimati o quando si effettuano arrotondamenti numerici per semplificare calcoli complessi.
*Per polinomi di grado $n$*:
$$E_{ALG}\le\frac{2\gamma n}{p(x)}\sum^n_{i=0}|\tilde a_i\tilde x|,\ \ 2\gamma n\le2,01n$$
### Teorema Errore totale ($E_{TOT}$)
$$x,\tilde x|\ f(x)\ne0,\ f(\tilde x)\ne0\implies E_{TOT}=E_{ALG}(1+E_{IN})+E_{IN}\ \widetilde=\ E_{ALG}+E_{IN}$$
L'*errore totale* è la somma degli errori algoritmici e degli errori aritmetici associati a un calcolo o a un algoritmo. Rappresenta la discrepanza complessiva tra il risultato calcolato e il risultato atteso, considerando sia gli errori dovuti all'algoritmo che quelli dovuti alla rappresentazione numerica.
### Numero di condizione ($N_c$)
$$N_c=\bigg|\frac{x_0\ f'(x_0)}{f(x_0)}\bigg|$$
### Stima Errore Inerente per $f$ differenziali e $x$ vettore con $n$ elementi
$$E_{IN}=\Sigma^n_{i=1}|c_i\epsilon_i|\ \ \ \ c_i=\frac{x_{i}\frac{\delta f}{\delta x_{i}}}{f(x)}\ \ \ \ \epsilon_i=\frac{\widetilde{x_i}-x_{i}}{x_{i}}$$
con $f:\mathbb R^2\to\mathbb R,\ x\to f(x),\ x=(x_1,...,x_n)\to f(x_1,...,x_n),\ \tilde x= fl(x)$
### Polinomio
Una funzione $p$ definita $\forall x\in\mathbb R$ da $p(x)=a_ox^0+a_1x^1+\dots+a_nx^n$, con $n>0$ e $a_0,a_1,\dots,a_n\in\mathbb R$ fissati è detta polinomio.
$p(x)|a_n\ne0\implies p(x)$ ha grado esattamente $n$.
Se tutti i coefficienti $a_i=0\ \forall i =1,\dots,n\implies\ p(x)$ è detto polinomio nullo.
$\mathbb P_n$ è l'insieme costituito dal polinomio e da tutti i polinomi di grado $1,\dots,n$. Bastano $n+1$ polinomi linearmente indipendenti per rappresentare tutti i polinomi dello spazio (usando tutte le combinazioni lineari). $1,x,x^2,\dots,x^n\in\mathbb P^n$
### Teorema fondamentale dell'algebra
Sia $p(x)$ un polinomio fondamentale di grado $n\ge1$, ogni equazione algebrica di grado $n$ ($p(x)=0$)
ha esattamente $n$ radici complesse, ciascuna contata con la sua semplicità.
$$p(x)=a_0(x-\alpha_1)^{m_1}-(x-\alpha_2)^{m_2}-\dots-(x-\alpha_k)^{k}$$
Dove
- $\alpha_1,\dots,\alpha_n$ sono radici distinte 
- $m_i$ con $i=1,\dots,k$ sono le loro molteplicità $|m_1+m_2+\dots+m_n=n$
### Teorema quoziente-resto
Siano $a(x)$ e $b(x)$ polinomi con $b(x)\ne0\implies\exists!\ q(x),r(x)\ |\ a(x)=q(x)\times b(x)+r(x)$ con $r(x)=0$ o $r(x)$ con grado minore di $b(x)$
### Algoritmi per valutare un polinomio
1. Costo computazionale: $2n\times\textup{moltiplicazione}+n\times\textup{addizione}$
$s = 1$
$p = a_0$
for $k = 1\dots n$ 
	$s=s\times\bar x$
	$p=p+a_k\times s$
$p(x)\leftarrow s$
2. Algoritmo di Horner, costo computazionale: $n\times(\textup{moltiplicazione}+\textup{addizione})$
$p=a(n)$
for $k=n-1,\dots,0$
	$p=a_k+x\times p$
$p(\bar x)\leftarrow p$
3. Algoritmo di Ruffini, costo computazionale: $n\times(\textup{moltiplicazione}+\textup{addizione})$
$p=a_n$
for $k=n-1,\dots,0$
	$p=a_k+\bar x\times p$
$p(x)=p$
### Base polinomiale di Bernstein $p(x)$
$$p(x)=\sum^n_{i=0}b_i\times B_{i,n}(x)\ \ \ \ \ x\in[a,b]$$
$$B_{i,n}(x)=\binom ni\frac{(b-x)^{n-1}(x-a)^i}{(b-a)^n}\ \ \ \ \ \ \ \ \ \ \ \binom ni=\frac{n!}{i!(n-i)!}$$
Proprietà:
- $B_{i,n}(x)>0$
- $\sum^n_{i=0}B_{i,n}(x)=1$
- $p(x)=\sum^n_{i=0}b_i\times B_{i,n}(x)\ \ \ x\in[a,b]$ è una combinazione convessa, cioè $\min\{b_i\}\le p(x)\le\max\{b_i\}\ \ \forall x\in[a,b]$
$$E_{IN}\le\sum^n_{i=0}|c_i||\epsilon_i|+|c_x||\epsilon_x|$$
### Valutazione di $p(x)$ con formula ricorrente
$$p(x)=\sum^n_{i=0}b_i\times B_{i,n}(x)$$
$$B_{i,u}(t)=t\times B_{i-1,u-1}(t)+(1-t)\times B_{i,u-1}(t)$$
con $B_{0,0}(t)=1,\ t\in[0,1]$ e $B_{i,u}(t)=0\ \forall i\notin\{0,\dots,u\}$. Ha costo computazionale $O(n^2)$, ma è più stabile rispetto a Horner perché non si fanno operazioni a rischio numerico (si lavora sempre con elementi positivi)
### Algoritmo di Casteljau
$$p(x)=\sum^n_{i=0}b_i\times B_{i,n}(x)\to\sum^{n=0}_{i=0}b_0^{[n]}B_{0,0}(x)=b_{0}^{[n]}$$
Dove $B_{i,n}(x)$ è lo sviluppo della formula ricorrente. Generalizzando:
$$b_i^{[j]}=b_i^{[j-1]}(1-x)+b_{i+1}^{[j-1]}$$
con $b_i^{[0]}=b_i$, $i=0,\dots ,n$ e $j=0,\dots ,n$
### Derivata prima di un polinomio con base di Bernstein
$$p'(x)=\sum^{n-1}_{i=0}d_i B_{i,n-1}(x),\ d_i=n(b_{i+1}-b_1),\ i=0,\dots,n-1$$
### Secondo metodo per calcolare derivata di un polinomio
$$p'(x)=\frac{1}{b-a}p'(t)$$
in un intervallo $[a,b]$, dove $p'(t)$ è la derivata di $p(t)$ in $[0,1]$.
### Derivata di grado $j$ di un polinomio
$$p^{(j)}(t)=\sum^{n-j}_{i=0}b_i^{(j)}B_{i,n-j}(t),\ \ \ b_i^{(j)}(t)=(n-j+1)(b_{i+1}^{j-1}-b_i^{j-1})$$
 con $t\in[0,1],\ \ \ j=1,\dots,n\ \ i=0,\dots,n-j$
### Curva
Coppia di funzioni $x=f(t)$ e $y=g(t)$ con $t\in[a,b]$. Al variare di $t$ in $[a,b]$ si avrà una curva definita da punti $(f(t),g(t))$
### Curva di Bezier
Insieme dei punti $P_i=(x_i,y_i)$ con $i=0,\dots,n$.
$$c(t)=\sum^n_{i=0}P_iB_{i,n}(t)\ \ \ t\in[0,1]\Longrightarrow \Big[\sum^n_{i=0}x_iB_{i,n}(t),\sum^n_{i=0}y_iB_{i,n}(t)\Big]$$
### Interpolazione polinomiale di dati
**Teorema di esistenza e unicità**: dati $n+1$ punti $(x_i,y_i),\ i=0,\dots,n$ con $x_i$ distinti, esiste ed è unico il polinomio $p\in\mathbb P_n$ che verifica le condizioni di interpolazione ($P(x_i)=y_i,\ i=0,\dots,n$)
### Risoluzione computazionale (base di Newton)
$$(x_i,y_i),\ i=0,\dots, n\ \ \ x\in[a,b]\ \ \ a=\min\{x_i\},b=\max\{x_i\}$$
$$p(x)=\{1,(x-x_0),(x-x_0)\times(x-x_1),\dots,(x-x_0)\times\ldots\times(x-x_{n-1})\}$$
