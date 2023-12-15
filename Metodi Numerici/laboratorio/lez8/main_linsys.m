%main_linsys da completare per risolvere un sistema lineare Ax=b

%si chiama una funzione che definisce una matrice test
A=mat_es_1();

%sia n x m la sua dimensione
[n,m]=size(A);

if (n==m)
    %si determina il vettore dei termini noti
    b=ones(m,1);   

    %1.si risolve il sistema lineare utilizzando l'operatore left division
    xx=A\b;

    %si stampa la soluzione xx
    fprintf(" sol 1: %10.5f\n",xx);

    %2.si fattorizza la matrice A usando la function Matlab lu()
    [L,U,P] = lu(A);

    %si risolvono i due sistemi piu' semplici usando le function 
    %lsolve() e usolve() presenti nella cartella
    % L*y=P*b, U*x=y
    y=lsolve(L,b);
    x=usolve(U,y);
    
    %si stampa la soluzione x del sistema lineare
    fprintf(" sol 2: %10.5f\n",x);
    
end