Curve di Bézier cubiche, che coinvolgono polinomi di grado $n$ e $n+1$ punti di controllo. Seguiamo una procedura passo dopo passo:

1. **Definizione dei Punti di Controllo:** Inizia con $n+1$ punti di controllo $[P_0,\dots,P_n]$​. Questi punti definiranno la forma generale della curva di Bézier.
2. **Definizione delle Funzioni di Bernstein:** Le funzioni di Bernstein $B^n_i(t)$ per una curva di Bézier di grado $n$ sono definite come:
$$B_i^n(t)=\binom ni\frac{(b-t)^{n-1}(t-a)^i}{(b-a)^n}\ \ \ \ t\in[a,b]$$
  Dove $i$ varia da $0$ a $n$ e rappresenta l'indice delle funzioni di Bernstein.
  > In genere se $[a,b]=[0,1]$, i $t$ si ottengono con `t=linspace(0,1,np)`.
3. **Definizione della Curva di Bézier:** La curva di Bézier è la somma pesata delle funzioni di Bernstein moltiplicate per i punti di controllo:
$$B(t)=\sum^n_{i=0}P_i\times B_i^n(t)$$Dove $P_i$​ sono i punti di controllo e $t$ è il parametro che varia da $0$ a $1$.
4. **Interpolazione e Valutazione:** Per ottenere una curva di Bézier che interpoli i punti di controllo, si assegna $t=0$ al primo punto di controllo $P_0$​ e $t=1$ all'ultimo punto di controllo $P_n$​. Gli altri punti di controllo determinano la forma della curva.
    - $B(0)$ dà il punto di inizio della curva.
    - $B(1)$ dà il punto finale della curva.
	Le coordinate dei punti intermedi sulla curva possono essere ottenute variando il parametro $t$ tra $0$ e $1$.
5. **Rappresentazione Parametrica:** La curva di Bézier può essere rappresentata parametricamente utilizzando la forma generale $B(t)$. Ogni punto sulla curva è ottenuto per un valore specifico di $t$.