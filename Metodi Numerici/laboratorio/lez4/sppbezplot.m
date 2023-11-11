%main di esempio per visualizzazione curva di Bezier a tratti
clear all
close all

col=['r','g','b','k','m','c','y','r','g','b','k','m','c','y'];
open_figure(2);
axis_plot(1,0.125);

ppP=curv2_ppbezier_load('c2_ppbez_esse.db');
% disegna la curva a tratti e la poligonale
curv2_ppbezier_plot(ppP,40,'b',2);
%point_plot(ppP.cp,'r-o',1.5);
punti= ppP.cp;
%disegna i tratti della curva e negli estremi dei tratti la tangente
% TO DO
disp(ppP.deg) 
disp(ppP.ab) %8 tratti
disp(ppP.cp) %punti di controllo  = 8*3+1=25