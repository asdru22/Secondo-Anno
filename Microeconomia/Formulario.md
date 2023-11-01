### Retta di Bilancio
$$p_1x_1+p_2x_2\le m$$
- $x_i$: quantità di bene $i$
- $p_i$: prezzo del bene $i$
- $p_ix_i$: quantità di moneta che il consumatore spende per il bene $i$.
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
### Quantità di Pasche
$$P_q=\frac{p_1^tx_1^t+p_2^tx_2^t}{p_1^tx_1^b+p_2^tx_2^b}$$
$P_q>1\Longleftrightarrow p_1^tx_1^t+p_2^tx_2^t>p_1^tx_1^b+p_2^tx_2^b\implies t>b$
### Indice di Laspeyres
$$L_q=\frac{p_1^bx_1^t+p_2^bx_2^t}{p_1^bx_1^b+p_2^bx_2^b}$$
$L_q<1\Longleftrightarrow p_1^bx_1^t+p_2^bx_2^t<p_1^tx_1^t+p_2^tx_2^t$ indica che il paniere oggi costa meno rispetto all'anno base.
### Equazione di Slutsky
- Beni ordinari: $p\uparrow\to x\downarrow$
- Beni di Giffen: $p\uparrow\to x\uparrow$ 
- Variazione della domanda compensata: $\Delta m=\Delta p_1x_1$: si compensa il reddito per la variazione dei prezzi.
### Effetto di sostituzione (rotazione)
Variazione del della domanda del bene $1$ quando il prezzo è $p_1'$ e il reddito è $m'$
$$\Delta x_1^S=x_1(p_1',m)-x_1(p_1,m)$$
Variazione della domanda compensata: cambiano i prezzi ma il potere d'acquisto rimane costante.
### Effetto di reddito (spostamento)
Variazione della domanda del bene $1$ al variare del reddito $m\to m'$ quando il prezzo è $p_1'$
$$\Delta x_1^n=x_1(p_1',m)-x_1(p_1',m')$$
Cambia il reddito ma i prezzi rimangono costanti.
- Beni normali: effetto reddito positivo ($\Delta x_1^n>0$)
- Beni inferiori: effetto reddito negativo ($\Delta x_1^n<0$)
### Curva prezzo-consumo
$$p_1x_1+p_2x_2= m=p_1\omega_1+p_2\omega_2$$
$\omega_i$: quantità bene (dotazione iniziale) $i$.
### Effetto reddito di dotazione
$$\Delta p=\textup{effetto sostituzione}+\textup{effetto reddito}+\textup{effetto reddito di dotazione}$$
### Equazione di Slutsky in presenza di dotazione iniziale
$$\frac{d x_1}{d p_1}=\frac{\delta x_1}{\delta p_1}+\frac{\delta x_1}{\delta m}(\omega_1-x_1)$$
La quantità domandata aumenta all'aumentare del reddito
### Offerta di lavoro
$$pC=M+wL$$
- $C$: quantità consumata
- $p$: prezzo di quantità consumata
- $M$: reddito non lavorativo
- $\omega$: salario
- $L$: quantità di lavoro offerta
- $wL$: reddito lavorativo
- $\bar L$: numero massimo ore di lavoro
- $C=\frac M p$: massimo consumo da reddito non lavorativo
- $R=\bar L -L$: ore di riposo
- $\bar R= \bar L$: ore di riposo massime
- $L$: ore effettivamente lavorate
- $\bar C=\frac M p$: massimo che posso consumare se non lavoro ($M=p\bar C$) 
### Variazione di salario dulle ore lavorative
$$pC+\omega R=p\bar C+\omega \bar R$$
- $\omega R$: costo-opportunità del riposo
### Offerta di lavoro
$$\frac{dR}{d\omega}=\frac{\delta R^s}{\delta\omega}+(\bar R-R)\frac{dR}{dM}$$
- $\frac{\delta R^s}{\delta\omega}$: effetto sostituzione
### Surplus caso utilità quasi lineare
$$\Delta SC=\Delta u(\cdot)$$
Il surplus è il beneficio che rimane in tasca dopo aver acquistato $n$ unità di bene.
$$\Delta\textup{benessere}\leftrightarrow\Delta SC$$
### Funzione di domanda partendo dai prezzi di riserva
$$u(x,m)=v(x)+m$$
- No effetto reddito
- $v(\cdot)$: funzione di sub-utilità
### Domanda inversa
$$SC(\bar P)=\int^{\bar x}_0P(x)-\bar P dx=\int^{\bar x}_0P(x) dx-\bar P\ \ (+m)$$
- $SC$: surplus
- $+m$: costante di integrazione, trascurata

### Domande di Mercato
$$X^1(P_1,P_2,(M_i)^n_i)=\sum^n_{i=1}x^1_i(P_1,P_2,m_i)=x_1(P_1,P_2,m)$$
### Elasticità ($\epsilon$)
$$\epsilon=\frac{\Delta q(\%)}{\Delta p(\%)}$$
$$\lim_{\Delta p\to0}\frac{\frac{\Delta q}{q}}{\frac{\Delta p}{p}}=\frac{\frac{dq}{q}}{\frac{dp}{p}}=\frac{dq}{dp}\frac{p}{q}=\epsilon$$
Minore è l'elasticità, minore è la reattività dei prezzi
$$\begin{cases}0\le\epsilon<1\to\textup{domanda rigida}\\\epsilon=1\to\textup{domanda unitaria}\\\epsilon>1\to\textup{domanda elastica}\end{cases}$$
### Funzione di domanda inversa ($P(X)$)
Utilizzata per esprimere il prezzo in funzione della quantità: questa funzione rappresenta il prezzo del bene 1 in corrispondenza del quale ne vengono domandate $X$ unità.
Il prezzo di un bene rappresenta il $MRS$ tra quel bene e tutti gli altri beni, ovvero la disponibilità marginale a pagare per un unità addizionale di quel bene da parte di chi lo sta domandando.
### Ricavo ($R$)
$$R=pq$$
$$\frac{\Delta R}{\Delta p}=q+p\frac{\Delta q}{\Delta p}=q[1-|\epsilon(p)|]$$
Se la domanda è molto sensibile al prezzo (molto elastica), un aumento del prezzo ridurrà talmente la domanda che i ricavi diminuiranno. 
Se la domanda è poco sensibile al prezzo (inelastica) un aumento del prezzo non la modificherà e quindi i ricavi aumenteranno.
### Ricavo marginale ($MR$)
$$MR=\frac{\Delta R}{\Delta q}=p+q\frac{\Delta p}{\Delta q}=p(q)\Big[1-\frac{1}{|\epsilon(q)|}\Big]$$
- $\epsilon=-1\implies MR=0$
- $\epsilon<1\implies$ il ricavo diminuisce all'aumentare dell'output
Se la domanda non è molto sensibile al prezzo, per poter aumentare l'output si dovranno ridurre i prezzi in modo consistente.
### Curva del ricavo marginale
Da $p(q)=a-qb$ , $\frac{\Delta p}{\Delta q}=-b$ e $\frac{\Delta R}{\Delta q}=p(q)+\frac{\Delta p(q)}{\Delta q}q$ si giunge a
$$MR=\frac{\Delta R}{\Delta q}=a-2bq$$
- $a$: intercetta sul prezzo
- $b$ = -inclinazione
### Isoquanti
Insieme di tutte le possibili combinazioni degli input 1 e 2 esattamente sufficienti a produrre una data quantità di output (simili alle curve di indifferenza).
- $x$: input
- $y$: output
### Prodotto marginale ($MP$)
$$MP=\frac{\Delta y}{\Delta x_1}=\frac{f(x_1+\Delta x_1,x_2)-f(x_1,x_2)}{\Delta x_1}$$
Il prodotto marginale è la quantità di output $y$ addizionale ottenuta impiegando una unità addizionale del fattore 1. Il prodotto marginale è un saggio di variazione: la quantità addizionale di output per unità di input (simile all'utilità marginale).
**Legge della produttività marginale decrescente**: se la tecnologia è monotona, l'output totale aumenterà all'aumentare del livello del fattore 1 (mantenendo fisso il fattore 2). Il prodotto marginale diminuisce quando si utilizzano quantità crescenti.
### Saggio tecnico di sostituzione ($TRS(x_1,x_2)$)
$$TRS(x_1,x_2)=\frac{\Delta x_1}{\Delta x_2}=-\frac{MP_1(x_1,x_2)}{MP_2(x_1,x_2)}$$
**Saggio tecnico di sostituzione decrescente**: se si impiega una quantità maggiore del fattore 1 e si varia l'impiego del fattore 2 in modo da rimanere sullo stesso isoquanto, il saggio tecnico di sostituzione diminuisce. L'ipotesi che il $TRS$ sia decrescente significa che l'inclinazione dell'isoquanto deve diminuire in valore assoluto man mano che ci si sposta lungo l'isoquanto nella direzione corrispondente all'aumento di $x_1$.