%minimo, massimo e media di una serie di valori
%es1:
% x=;
%es2:
%x=fix(100.*rand([1,10]));

function[out]=smmm(x)
out = [max(x),min(x),mean(x)];
end