%*************************************************
%script sfiniti.m
%Esempio per sperimentare i numeri finiti 
%'gradual underflow' dello standard ANSI/IEEE
%gestisce sia il caso BASIC single che BASIC double
%flag=0 per BASIC single
%flag=1 per BASIC double
%*************************************************

%cambiare il flag
flag=1;

%caso single
if (flag==0)
  n=0;
  x=single(1.0);
  while (x>0) % divido finche il numero è talmente piccolo che viene approssimato a 0
    x=x/2;
    n=n+1;
    fprintf('(2 raised to the power -%d) =  %22.15e \n',n,x);
  end
end

%caso double
if (flag==1)
  n=0;
  x=1.0;
  while (x+1>1) % x+1>1 != x>0 in aritmetica finita
    x=x/2;
    n=n+1;
    fprintf('(2 raised to the power -%d) =  %22.15e \n',n,x);
  end
end