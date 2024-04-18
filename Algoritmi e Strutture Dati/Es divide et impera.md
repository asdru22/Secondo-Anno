1. Consideriamo un array `A[1..n]` composto da `n >= 0` valori reali, non necessariamente distinti. L'array è ordinato in senso non decrescente. Scrivere un algoritmo ricorsivo di tipo divide et-impera che restituisca true se e solo se A contiene valori duplicati. Calcolare il costo computazionale dell'algoritmo proposto.
```java
boolean duplicati(double A[1..n], int i, int j){
	if(i>=j) return false
	else{
		int m = floor((i+j)/2)
		return duplicati(A,i,m) || duplicati(A,m+1,j) || A[m] = A [m+1]
	}
}
```
Si controlla ricorsivamente se ci sono duplicati nelle due metà del vettore. 
Con il master theorem si stabilisce che $T(n)=\Theta(n)$.

2. Scrivere un algoritmo ricorsivo di tipo divide-et-impera che, dato un array `A[1..n]` di valori reali, restituisce true se e solo se A è ordinato in senso non decrescente, cioè se `A[1] ≤ A[2] ≤ … ≤ A[n]`. Calcolare il costo computazionale dell'algoritmo proposto.
```java
boolean ordinato(double A[1..n], int i, int j){
	if(i>=j) return false
	else{
		int m = floor((i+j)/2)
		return ordinato(A,i,m) && ordinato(A,m+1,j) && A[m] <= A [m+1]
	}
}
```
Con il master theorem si stabilisce che $T(n)=\Theta(n)$.

3. Si consideri un array `A[1..n]` composto da `n ≥ 1` interi distinti ordinati in senso crescente (`A[1] < A[2] < … < A[n]`). Scrivere un algoritmo efficiente che, dato in input l'array A, determina un indice i, se esiste, tale che `A[i] = i`. Nel caso esistano più indici che soddisfano la relazione precedente, è sufficiente restituirne uno qualsiasi. Determinare il costo computazionale dell'algoritmo.
```java
int indice(double A[1..n], int i, int j){
	if(i>j) return -1
	else{
		int m = floor((i+j)/2)
		if(a[m]=m) return m
		else if (a[m]>m) return indice(A,i,m-1)
		else return indice(A,m+1,j)
	}
}
```
Dato che è una variante dell'agloritmo di ricerca binaria, ha il suo stesso costo computazionale $T(n)=\Theta(\log n)$
 
4. Consideriamo un insieme di n variabili $x_1,…,x_n$. Sono dati un insieme di vincoli di uguaglianza della forma $x_i = x_j$, e un altro insieme di vincoli di disuguaglianza della forma $x_i ≠ x_j$. Il problema consiste nel capire se tutti i vincoli possono essere soddisfatti. Ad esempio, considerando quattro variabili $x_1, x_2, x_3, x_4$ soggette ai vincoli seguenti:
 $$x1 = x2;\  x2 = x3;\  x3 = x4;\  x1 ≠ x4$$
 risulta che in questo caso i vincoli non sono soddisfacibili. Descrivere a parole un algoritmo efficiente che, dati in input il numero n di variabili e le liste dei vincoli di uguaglianza e disuguaglianza, restituisce true se e solo se i vincoli sono soddisfacibili.
Si costruisce una struttura merge find con $n$ elementi che rappresentano le variabili. Per ogni vincolo di uguaglianza si fa la merge delle variabili corrispondenti. Poi si verifica che i vincoli di disuguaglianza siano tra le variabili in componenti diverse. La complessità è $O(n\log n)$

5. Si consideri un array` A[1..n]` contenente valori reali ordinati in senso non decrescente/crescente; l'array può contenere valori duplicati. Scrivere un algoritmo ricorsivo di tipo divide-et-impera che, dato `A` e due valori reali `low` ed `up` (`low < up`), calcola quanti valori di `A` appartengono all'intervallo `[low, up]`. Determinare il costo computazionale dell'algoritmo proposto.

```java
int conta(int A[1,...,n], int low, int up, int i, int j){
	if(i>j) return 0
	else if(A[i]>up || A[j]<low) return 0
	else if(i=j) return 1
	else{
		int m = floor((i+j)/2)
		return conta(A,low,up,i,m) + conta(A, low, up, m+1,j)
	}
}
```
Ha costo $T(n)=O()$