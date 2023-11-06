%script di esempio per curva 2d di Bezier
clear all
close all
open_figure(1);
axis_plot(13,1);
%carica file .db con definizione curva di bezier
bezP = curv2_bezier_load('c2_bezier.db');

curv2_bezier_plot(bezP,40,'b.',2,'b');

%disegna poligonale di controllo
point_plot(bezP.cp,'r-o',1,'k','r',8);

%numero di punti di disegno
np=5;

%disegna vettori tangenti della curva
curv2_bezier_tan_plot(bezP,np,'b-',2);


