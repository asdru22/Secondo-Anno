%main di esempio di interpolazione polinomiale
%con curve di Bezier a tratti
clear all
close all

col=['r','g','b','k'];
open_figure(1);

%legge i punti da interpolare da file .txt
%Q=load('paperino.txt');
Q=load('twitter.txt');

%disegna i punti di interpolazione
point_plot(Q,'k.',1,'k','k',12);

% cerca: interpolazione punti 2d
%chiama funzione per interpolazione a tratti della libreria anmglib_4.0
%utilizzare l'help per info sui parametri di input
param = 0;
a=0;
b=1;
ppP =  curv2_ppbezierCC1_interp(Q,a,b,param);

%disegna curva 2D di Bezier a tratti di interpolazione
curv2_ppbezier_plot(ppP,40,'b-',2);


%disegna poligonale di controllo della curva di Bezier a tratti
point_plot(ppP.cp,'r-o',1,'k','r');
fill(ppP.cp(:,1),ppP.cp(:,2),'r');




