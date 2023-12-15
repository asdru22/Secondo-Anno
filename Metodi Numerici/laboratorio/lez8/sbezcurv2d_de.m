%script di esempio per curva 2d di Bezier
clear all
close all

open_figure(1);
axis_plot(13,1);

%carica file .db con definizione curva di bezier
bezP = curv2_bezier_load('c2_bezier.db');
curv2_bezier_plot(bezP,40,'b-',2,'b');
%disegna poligonale di controllo
point_plot(bezP.cp,'ro',1,'k','r',8);

% cerca: aumenta grado curva di bezier
bezQ=aumenta_grado(bezP);
curv2_bezier_comb_plot(bezQ,40,'g-');
%disegna punti di controllo della curva con grado elevato
point_plot(bezQ.cp,'k-o',1,'k','r',8);

bezD=aumenta_grado(aumenta_grado(aumenta_grado(bezP)));
curv2_bezier_plot(bezD,40,'y--');
point_plot(bezD.cp,'m-o',1,'k','r',8);

% cerca: aumenta grado curva di bezier
function bezO=aumenta_grado(bezI)
[bezO.cp(:,1),bezO.cp(:,2)]=gc_pol_de2d(bezI.deg,bezI.cp(:,1),bezI.cp(:,2));
bezO.deg=bezI.deg+1;
bezO.ab=bezI.ab;
end
