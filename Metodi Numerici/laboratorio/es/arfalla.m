%main di esempio di interpolazione di punti 2D con curve di Bezier
clear all
%close all

col=['r','g','b','k'];
open_figure(1);
set(gca,'color',[0.8,1.0,0.8]);

%1)INTERPOLAZIONE DEI PUNTI
%set di punti di interpolazione 1^ curva
Q1=[219.68,382.63;
    206.98,423.48;
    209.99,469.54;
    285.8,538.78;
    345.57,491.58;
    355.03,437.12
    348.71,403.68];

%set di punti di interpolazione 2^ curva
Q2=[348.71,403.68;
    388.72,414.19;
    443.04,412.25;
    496.19,389.18;
    534,324.53;
    497.03,249.81;
    433.54,221.33;
    365.08,222.53;
    321.37,240.93];

%intervallo parametrico di definizione
a=0;
b=1;

%numero punti di plotting
np=60;
%disegno punti di interpolazione
%point_plot(Q1,'ko',1,'k');
%point_plot(Q2,'ko',1,'k');

%scelta dei parametri per i punti di interpolazione (param = 0, 1 o 2)
param=2;

%2) OTTENGO LA CURVA INTERPOLATA
%chiamata funzione curv2_bezier_interp per interpolazione punti
bP1=curv2_bezier_interp(Q1,a,b,param);
bP2=curv2_bezier_interp(Q2,a,b,param);

% %disegno curva interpolante e eventualmente i suoi punti di controllo
%curv2_bezier_plot(bP1,np,'c-',2);
%point_plot(bP1.cp,'bo-')
%curv2_bezier_plot(bP2,np,'k-',2);
%point_plot(bP2.cp,'bo-')

%3) PORTO LE CURVE ALLO STESSO GRADO
% se le due curve hanno grado differente dobbiamo
% uniformare i gradi per unirle in una Bézier a tratti
% la curva bp1 ha 2 gradi in meno di bp2
[bP3.cp(:,1),bP3.cp(:,2)]=gc_pol_de2d(bP1.deg,bP1.cp(:,1),bP1.cp(:,2));
bP3.deg=bP1.deg+1;
bP3.ab=bP1.ab;

[bP4.cp(:,1),bP4.cp(:,2)]=gc_pol_de2d(bP3.deg,bP3.cp(:,1),bP3.cp(:,2));
bP4.deg=bP3.deg+1;
bP4.ab=bP3.ab;
%curv2_bezier_plot(bP4,np,'m-',2);

%4) JOIN DI DUE CURVE DI BEZIER
ppbP=join(bP4,bP2);


%disegno la curva ottenuta dal join e eventualmente i suoi punti di
%controllo
%curv2_ppbezier_plot(ppbP,np,'r-');
% point_plot(ppbP.cp,'bo-')


%5) GENERO LA CURVA SIMMETRICA
%generiamo parte simmetrica ruotando la curva in modo che
%l'asse di simmetria sia l'asse delle x e la simmetrica sia
%banalmente quella con le ordinate dei CP cambiati di segno
[ppbQ,T,R]=align_curve(ppbP);
M = R*T;
Minv = inv(M);
ppbQ.cp(:,2)=-ppbQ.cp(:,2);
ppbQ.cp=point_trans(ppbQ.cp,Minv);
%curv2_ppbezier_plot(ppbQ,np,'b-');
% point_plot(ppbQ.cp(1,:),'bo-')

%6) JOIN DI DUE CURVE DI BEZIER A TRATTI
%join di due curve di Bézier a tratti
ppbR=ppbezier_join(ppbP,ppbQ);
xy=curv2_ppbezier_plot(ppbR,-np,'b-');
% point_plot(ppbR.cp(1,:),'bo-')
fill(xy(:,1),xy(:,2),'r');

