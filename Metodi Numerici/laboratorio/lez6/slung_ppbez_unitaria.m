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

somma = 3;
righe = 1;
bezP.deg = ppP.deg;
val = 0;
for i= 1:4
    bezP.ab = [ppP.ab(i),ppP.ab(i+1)];
    bezP.cp = [ppP.cp(righe:somma,1),ppP.cp(righe:somma,2)];
    righe = righe+3;
    somma = somma+3;
    val=val + integral(@(x)norm_c1_val(bezP,x),1,0);
    curv2_ppbezier_plot(bezP,100,'r-');
end

fprintf('Lunghezza della curva: %e\n',val);

%scaliamo ora la curva affinché abbia lunghezza unitaria
%la scala sia effettuata rispetto al baricentro
s=1/val;

% TO DO

%ppP.cp=point_trans(ppP.cp,M);

%calcolare nuovamente la lunghezza della curva scalata
%estrae le singole curve di Bezier e calcola la loro lunghezza

% TO DO

fprintf('Lunghezza della curva: %e\n',val);

