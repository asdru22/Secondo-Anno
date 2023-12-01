%Questo script carica una curva di Bézier o Bézier atratti,
%trova la curva aligned, trova i suoi punti estremi,
%il suo bounding-box, quindi il tight bounding-box

close all
open_figure(1);
axis_plot(1,0.125);

%carica curva
bezQ=curv2_bezier_load('ppbez_1.db');

%numero punti di disegno
np=40;
%disegna prima curva
curv2_bezier_plot(bezQ,np,'b-',2,'b');
%disegna poligonale di controllo
point_plot(bezQ.cp,'r-o',1,'k','r',8);
[ncp,~]=size(bezQ.cp);

%determina la curva aligned di una curva di Bézier
bezP=align_curve(bezQ);

%vettore dei valori estremi
extrema=[0];
%struttura fBezier
f.deg=bezP.deg-1;
f.ab=bezP.ab;
%coefficienti della derivata prima della prima componente della curva
f.cp=bezP.deg*(bezP.cp(2:ncp,1)-bezP.cp(1:ncp-1,1))./(bezP.ab(2)-bezP.ab(1)); % pag 68 dispensa

TOL=1.0e-10;
rootsx = lane_riesenfeld(f,TOL);
if (length(rootsx) >= 1)
    fprintf('Lista delle radici di x trovate nell''intervallo della curva:\n');
    fprintf('%22.15e\n',rootsx);
    extrema=[extrema,rootsx];
    Px=decast_val(bezP,rootsx);
%    plot(Px(:,1),Px(:,2),'ro');
end

%struttura fBezier
f.deg=bezP.deg-1;
f.ab=bezP.ab;
f.cp=bezP.deg*(bezP.cp(2:ncp,2)-bezP.cp(1:ncp-1,2))./(bezP.ab(2)-bezP.ab(1));

TOL=1.0e-10;
rootsy = lane_riesenfeld(f,TOL);
if (length(rootsy) >= 1)
    fprintf('Lista delle radici di y trovate nell''intervallo della curva:\n');
    fprintf('%22.15e\n',rootsy);
    extrema=[extrema,rootsy];
    Py=decast_val(bezP,rootsy);
%     plot(Py(:,1),Py(:,2),'ro');
end

extrema=[extrema,1];
xy=decast_val(bezP,extrema);
%bounding-box = più piccolo rettangolo contenente i punti
%estremi ed il primo ed ultimo punto della curva
%definisce il bounding-box come una curva di
rect.deg=1;
%TO DO
% TRASLARE IL PRIMO PUNTO SULL'ORIGINE E TROVARE ANGOLO DI INCLINAZIONE, 
% APPLICARE TRASFORMAZIONI E RIPORTARE A POS INIZIALE (ALPHA = ATAN(Y,X))
%trasformazione inversa e sua applicazione al bounding-box
%M=...;
tight=rect;
tight.cp=point_trans_plot(rect.cp,M);

% area=curv2_ppbez_area(tight);
% fprintf('Area = %e \n',area)
% point_plot(rect.cp,'k-',1.5);

%function per determinare una curva aligned
    bezQ=align_curve(bezP);

   curv2_ppbezier_plot(bezQ,100,'r-');

