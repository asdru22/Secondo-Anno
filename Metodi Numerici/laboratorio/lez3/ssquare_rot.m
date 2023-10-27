%script ssquare_rot.m
close all
%definisce vettore colori
col=['r','g','b','m','y','c','k'];
%apre figure
open_figure(1);
%disegna gli assi
axis_plot(3,0.25);
%definisce QUADRATO
%P=[0,0; 2,0; 1,2; 0,0];
P=[0,0; 2,0; 2,2; 0,2; 0,0];
point_plot(P,'k-o',2,'k');

n = 50;

C = ruota_attorno_punto(P,pi/n);
for i=1:n
    P=point_trans(P,C);
    point_plot(P,[col(mod(i,6)+1),'-o'],2,col(mod(i,6)+1));
end