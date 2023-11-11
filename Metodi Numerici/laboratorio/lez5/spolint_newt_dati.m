% script spolint_newt_dati.m
% Interpolante polinomiale di un set di dati: forma di Newton;
% viene prodotto il grafico del data set e del polinomio interpolante
clear all
close all

A=load('dataset1.dat');
[n m]=size(A); % n = numero punti
x=A(1:n,1)';
y=A(1:n,2)';

%definire il grado del polinomio interpolante
grado = n-1; % grado = numero di punti -1

%definire gli estremi dell'intervallo di interpolazione
a = min(x);
b = max(x);

%Metodo di interpolazione: forma di Newton
%calcolo della matrice N del sistema lineare (vedi function newton.m)
N=newton(grado,x,x); % si scelgono x punti tanti quanti il grado

%i coeff. del polinomio sono la soluzione del sistema lineare risolto
%con il metodo delle sostituzioni in avanti (vedi function lsolve.m);
c=lsolve(N,y); % N = matrice termini noti, c = coefficenti

%punti su cui valutare l'interpolante polinomiale per il grafico
xv=linspace(a,b,100);

%valutazione polinomio interpolante mediante Horner (vedi function newtval.m)
yv= newtval(c,x,xv);

%grafico dati (x,y) e valori polinomio interpolante (xv,yv)
figure(1)
plot(x,y,'ko','LineWidth',1.5);
hold on;
plot(xv,yv,'r-','LineWidth',2);
