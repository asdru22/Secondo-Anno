%script di esempio per suddividere una curva di Bezier
clear all
close all

open_figure(1);
axis_plot(2,0.25);

%definire o leggere una curva di Bezier
%lista punti di controllo
bezP.cp=[1.8 , 0.4;
         1.6 , 1.2;
         1.0 , 1.5;
         0.0 , 0.8];

%grado della curva
[ncp,~]=size(bezP.cp);
bezP.deg=ncp-1;
%intervallo parametrico
bezP.ab=[0 6];

%disegna la curva in blu
curv2_bezier_plot(bezP,40,'b-',1,'b');

%disegna la poligonale di controllo in blu
% point_plot(bezP.cp,'b-o',1,'k','b',8);

%suddivide la curva in tbar
% cerca: suddividere curva di bezier
tbar=0.5*(bezP.ab(1)+bezP.ab(2));
[bezP1,bezP2]=decast_subdiv(bezP,tbar);

%disegna la poligonale di controllo di P1 in rosso
curv2_bezier_plot(bezP1,100,'r');
point_plot(bezP1.cp,'r-o');
%curv2_bezier_tan_plot(bezP1,4,'b-',2);

%disegna la poligonale di controllo di P2 in verde
curv2_bezier_plot(bezP2,100,'g');
point_plot(bezP2.cp,'g-o');
%curv2_bezier_tan_plot(bezP2,4,'b-',2);
