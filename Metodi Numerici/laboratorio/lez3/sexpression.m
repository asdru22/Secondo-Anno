% script sexpression.m
%***************************************************
% si vuole valutare l'espressione ((1+x)-1)/x
% con x numero finito e valutare l'E_ALG;
% utilizzare il programma conv_dec2bin.m per
% determinare se i valori x utilizzati hanno una 
% rappresentazione esatta in base 2 a 53 cifre
%***************************************************
%assegna un valore alla x
x=0.3;

%calcolo espressione 
y=((1+x)-1)/x;

fprintf(' x                      y\n');
fprintf('%22.15e %22.15e\n\n',x,y);
fprintf('ErrAlg = %22.15e\n',abs((y-1))/1);
if (y==1.0)
  fprintf('calcolo esatto\n');
else
  fprintf('calcolo errato\n');
end
