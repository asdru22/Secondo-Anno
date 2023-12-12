%script di esempio per curva 2d di Bezier
clear all
close all

open_figure(1);
axis_plot(13,1);

%carica file .db con definizione curva di bezier
bezP = curv2_bezier_load('c2_bezier.db');
curv2_bezier_plot(bezP,40,'b-',2,'b');
%disegna poligonale di controllo
point_plot(bezP.cp,'r-o',1,'k','r',8);

% cerca: aumenta grado curva di bezier
[bezQ.cp(:,1),bezQ.cp(:,2)]=gc_pol_de2d(bezP.deg,bezP.cp(:,1),bezP.cp(:,2));
bezQ.deg=bezP.deg+1;
bezQ.ab=bezP.ab;

%disegnare curva con grado elevato
curv2_bezier_comb_plot(bezP,40,'g');

%disegna punti di controllo della curva con grado elevato
point_plot(bezQ.cp,'g-o',1,'k','r',8);
