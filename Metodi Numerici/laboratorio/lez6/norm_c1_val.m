function val = norm_c1_val(bezier,t)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calcola il valore della funzione ||C'(t)|| con C(t) curva di Bezier 2D
%bezier --> struttura di una curva di Bezier:
%           bezier.deg --> grado della curva
%           bezier.cp  --> lista dei punti di controllo (bezier.deg+1)x2
%           bezier.ab  --> intervallo di definizione
%t --> valore/i parametrici in cui valutare
%val <-- valore/i della funzione ||C'(t)|| in corrispondenza di t
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Pt=decast_valder(bezier,1,t);

val=sqrt(Pt(2,:,1).^2+Pt(2,:,2).^2);

end