% script spolint_bern_fun.m
% Interpolante polinomiale di grado n di una funzione test:
% si utilizza la forma di Bernstein;
% definire la funzione test e settare
% n      : grado del polinomio interpolante
% tipo   : tipo di distribuzione dei punti 1=equispaziati 2=chebyshev
% Viene prodotto il grafico della funzione test, del polinomio 
% interpolante e dei punti di interpolazione
clear all
close all

%definire la funzione test: vedere le funzioni test presenti nella cartella
%funzione test ed estremi intervallo di definizione
% fun = @(x) ...;
% a = ...;
% b = ...;

n=7;
tipo=1;
%setting dei punti di interpolazione
switch (tipo)
    case 1
%n+1 punti equispaziati
%       x = ...;
    case 2
%n+1 punti secondo la distribuzione di chebyshev
%       x = ...;
end

%n+1 osservazioni campionate dalla funzione test
y=fun(x);

%punti su cui valutare l'interpolante polinomiale modo 1
m=51;
xv=linspace(a,b,m*n+1);

% %punti su cui valutare l'interpolante polinomiale modo 2
% in=0;
% for i=1:n
%    xv(in+1:in+m)=linspace(x(i),x(i+1),m);
%    in=in+m-1;
% end

%Metodo di interpolazione: forma di Bernstein
%definiamo struttura polinomio nella base di Bernstein secondo
%l'anmglib_4.0
%...
%...
%...

%cambio di variabile
%...
%valutazione matrice del sistema lineare
%...

%i coeff. sono calcolati risolvendo il sistema (left division di Matlab);
pb.cp=B\y';

%valutazione mediante de Casteljau
%...

%apertura finestra per grafico funzione analitica e interpolante
figure(1);
hold on;

%valori funzione test nei punti di valutazione
yf=f(xv);

%disegno punti di interpolazione
plot(x,y,'ro');

%grafico funzione test
plot(xv,yf,'r-','LineWidth',1.5);

%grafico polinomio interpolante
plot(xv,yp,'g-','LineWidth',1.5);

%grafico errore analitico e stampa errore max in [a,b]
yerr=abs(yf-yp);
figure(2);
hold on
plot(xv,yerr,'g-','LineWidth',1.5);

%grafico errore analitico in scala logaritmica e stampa errore max in [a,b]
figure(3);
semilogy(xv,yerr,'b-','LineWidth',1.5);

%stampa max errore di interpolazione in valore assoluto
fprintf('Errore interpolazione: %22.15e\n',max(yerr));
