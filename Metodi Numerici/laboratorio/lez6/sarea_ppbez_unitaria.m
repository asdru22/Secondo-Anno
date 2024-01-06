%main di esempio per visualizzazione curva di Bezier a tratti
clear all
close all
col=['r','g','b','k','m','c','y','r','g','b','k','m','c','y'];
open_figure(2);
axis_plot(2.25,0.125);

%curva da file
ppP=curv2_ppbezier_load('ppbez_corona.db');
%disegno della curva a tratti
curv2_ppbezier_plot(ppP,100,'c-')
n=ppP.deg;
[ncp,~]=size(ppP.cp);
np=(ncp-1)/n;

%estrae le singole curve di Bézier

% TO DO

%if (val < 0)
%    ppP.cp=flip(ppP.cp);
%    val=-val;
%end
%fprintf('area della curva: %e\n',val); 

%scaliamo ora la curva affinché abbia area unitaria
%la scala sia effettuata rispetto al baricentro
%s=sqrt(1/val);

ppP.cp = ppP.cp/2;
curv2_ppbezier_plot(ppP,100,'r-')


%ppP.cp=point_trans(ppP.cp,M);

%calcolare nuovamente l'area della curva scalata
%estrae le singole curve di Bezier e calcola la loro lunghezza

% TO DO

%fprintf('area della curva: %e\n',val);

