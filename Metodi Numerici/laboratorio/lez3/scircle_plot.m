%script scircle_plot.m
%genera il disegno di una circonferenza di centro l'rigine e raggio 5 
%e di 12 circonferenze tra di loro adiacenti con centri sulla prima

close all
%apre figure
open_figure(1);
%disegna assi
axis_plot(8,1.2);
%disegna circonferenza di raggio 5 e centro l'origine
circle2_plot([0,0],5,100,'b');
%disegna 12 circonferenze
n = 12;

alpha = linspace(0, 2*pi, n);
cx = 5* cos(alpha);
cy = 5* sin(alpha);
for i = 1:n
    circle2_plot([cx(i),cy(i)],1.4,100,'r');
end
