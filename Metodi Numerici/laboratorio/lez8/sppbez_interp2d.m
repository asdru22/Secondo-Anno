%main di esempio di interpolazione di punti 2D con curve di Bezier
clear all
close all

col=['r','g','b','k'];
open_figure(2);
set(gca,'color',[0.8,1.0,0.8]);

%set di punti di interpolazione 1^ curva
Q1 = [312 240; 489 244; 524 356; 349 404];

%set di punti di interpolazione 2^ curva
Q2 = [349 404; 273 538; 217 385];

%intervallo parametrico di definizione
a=0; 
b=1;

%numero punti di plotting
np=60;
%disegno punti di interpolazione
point_plot(Q1,'ko',1,'k');
point_plot(Q2,'ko',1,'k');

%scelta dei parametri per i punti di interpolazione (param = 0, 1 o 2)
param=1;
%chiamata funzione curv2_bezier_interp per interpolazione punti 
%con curva di Bézier della libreria anmglib_4.0
%utilizzare l'help per info sui parametri di input
bP1=curv2_bezier_interp(Q1,a,b,param);
bP2=curv2_bezier_interp(Q2,a,b,param);

% %disegno curva interpolante
curv2_bezier_plot(bP1,np,'r-');
point_plot(bP1.cp,'bo-')
curv2_bezier_plot(bP2,np,'r-');
point_plot(bP2.cp,'bo-')

% se le due curve hanno grado differente dobbiamo 
% uniformare i gradi per unirle in una Bézier a tratti
[bP3.cp(:,1),bP3.cp(:,2)]=gc_pol_de2d(bP2.deg,bP2.cp(:,1),bP2.cp(:,2));
bP3.deg=bP2.deg+1;
bP3.ab=bP2.ab;

%join di due curve di Bézier
ppbP=join(bP1,bP3);
curv2_ppbezier_plot(ppbP,np,'r-');
point_plot(ppbP.cp,'bo-')

%generiamo parte simmetrica ruotando la curva in modo che
%l'asse di simmetria sia l'asse delle x e la simmetrica sia
%banalmente quella con le ordinate dei CP cambiati di segno

ppbQ = align_curve(ppbP);
curv2_ppbezier_plot(ppbQ,np,'b-');
point_plot(ppbQ.cp(1,:),'bo-')

%join di due curve di Bézier a tratti
ppbR=ppbezier_join(ppbP,ppbQ);
xy=curv2_ppbezier_plot(ppbR,np,'b-');
point_plot(ppbR.cp(1,:),'bo-')
fill(xy(:,1),xy(:,2),'r');

%ora definiamo una delle antenne direttamente come
%punti di controllo di una lineare a tratti
bpS.deg=1;
bpS.ab=[0,1,2];
bpS.cp=[];
xy=curv2_ppbezier_plot(bpS,2,'k-',2);
point_plot(bpS.cp(1,:),'bo-')
fill(xy(:,1),xy(:,2),'y');
curv2_ppbezier_plot(bpS,2,'k-',2);

%ruotiamo la curva intorno al primo punto di controllo
%
C=[321,241];
T=get_mat_trasl(-C);
alfa=-0.4;
R=get_mat2_rot(alfa);
Tinv=get_mat_trasl(C);
M=Tinv*R*T;
bPT.cp=point_trans(bpS.cp,M);
xy=curv2_ppbezier_plot(bpT,2,'k-',2);
% point_plot(ppbT.cp(1,:),'bo-')
fill(xy(:,1),xy(:,2),'y');
% curv2_ppbezier_plot(bpT,3,'k-',2);

% cerca: allinea curva all asse x
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

%function che determina la curva di Bézier a tratti
%che connette due curve di Bézier a tratti
function ppbez=ppbezier_join(pp1,pp2)

ppbez.ab=[0,1];
point = (pp1.cp(end,:)+pp2.cp(1,:))/2;
cp = [pp1.cp;point;pp2.cp]
ppbez.deg = size(cp)-1;
ppbez.cp = cp;
end