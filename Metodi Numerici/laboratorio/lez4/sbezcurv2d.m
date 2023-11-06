%script di esempio per curva 2d di Bezier
clear all
close all

open_figure(1);
axis_plot(12,1);

%carica file .db con definizione curva di bezier
bezP = curv2_bezier_load('c2_bezier.db');
bezP.ab=[0,1]; % cambiando l'intervallo la curva rimane la stessa, ma cambiano
% i vettori rangenti ai punti

%disegna curva di bezier
np = 150;
curv2_bezier_plot(bezP,np,'b');

%disegna poligonale di controllo
point_plot(bezP.cp,'r-o',2,'k','r',8)
