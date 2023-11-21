%main di esempio per visualizzazione curva di Bezier a tratti
clear all
close all
col=['r','g','b','k','m','c','y','r','g','b','k','m','c','y'];
open_figure(2);
axis_plot(2.25,0.125);

%curva da file
ppP=curv2_ppbezier_load('ppbez_corona.db');
%disegno curva a tratti

n=ppP.deg;
[ncp,~]=size(ppP.cp);
np=(ncp-1)/n;

%estrae le singole curve di Bezier e calcola la loro lunghezza

% TO DO

fprintf('Lunghezza della curva: %e\n',val);

%scaliamo ora la curva affinché abbia lunghezza unitaria
%la scala sia effettuata rispetto al baricentro
s=1/val;

% TO DO

ppP.cp=point_trans(ppP.cp,M);

%calcolare nuovamente la lunghezza della curva scalata
%estrae le singole curve di Bezier e calcola la loro lunghezza

% TO DO

fprintf('Lunghezza della curva: %e\n',val);

