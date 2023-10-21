%Function fidiff.m
%****************************************************
%approssimazione della derivata della funzione exp(x) (e^x, con x in input)
%mediante rapporto incrementale al diminuire di h
%****************************************************
function fidiff(x)
if nargin<1 % numero di argomenti di input della funzione
    x=1; 
end
fp = exp(x); % valore esatto della derivata

n=15; % numero iterazion
h = logspace(-(n-1),0,n)'; % vettore colonna dei passi, logspace = linspace ma logaritmico
fprintf(' h            fp           fpfd     AErr      RErr\n');
for k=n:-1:1 % per k che cva da n a 1 con passo -1
  fpfd = (exp(x+h(k)) - exp(x))/h(k); % rapporto incrementale (approssimazione della derivata ottenuta iterativamente)
  fprintf('%e %e\n',exp(x+h(k)),exp(x)) % x+elemento pos k di h
  AErr(k) = abs(fpfd - fp); % errore assoluto tra rapporto appena calcolato e il valore della derivata vera
  RErr(k) = abs((fpfd - fp)/fp); % errore relativo
  fprintf('%8.1e %12.5f %12.5f %9.2e %9.2e\n',h(k),fp,fpfd,AErr(k),RErr(k));
end

%grafico del Relative Error in scala logaritmica
loglog(h,RErr,'o-','LineWidth',1.5); 
xlabel('Stepsize h'); 
ylabel('Relative error');

% ad un certo punto, più h tende a 0, più aumenta l'errore relativo. Questo
% perchè facendo f(x)-f(x) c'è un errore di cancellazione. Vengono anche
% amplificati gli errori sui dati (approssimati)
