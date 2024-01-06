%main di esempio per visualizzazione curva di Bezier a tratti
clear all
close all
col=['r','g','b','k','m','c','y','r','g','b','k','m','c','y'];
open_figure(2);
axis_plot(1.25,0.125);

%curva da file
ppP=curv2_ppbezier_load('ppbez_corona.db');
curv2_ppbezier_plot(ppP,40,'b',2);
point_plot(ppP.cp,'k-o',1);

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

fprintf('area della curva: %e\n',tot);

function val = cxc1_val(bezier,t)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calcola il valore della funzione C(t)xC'(t) con C(t) curva di 
%Bezier 2D definita in [0,1]
%bezier --> struttura di una curva di Bezier:
%          bezier.deg --> grado della curva
%          bezier.cp  --> lista dei punti di controllo (bezier.deg+1)x2
%          bezier.ab  --> intervallo di definizione
%x --> valore/i parametrici in cui valutare
%val <-- valore/i della funzione C(t)xC'(t) in corrispondenza di t
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Pt=decast_valder(bezier,1,t);

val=sqrt((Pt(1,:,1).^2+Pt(2,:,2).^2)-(Pt(2,:,1).^2+Pt(1,:,2).^2));

end