% script spolint_bern_dati.m
% Interpolante polinomiale di un set di dati: forma di Newton;
% viene prodotto il grafico del data set e del polinomio interpolante
clear all
close all

A=load('dataset1.dat');
[n m]=size(A);
x=A(1:n,1)';
y=A(1:n,2)';

%definire il grado del polinomio interpolante
grado = n-1;

%definire gli estremi dell'intervallo di interpolazione
a = min(x);
b = max(x);

%Metodo di interpolazione: forma di Bernstein
%cambio di variabile e calcolo della matrice B del sistema lineare
t=(x-a)./(b-a);
B = bernst(grado,t);

%i coeff. del polinomio sono la soluzione del sistema lineare
%utilizziamo l'operatore left division di Matlab
c=B\y'; % c= soluzione del polinomio nella base di berstein
%definiamo un polinomio nella base di Bernstein secondo la anmglib_4.0
bern.deg=grado;
bern.cp=c; % punti di controllo
bern.ab=[a,b];
% cerca: interpolazione di dati
%punti su cui valutare l'interpolante polinomiale per il grafico
xv=linspace(a,b,100); 
tv=(xv-a)./(b-a); % si porta xv nell'intervallo [0,1] (Ma non serve???)
%valutazione polinomio interpolante mediante Horner (vedi function decast_val.m)
yv=decast_val(bern,xv); % si plotta correttamente con xv e non tv


%grafico dati (x,y) e valori polinomio interpolante (xv,yv)
figure(1)
plot(x,y,'ko','LineWidth',1.5);
hold on;
plot(xv,yv,'r-','LineWidth',2);