%7) DEFINISCO LA CURVA DI UN'ANTENNA
%ora definiamo una delle antenne direttamente come
%punti di controllo di una lineare a tratti
bpS.deg=1;
bpS.ab=[0,1,2];
bpS.cp=[321.37,240.93;
    449.76,143.18;
    445.58,132.76;
    321.37,240.93;];
xy=curv2_ppbezier_plot(bpS,2,'k-',2);
% point_plot(bpS.cp(1,:),'bo-')
fill(xy(:,1),xy(:,2),'y');
% curv2_ppbezier_plot(bpS,2,'k-',2);


%8) OTTENGO LA SECONDA ANTENNA RUOTANDO RISPETTO AL PRIMO PUNTO DI
%CONTROLLO LA PRIMA ANTENNA
C=[321,241];
T=get_mat_trasl(-C);
alfa=-0.4;
R=get_mat2_rot(alfa);
Tinv=get_mat_trasl(C);
M=Tinv*R*T;
bpT.deg = bpS.deg;
bpT.ab = bpS.ab;
bpT.cp=point_trans(bpS.cp,M);
xy=curv2_ppbezier_plot(bpT,2,'k-',2);
% point_plot(ppbT.cp(1,:),'bo-')
fill(xy(:,1),xy(:,2),'y');
% curv2_ppbezier_plot(bpT,3,'k-',2);


function [ppbezQ,T,R]=align_curve(ppbezP)
ncp=length(ppbezP.cp(:,1));
ppbezQ=ppbezP;
T=get_mat_trasl(-ppbezP.cp(1,:));
alfa = -atan2(ppbezP.cp(ncp,2) - ppbezP.cp(1,2), ppbezP.cp(ncp,1) - ppbezP.cp(1,1));
R=get_mat2_rot(alfa);
M=R*T;
ppbezQ.cp=point_trans(ppbezP.cp,M);
end

%function che determina la curva di Bézier a tratti
%che connette due curve di Bézier semplici
function ppbez=join(p1,p2)
ppbez=[];
if (p1.deg == p2.deg)
    tol=1.0e-2;
    ppbez=p1;
    n1=length(p1.ab);
    n2=length(p2.ab);
    ncp1=length(p1.cp(:,1));
    ncp2=length(p2.cp(:,1));
    if (norm(p1.cp(ncp1,:) - p2.cp(1,:),2) <= tol)
        %caso in cui le due curve da connettere sono orientate
        %nello stesso senso
        ppbez.ab=[p1.ab,p1.ab(n1)+p2.ab(2:n2)-p2.ab(1:n2-1)];
        ppbez.cp=[p1.cp;p2.cp(2:ncp2,:)];
    elseif (norm(p1.cp(ncp1,:)-p2.cp(ncp2,:),2) <= tol)
        %caso in cui le due curve da connettere sono orientate
        %in senso opposto
        ppbez.ab=[p1.ab,p1.ab(n1)+flip(p2.ab(2:n2)-p2.ab(1:n2-1))];
        ppbez.cp=[p1.cp;flip(p2.cp(1:ncp2-1,:))];
    else
        fprintf('Le curve sono disgiunte\n');
        ppbez=[];
    end
else
    fprintf('Le curve non hanno stesso grado\n');
    ppbez=[];
end
end

function ppbez = ppbezier_join(pp1, pp2)
% Inverti l'ordine dei parametri di base e dei punti di controllo di pp2
pp2.ab = flip(pp2.ab);
pp2.cp = flip(pp2.cp);
% Calcola il nuovo vettore dei parametri di base per la curva combinata
ab_combined = [pp1.ab, pp2.ab(2:end) + pp1.ab(end) - pp2.ab(1)];

% Calcola i nuovi punti di controllo per la curva combinata
cp_combined = [pp1.cp; pp2.cp(2:end, :)];

% Costruisci la curva combinata
ppbez.deg = pp1.deg;
ppbez.ab = ab_combined;
ppbez.cp = cp_combined;
end


