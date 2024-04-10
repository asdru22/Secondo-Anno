Esempio su Page Table (PT), in cui la taglia della PT è più grande della taglia dei frame e quindi sara' necessaria una paginazione della PT stessa.
> Un'entry è una singola voce nella tabella di paginazione

Dati:
- Cerchiamo gli indirizzi logici su $32b$
- La taglia delle pagine è di $32KB = 2^{15}B$, da cui $15b$ per l'offset
- Abbiamo $0.5GB = 2^{29}B$ di RAM.
Procedimento
1. Numero pagine: $32-15=17$, quindi il processo più grande ammesso in questo sistema avrà $2^{17}$ pagine.
2. Il processo più grande ammesso in questo sistema avrà quindi $2^{17}$ entry.
3. Serve una paginazione della PT, in quanto $2^{17}\times yB>2^{15}B$
4. Calcoliamo la taglia della PT massima:
	1. Troviamo il numero di frame: $2^{29}B/2^{15}B=2^{14}$
	2. Troviamo i byte per scrivere il numero di frame: $14b\approx 2\times8b\to2B$ 
	3. Quindi abbiamo una PT nella quale le singole entry occupano $2B$
	4. La taglia massima di una PT nel sistema è $2^{17}\times 2B=2^{18}B$. La singola entry della PT occupa più di un singolo byte, nel nostro caso $2$.
5.  Paginazione della PT massimale: $2^{18}/2^{15 }=2^3$, quindi un indirizzo logico sarà scritto in questo modo:

| $p_1$ | $p_2$ | $d$   |
| ----- | ----- | ----- |
| $3b$  | $14b$ | $15b$ |
6. La PT di secondo livello più grande è $2^3\times 2=2^4$

# Generalizzando
- Indirizzi logici su $x\textup b$
- Taglia delle pagine è $2^y\textup B$, quindi si hanno $y\textup b$ per l'offset.
- $2^z\textup B$ di RAM
1. Numero pagine: $n=x-y$, il processo più grande ammesso nel sistema avrà $2^n$ pagine.
2. Serve una paginazione della PT se $2^n\times\alpha\textup b>2^{y}\textup b$.
3. Calcoliamo la PT massima
	1. Numero di frame: $2^z\textup B/y=2^m\textup B$.
	2. Byte per scrivere il numero di frame: $w=\min(x\in\mathbb N^+|x\times 8>=m)$. Le entry della PT occupano $w\textup b$.
	3. La taglia massima di una PT in un sistema è $2^{n}\times w\textup B=2^{T_{\max}}\textup B$
	4. $2^{PT_{\max}}=2^{T_{\max}}/2^y$. Un indirizzo logico sarà del tipo

| $p_1$                | $p_2$        | $d$          |
| -------------------- | ------------ | ------------ |
| $PT_{\max}\textup b$ | $m\textup b$ | $y\textup b$ |
4. La PT di secondo livello ha dimensione max: $2^{PT_{\max}}\times w$
