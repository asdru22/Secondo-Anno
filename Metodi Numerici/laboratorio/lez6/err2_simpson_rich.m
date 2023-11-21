function err2_trapezi_rich(funz,a,b)
% Funzione che approssima l'integrale definito di una
% funzione mediante la formula dei trapezi composta e
% calcola l'errore.
% funz --> stringa contenente della funzione integranda
% a,b --> estremi di integrazione
% n    --> numero di sottointervalli
% Viene prodotta una stampa

  if ischar(funz)
    fun=str2func(funz);
  else
    fun=funz;
  end
  I=integral(fun,a,b);
  fprintf('valore I= %22.15e\n',I);
  fprintf('n     h             IA               AbsErr\n');
  for i = 1:11
    n=2^(i-1);
    h=(b-a)/n;
    IA=trapezi_comp(fun,a,b,n,0);

    AbsErr(i)=abs(IA-I);
    if(i>1)
    ER(i) = (4*trapezi_comp(fun,a,b,n-1,0)-trapezi_comp(fun,a,b,n,0))/3;
    end
    fprintf('%d %9.3e %22.15e %9.3e ',n,h,IA,AbsErr(i));
    % IA = integrale approssimato 
    if(i>1)
        fprintf('%9.3e\n',ER(i-1)/ER(i)) % <-------------------------------
        fprintf('%9.3e\n',AbsErr(i-1)/AbsErr(i))
         
    else
      fprintf('\n')
    end
  end
    dfun2=str2func('d2_effe3');
    fplot(dfun2,[a,b],'g-');