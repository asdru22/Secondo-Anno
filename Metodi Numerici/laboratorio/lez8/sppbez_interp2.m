%main di esempio di interpolazione di punti 2D con curve di Bezier
clear all
close all

 sppbez_draw;

col=['r','g','b','k'];
open_figure(1);
set(gca,'color',[0.8,1.0,0.8]);

%set di punti di interpolazione 1^ curva
Q1 = [219.68 382.63; 206.98 423.48; 208.26 461.6; 285.8 538.78; 352.54 469.76; 349.77 406.98];
%set di punti di interpolazione 2^ curva
Q2 = [349.77 406.98; 422.18 415.15; 509.69 377.42; 531.34 299.46; 489.45 244.19; 406.38 218.38; 321.37 240.93];

%intervallo parametrico di definizione
a=0; 
b=1;

%numero punti di plotting
np=60;
%disegno punti di interpolazione
%point_plot(Q1,'ko',1,'k');
%point_plot(Q2,'ko',1,'k');

%scelta dei parametri per i punti di interpolazione (param = 0, 1 o 2)
param=1;
%chiamata funzione curv2_bezier_interp per interpolazione punti 
%con curva di Bézier della libreria anmglib_4.0
%utilizzare l'help per info sui parametri di input
bP1=curv2_bezier_interp(Q1,a,b,param);
bP2=curv2_bezier_interp(Q2,a,b,param);

% %disegno curva interpolante
%curv2_bezier_plot(bP1,np,'r-');
%  
%curv2_bezier_plot(bP2,np,'r-');
% point_plot(bP2.cp,'bo-')

% se le due curve hanno grado differente dobbiamo 
% uniformare i gradi per unirle in una Bézier a tratti
bP3= aumenta_grado(bP1);

%join di due curve di Bézier
ppbP=join(bP3,bP2);
curv2_ppbezier_plot(ppbP,np,'k-'); %
% point_plot(ppbP.cp,'bo-')

%generiamo parte simmetrica ruotando la curva in modo che
%l'asse di simmetria sia l'asse delle x e la simmetrica sia
%banalmente quella con le ordinate dei CP cambiati di segno

[ppbQ,T,R] = align_curve(ppbP);
M=R*T;
Minv= inv(M);
ppbQ.cp(:,2) = -ppbQ.cp(:,2); 
ppbQ.cp= point_trans(ppbQ.cp,Minv);
curv2_ppbezier_plot(ppbQ,np,'c-'); %
%point_plot(ppbQ.cp(1,:),'bo-')

%join di due curve di Bézier a tratti
ppbR=ppbezier_join(ppbP,ppbQ);
xy=curv2_ppbezier_plot(ppbR,np,'g-');
point_plot(ppbR.cp(1,:),'go-')
fill(xy(:,1),xy(:,2),'b');


%ora definiamo una delle antenne direttamente come
%punti di controllo di una lineare a tratti
bpS.deg=1;
bpS.ab=[0,1,2];
bpS.cp=[321.73 240.93; 449.47 142.86; 444.6 131.81; 321.73  240.93];
%xy=curv2_ppbezier_plot(bpS,2,'k-',2);
%point_plot(bpS.cp,'bo-')
%fill(xy(:,1),xy(:,2),'y');
curv2_ppbezier_plot(bpS,2,'k-',2);

%ruotiamo la curva intorno al primo punto di controllo
%
C=[321,241];
T=get_mat_trasl(-C);
alfa=-0.4;
R=get_mat2_rot(alfa);
Tinv=get_mat_trasl(C);
M=Tinv*R*T;
bPT.ab=[0,1];
bPT.cp=point_trans(bpS.cp,M);
bPT.deg=bpS.deg;
%xy=curv2_ppbezier_plot(bPT,2,'k-',2);
% point_plot(ppbT.cp(1,:),'bo-')
%fill(xy(:,1),xy(:,2),'y');
%curv2_ppbezier_plot(bpT,3,'k-',2);


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

function ppo = aumenta_grado(ppi)
[ppo.cp(:,1),ppo.cp(:,2)]=gc_pol_de2d(ppi.deg,ppi.cp(:,1),ppi.cp(:,2));
ppo.deg=ppi.deg+1;
ppo.ab=ppi.ab;
end

%function che determina la curva di Bézier a tratti
%che connette due curve di Bézier a tratti
function ppbez=ppbezier_join(p1,p2)
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
     ppbez.ab=[p1.ab,p1.ab(n1)+p2.ab(end:n2)-p2.ab(1:n2-1)];
     ppbez.cp=[p1.cp;p2.cp(2:ncp2,:)];
  elseif (norm(p1.cp(ncp1,:)-p2.cp(ncp2,:),2) <= tol)
     %caso in cui le due curve da connettere sono orientate 
     %in senso opposto
     ppbez.ab=[p1.ab,p1.ab(n1)+flip(p2.ab(end:n2)-p2.ab(1:n2-1))];
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