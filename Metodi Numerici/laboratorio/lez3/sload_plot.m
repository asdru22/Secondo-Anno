%script sload_plot.m per caricare file di punti e disegnarli
close all

figure('Position', [10 10 700 600])
open_figure(1);
axis_plot(1,0.1)

%legge i punti di un disegno da file
%...
s = load('paperino.txt');
%disegna i punti
%...
point_plot(s,'-o',1.5,'r')
