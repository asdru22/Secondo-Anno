%script che richiama def_pol e valuta i polinomi con Alg.1
clear all
close all

ex=2;
% cP= coefficenti base canonica, cB= coefficenti base di bernstein
[g,cP,cB]=def_pol(ex);

% numero dei punti di valutazione in [0,1]
np = 100;
t = linspace(0,1,np)'; % 100 punti equispaziati da 0 a 1

% valutazione polinomio nella base monomiale (polyval di MATLAB)
yP = polyval(fliplr(cP),t);

% valutazione polinomio nella base di Bernstein
% funzione bernst del toolbox anmglib_4.0
% Alg.1

%TO DO
% g  --> grado
% x  --> punti in [0,1] in cui valutare
% bs <-- matrice delle funzioni di Bernstein nei punti

B = bernst(g,t); % B= matrice delle funzioni di Bernstein nei punti
% matrice di 100 righe e 11 colonne
yB = B*cB';
% Base di bernstein * la trasposta del vettore coefficenti in base di berstein 

figure('Name','Polinomio test')
plot(t,yB,'-','Color','g','LineWidth',1.5)
title('Polinomio test','FontWeight','bold')

hold on
plot(t,yP,'--','Color','r','LineWidth',1.5)
legend('p_P(x)','p_B(x)')