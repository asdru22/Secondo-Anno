%Questo script carica due curva di Bézier e determina le intersezioni
%le curve possono essere anche Bézier a tratti o di altro tipo 
%(vedi curv2_intersect del toolbox anmglib_4.0
clear all
close all
open_figure(1);
axis_plot(1,0.125);

%carica prima curva
ppbez1=curv2_bezier_load('bezcrv_1.db');
%carica seconda curva
ppbez2=curv2_bezier_load('bezcrv_2.db');

%numero punti di disegno
np=40;
%disegna prima curva
curv2_ppbezier_plot(ppbez1,np,'b-',2,'b');
%disegna poligonale di controllo
% point_plot(ppbez1.cp,'r-o',1,'k','r',8);

%disegna seconda curva
curv2_ppbezier_plot(ppbez2,np,'r-',2,'r');
%disegna poligonale di controllo
% point_plot(ppbez2.cp,'k-o',1,'k','k',8);

%chiamata alla function curv2_intersect
[IP1P2,t1,t2]=curv2_intersect(ppbez1,ppbez2);

%disegno e stampa dei punti di intersezione
point_plot(IP1P2','go');
fprintf('x,y %e \n',IP1P2');
fprintf('t1 %e \n',t1);
fprintf('t2 %e \n',t2);






