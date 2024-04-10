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
 