function tot = ppbez_int(ppP)
%estrae le singole curve di Bezier e calcola la loro area
somma = ppP.deg+1;
righe = 1;
tot = 0;
bezP.deg = ppP.deg;
for i= 1:length(ppP.ab)-1
    bezP.ab = [ppP.ab(i),ppP.ab(i+1)];
    bezP.cp = [ppP.cp(righe:somma,1),ppP.cp(righe:somma,2)];
    righe = righe+ppP.deg;
    somma = somma+ppP.deg;

    %calcolo l'area della curva 
    val(i)=integral(@(x)cxc1_val(bezP,x),bezP.ab(1),bezP.ab(2));
    
    if (val(i) < 0)
     bezP.cp=flip(bezP.cp);
     val(i)=-val(i);
    end
    tot = tot + val(i);
end
end

