function p=poly_eval(c,x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function p=poly_eval(c,x)
%Algoritmo di Horner per valutazione polinomio in forma canonica
%Input:
% c : vettore dei coefficienti (da quello di potenza massima
%     a quella minima)
% x : punto o vettore in cui valutare
%Output
% p : valore o vettore valutato in x

%valutazione mediante alg. di Horner
%
%p(x)=c(n+1) + c(n)*x + ... + c(2)*x^(n-2) + c(1)*x^(n-1)
%
%    =c(n+1) + x*(c(n) + ... x*( c(3) + x*( c(2) + x*c(1) ) ) ... )
%                                                     -p-
%                                          ------ p ----
%                                ---------- p -------------
%p=c(1)
%ciclo in k
%  p=c(k) + x * p
%fine ciclo

%1-mediante chiamata alla built-in function Octave/Matlab polyval()
p=polyval(c,x);

%2-mediante implementazione esplicita
%
% p: polinomio valutato
% c: coefficenti polinomio
% x: punto in cui valutare il polinomio

%for i=1:length(x)
%    p(i)=c(1);
%    for k=2:length(c)
%        p(i)=c(k)+x(i)*p(i);
%    end
%end

% più il polinomio si avvicina a 0, più cresce l'errore (cancellazione
% numerica)