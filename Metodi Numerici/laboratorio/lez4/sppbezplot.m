%main di esempio per visualizzazione curva di Bezier a tratti
clear all
close all

col=['r','g','b','k','m','c','y','r','g','b','k','m','c','y'];
open_figure(2);
axis_plot(1,0.125);
ppP=curv2_ppbezier_load('c2_ppbez_esse.db');
curv2_ppbezier_plot(ppP,100,'k-');


%for i = 1:8
%    [sx, dx] = decast_subdiv(ppP, 0.5);
%    curv2_ppbezier_plot(sx, 100, col(i));
%    ppP=dx;
%end

%cerca: suddividere curva di bezier a tratti
somma = 4;
righe = 1;
bezP.deg = ppP.deg;

for i= 1:8
    bezP.ab = [ppP.ab(i),ppP.ab(i+1)]; % intervallo i-esima curva
    bezP.cp = [ppP.cp(righe:somma,1),ppP.cp(righe:somma,2)]; % punti di controllo i-esima curva
    righe = righe+3;
    somma = somma+3;
    curv2_bezier_plot(bezP,40,col(i),1);
end
