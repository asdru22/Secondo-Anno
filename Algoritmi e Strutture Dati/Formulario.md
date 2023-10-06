### Master Theorem
La relazione di ricorrenza
$$T(n)=\begin{cases}aT(\frac n b)+f(n)\ \textup{se}\ n>1\\1\ \textup{se}\ n=1\end{cases}$$
ha soluzione
1. $T(n) =\Theta(n^{\log_ba})$ se $f(n)=O(n^{\log_ba}-\epsilon)$ per $\epsilon>0$
2. $T(n) =\Theta(n^{\log_ba}\log n)\ \textup{se}\ f(n)=\Theta(n^{\log_ba})$
3. $T(n)=\Theta(f(n))$ se $f(n) =\Omega(n^{\log_ba+\epsilon})$ per $\epsilon>0$ e $af(n/b)\le cf(n)$ per $c<1$ e $n$ sufficientemente grande.
Si applica
1. individuando $a, b, f(n)$
2. calcolando $n\log_ba$
3. confrontando asintoticamente $f(n)$ con $n\log_ba$
4. applicando opportunamente il Master Theorem.