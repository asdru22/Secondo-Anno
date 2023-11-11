function yy=lagrval1(y,x,xx)
% valutazione di un polinomio nella prima forma di Lagrange
% y --> vettore dei coefficienti
% x --> vettore dei punti in base ai quali restano determinati
%       i polinomi elementari di Lagrange
% xx --> vettore di ascisse in corrispondenza delle quali 
%        si vuole valutare il polinomio
% flag --> 2.punti di Chebyshev prima specie
%          3.punti di Chebyshev seconda specie
%          1.punti equispaziati od altro
% yy <-- vettore dei valori del polinomio        
n=length(x);
den(1)=prod(x(1)-x(2:n));
for i=2:n-1
   den(i)=prod(x(i)-x(1:i-1))*prod(x(i)-x(i+1:n)); 
end
den(n)=prod(x(n)-x(1:n-1));
m=length(xx);
for i=1:m
  [c,k]=min(abs(xx(i)-x));
  if (c < 1.0e-7)
    yy(i)=y(k);
  else
    elle=prod(xx(i)-x);
    num=den.*(xx(i)-x);
    yy(i)=elle*sum(y./num);
  end
end
