### Retta di Bilancio
$$p_1x_1+p_2x_2\le m$$
$\frac m{p_i}$: quantità che posso comprare se spendo tutto in $i$.
$-\frac{p_1}{p_2}$: rapporto del prezzo dei beni, ovvero quanto sul mercato posso sostituire il consumo di un bene con un altro. *Costo opportunità*: costo della miglior scelta alternativa (consumo bene 1 in termini di bene 2).
### Tassi e sussidi
- Sulla quantità: $p_1\to p_1\pm t$
- Sussidio: $p_1\to(1\pm\tau)p_1$
- Tassa sul reddito: $m\to m\mp T$
### Assiomi di razionalità:
Dati $X,Y$ panieri:
- Completezza: $X\succeq Y\ \vee\ Y\succ X\ \vee$ entrambe (Il consumatore è in grado di confrontare panieri diversi, non ci sono panieri che lo lasciano indifferente l'uno rispetto all'altro)
- Riflessività: $X\succeq X$ (ogni paniere è almeno preferito a se stesso)
- Transitività: $X\succeq Y\ \wedge\ Y\succeq Z\implies X\succeq Z$ (non si può strettamente preferire un paniere all'altro se sono identici)
Inoltre:
- $X\succeq Y\wedge Y\succeq X\implies X\sim Y$
- $X\succeq Y\wedge Y\nsucceq X\Longleftrightarrow X\succ Y$ ($X$ è debolmente preferito a $Y$, ma $Y$ non è debolmente preferito a $X$  se e solo se $X$ è strettamente preferito a $Y$)
Ci sono altri due assiomi:
- Monotonicità: $X\ge Y\Longleftrightarrow X\succ Y$ ($X$ ha almeno una componente in più di $Y$, quindi è strettamente preferito)
- Convessità: se scelgo una combinazione convessa delle delle preferenze, questa è strettamente preferita a quella di partenza. La curva di indifferenza di $X$ e $Y$ non può intersecare quella di $Z$ e per il principio di monotonicità. L'assioma di convessità riflette l'idea che i consumatori generalmente preferiscono la diversificazione o la varietà nei loro consumi. In altre parole, sono disposti a scambiare beni in modo tale che, mantenendo l'utilità costante, possano ottenere una combinazione di beni diversa.
### Saggio marginale di sostituzione ($MRS$)
- saggio: rapporto;
- marginale: infinitesimale;
- sostituzione: quante unità di bene 2 rinunciare per averne una in più di bene 1 e restare sulla stessa curva di indifferenza.
$$MRS=\lim_{x_1\to0}(-\frac{\Delta x_2}{\Delta x_1})=-\frac{\delta x_1}{\delta x_2}$$
Più la distanza tra $x_1$ e $x_2\to0$, più l'approssimazione sarà corretta.
### Utilità
$$u:\mathbb R^2_+\to\mathbb R_+|\begin{cases}x\succ y\Longleftrightarrow u(x)>u(y)\\x\sim y \Longleftrightarrow u(x)=u(y)\end{cases}$$
Utilità *ordinale* non importa il valore relativo dei numeri, non c'è cardinalità nel valore.
*Funzione di utilità Cobb-Douglas:* $u(x)=u(x_1,x_2)=x_1\times x_2$
$$\begin{cases}x_1\times x_2>y_1\times y_2\\x_1>y_1,x_2>y_2\end{cases}$$
### Utilità marginale ($MU$)
$$MU_1=\frac{\delta u(x_1,x_2)}{\delta(x_1)}>0$$
Monotonicità forte, $x_2$ fisso.
### Variazione utilità ($du$)
$$d u=MU_1\times d x_1$$
### Concavità curve di indifferenza ($IP$)
$$IP=\frac{\delta''u(x_1,x_2)}{\delta''(x_1)}\le0$$
Curve sempre rivolte verso l'origine: questo indica che il consumatore è disposto a scambiare una quantità maggiore di un bene per una quantità minore dell'altro, a patto che l'utilità rimanga costante.
### Preferenze Cobb-Douglas
$$u(x_1,x_2)=x_1^c,x_2^d\ \ \ \ \ \ \ \ \ MRS=\frac{cx_i^{c-1}x_2^d}{dx_i^c x_2^{d-1}}=\frac{cx_1}{dx_2}$$
### Paniere Ottimale
$$x^*|\begin{cases}p_1x_1^*+p_2x_2^*=m\\ MRS(x_1^*,x_2^*)=\frac{p_1}{p_2}\end{cases}$$
Entrambe le condizioni sono necessarie per un ottimo intero.
### Massimizzare una funzione obiettivo con i moltiplicatori di Lagrange
Calcolare
$$\max_{x_1,x_2}\ u(x_1,x_2)|p_1x_1+p_2x_2\le m$$
Funzione ausiliaria $\mathbb L(x_1,x_2,\lambda)=u(x_1,x_2)+\lambda(p_1x_1+p_2x_2-m)$
- $p_1x_1+p_2x_2-m=0$
- $\lambda$: moltiplicatore di Lagrange $=\frac{\delta\mathbb L}{\delta m}=\frac{\delta u}{\delta m}$: valore in termine di utilità della variazione del reddito
### Beni
*Normali*: $\frac{\delta x_1^*}{\delta m}>0$: maggiore è il reddito, maggiore è il consumo
*Inferiori*: $\frac{\delta x_1^*}{\delta m}<0$: minore è il reddito, minore è il consumo
### Curve omotetiche
Curve di Angel che se scalate mantengono lo steso ordine di preferenze strettamente crescente
### Statica comparata rispetto al prezzo ($m$ costante)
Beni ordinari: $\frac{\delta x_1(p_1,p_2)}{\delta p_1}<0$: aumenta il prezzo, diminuisce la domanda
Beni di Giffen: $\frac{\delta x_1(p_1,p_2)}{\delta p_1}>0$: aumenta il prezzo, aumenta la domanda
### Funzioni di domanda
Beni perfetti sostituti:
$$\begin{cases}p_1>p_2\to x_1(\cdot)=0\\p_1=p_2\to\textup{indeterminata}\\p_1<p_2\to x_1(\cdot)=\frac{m}{p_1}\end{cases}$$
Beni perfetti complementi:
$$x_1(\cdot)=\frac{m}{p_1+p_2}$$
Cobb-Douglas:
$$x_1(\cdot)=\frac{am}{p_1}$$
### Sub-utilità ($v$)
$$r_i=v(i)-v(i-1)$$
$r$: consumo
$v(\cdot)$: funzione di sub-utilità
### Preferenze
Le preferenze devono essere stabili nel tempo e *strettamente convesse*.
Se $p_1x_1+p_2x_2\ge p_1y_1+p_2y_2\to x\succeq y$
