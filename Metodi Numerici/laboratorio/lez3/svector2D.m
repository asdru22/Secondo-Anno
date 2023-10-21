%script svector2D.m per il disegno di vettori nel piano
clear all
close all

%definiamo semplici punti e vettori 2D
O=[0,0];
X=[1,0];
Y=[0,1];
P=[0,0.5];
Q=[-1,0.0];
v1=[1,0.5];
v2=[-0.5,1];
v3=[0.5,-1];
afs=0.2;

%apriamo la figure 1
open_figure(1);
%disegniamo gli assi
axis_plot(1,0.25);
%titolo della figure
title('esempio 2D');
% %disegniamo gli assi
% vect2_plot(O,X,'r',1,'k','k',6,afs);
% vect2_plot(O,Y,'g',1,'k','k',6,afs);

%disegniamo alcuni punti
point_plot(P+[0.5,0],'bh',1,'b','r',20);
point_plot(P-[0.5,0],'bd',1,'b','r',20);
point_plot(P+[0,0.75],'bo',1,'b','r',20);
point_plot(P-[0,0.5],'bo',1,'b','r',20);

%disegniamo alcuni vettori applicati sul punto P
vect2_plot(P,v1,'k',1,'k','k',6,afs);
vect2_plot(P,v2,'y',1,'k','k',6,afs);
vect2_plot(P,v3,'b',1,'k','k',6,afs);

%disegnamo il segmento di estremi P e Q
line_plot(P,Q-P,0,1,'r-o',2);

