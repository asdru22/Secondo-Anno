%main di esempio di interpolazione di punti 2D con curve di Bezier
clear all
close all

col=['r','g','b','k'];
open_figure(1);
axis_plot(3,0.25);

%set di punti di interpolazione
Q=[0,2; 1,1; 2,1; 3,2];
% Q=[0,0; 1,1; 2,2; 3,3];
% Q=[0,2; 1,1; 2,2; 3,1];
% Q=[1,2; 1.8,2; 2,2; 1.8,1.8; 1.2,1.2; 1,1; 1.2,1; 2,1];

%grado della curva interpolante
deg=length(Q)-1;

%intervallo parametrico di definizione
a = 0;
b = 1;
% l'intevallo di definizione è 
%numero punti di plotting
np = 100; 
%disegno punti di interpolazione
point_plot(Q,'ko',1,'k');

%scelta dei parametri per i punti di interpolazione (param = 0, 1 o 2)
param = 2;
%0->partizione uniforme (punti divisi uniformemente),
% 1->centripeta (varianted della corda),
% 2->parametrizzazione della corda (punti divisi in base ai punti di controllo?)
%chiamata funzione di interpolazione della libreria anmglib_4.0
%utilizzare l'help per info sui parametri di input

%Pbez = curv2_bezier_interp(Q,a,b,param); a e b non influenzano la curva
%disegno curva interpolante
%curv2_bezier_plot(Pbez,np,'b-.');

curv2_bezier_plot(curv2_bezier_interp(Q,a,b,0),np,'r-.');
curv2_bezier_plot(curv2_bezier_interp(Q,a,b,1),np,'g-.');
curv2_bezier_plot(curv2_bezier_interp(Q,a,b,2),np,'b-.');

