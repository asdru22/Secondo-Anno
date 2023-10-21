%script ssquare_trans.m
clear all
close all
%definisce vettore colori
col=['r','g','b','m','y','c','k'];
%apre figure
open_figure(1);
%disegna assi
axis_plot(5,0.3);
%definisce QUADRATO
P=[0,0; 2,0; 2,2; 0,2; 0,0];
point_plot(P,'k-o',1,'k');

%definisce l'angolo alpha
alfa=pi/6;
%definisce la matrice di rotazione usando la get_mat2_rot
R=get_mat2_rot(alfa);

for i=1:8
  P=point_trans(P,R);
  
  versore(P(1,:),P(2,:))
  versore(P(2,:),P(3,:))
  versore(P(3,:),P(4,:))
  versore(P(4,:),P(5,:))

  point_plot(P,'r-o',1,'r');
%
%  TO DO

end