%zeri di polinomi nella base di Bernstein
clear all
close all

%definizione funzione polinomiale zfun05 nella base di Bernstein
%struttura fBezier
a=-2.5; b=2;
fb.deg=3;
fb.ab=[a,b];
fb.cp=[-6.125; 17.5; -9.5; 4];

% numero di punti di valutazione in [a,b]
np = 100;
x = linspace(a,b,np);
yB=decast_val(fb,x);
figure('Name','Funzione polinomiale test')
hold on;
plot(x,yB,'-','Color','g','LineWidth',1.5)
plot([a,b],[0,0],'k-')
title('Polinomio test','FontWeight','bold')

%definire la funzione come curva e disegna 
%i punti di controllo
cb.deg=3;
cb.ab=[a,b];
xi = linspace(a,b,cb.deg+1);
cb.cp=[xi',fb.cp];
point_plot(cb.cp,'b-');

[bez_sx,bez_dx]=decast_subdiv(cb,(a+b)/2);
point_plot(bez_sx.cp,'r-');
point_plot(bez_dx.cp,'k-');


fprintf('Lista delle radici trovate nell''intervallo:\n');
%determina, stampa e disegna gli zeri della funzione
TOL=1.0e-7;
rootsx = lane_riesenfeld(fb,10^-15);
disp(rootsx);
plot(rootsx,zeros(1,length(rootsx)),'r+');
