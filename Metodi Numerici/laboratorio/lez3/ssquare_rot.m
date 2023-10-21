%script ssquare_rot.m
clear all
close all
%definisce vettore colori
col=['r','g','b','m','y','c','k'];
%apre figure
open_figure(1);
%disegna gli assi
axis_plot(3,0.25);
%definisce QUADRATO
P=[0,0; 2,0; 2,2; 0,2; 0,0];
% P=[0,0; 4,0; 4,2; 0,2; 0,0];
point_plot(P,'k-o',2,'k');

% TO DO
%calcola il baricentro
%...
%definisce matrice di traslazione
%...
%definisce angolo alpha di rotazione
%alfa=...;
%definisce matrice di rotazione usando la get_mat2_rot
%...
%definisce matrice composta di rotazione rispetto al baricentro
%...

for i=1:4
    P=point_trans(P,M);
    point_plot(P,[col(i),'-o'],2,col(i));
end