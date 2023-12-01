%Questo script carica due curva di Bézier che si intersecano
%in due punti e determina le intersezioni;
%le curve possono essere anche Bézier a tratti o di altro tipo 
%(vedi curv2_intersect del toolbox anmglib_4.0
%quindi definisce la curva di Bézier a tratti della regione
%chiusa delimitata dalle intersezioni e la colora
clear all
close all
open_figure(1);
axis_plot(1,0.125);

%carica prima curva
bez1=curv2_bezier_load('ppbez_3.db');

% %carica seconda curva
% bez2=curv2_bezier_load('c2_bezB.db');
%carica seconda curva
bez2=curv2_bezier_load('ppbez_4.db');

%numero punti di disegno
np=40;
%disegna prima curva
curv2_bezier_plot(bez1,np,'b-',2,'b');
%disegna poligonale di controllo
point_plot(bez1.cp(1,:),'bo',1,'b','b',8);

%disegna seconda curva
curv2_bezier_plot(bez2,np,'r-',2,'r');
%disegna poligonale di controllo
point_plot(bez2.cp(1,:),'ro',1,'r','r',8);

%chiamata alla function curv2_intersect
[IP1P2,t1,t2]=curv2_intersect(bez1,bez2);

%disegno e stampa dei punti di intersezione
point_plot(IP1P2','r-');

%suddividiamo le curve nel primo punto di intersezione
[p1_sx,p1_dx]=decast_subdiv(bez1,t1(1));
[p2_sx,p2_dx]=decast_subdiv(bez2,t2(1));

%suddividiamo ulteriormente la prima curva
%identifichiamo il tratto centrale
if (t1(1) < t1(2))
        [p1_1_sx,p1_1_dx]=decast_subdiv(p1_dx,t1(2));
        p1=p1_1_sx;
else
        [p1_1_sx,p1_1_dx]=decast_subdiv(p1_sx,t1(2));
        p1=p1_1_dx;
end

%suddividiamo ulteriormente la seconda curva
%identifichiamo il tratto centrale
if (t2(1) < t2(2))
        [p2_2_sx,p2_2_dx]=decast_subdiv(p2_dx,t2(2));
        p2=p2_2_sx;
else
        [p2_2_sx,p2_2_dx]=decast_subdiv(p2_sx,t2(2));
        p2=p2_2_dx;
end

%disegno delle poligonali di controllo delle curve centrali
% point_plot(p1.cp,'r-o',1,'r','r',8);
% point_plot(p2.cp,'b-o',1,'r','r',8);

%join di due curve di Bézier
ppQ=join(p1,p2);

Px=curv2_ppbezier_plot(ppQ,-np,'r-',2,'r');
fill(Px(:,1),Px(:,2),'g')

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