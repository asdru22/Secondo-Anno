%script di prova per disegno della cardioide
clear all
close all

figure('Position', [10 10 500 400])
open_figure(1);
axis_plot(2)

a=0;
b=2*pi;
np=150;
[x,y]=curv2_plot('c2_cardioide',a,b,np,'b-');

point_plot([x(1),y(1)],'ro',1,'r','r'); % primo punto
point_plot([x(10),y(10)],'ro',1,'r','r'); % decimo punto

