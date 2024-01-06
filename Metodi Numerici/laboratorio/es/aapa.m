clear all;
close all;
open_figure(1);

axis equal;
% 


%Interpolazione dei punti della seconda figura(Curva di Bezier a tratti)
%set di interpolazione della prima curva di bezier
Q2=[0.035,0.341;
    0.0516511,0.265665;
    0.0855356,0.221048;
    0.135573,0.195164;
    0.15198,0.194075;
    ];

Q3=[0.15198,0.194075;
    0.319,0.194;];

Q4=[0.319,0.194;
    0.3341,0.228659;
    0.356034,0.250784;
    0.389,0.26;
    0.422866,0.247491;
    0.4487,0.217203;
    0.487326,0.162682;
    0.531024,0.139442;
    0.590458,0.147487;
    0.680737,0.188179;
    0.832356,0.281163;
    0.909,0.343;
    ];

a=0; 
b=1;

%numero di punti di plotting
np=70;

%disegno punti di interpolazione
%point_plot(Q1,'ko',1,'k');
%point_plot(Q2,'ko',1,'k');


% parametro per i punti di interpolazione (param = 0, 1 o 2)
param=2;
%Ottengo la curva interpolata
%chiamata funzione curv2_bezier_interp per interpolazione punti 
bP1=curv2_bezier_interp(Q2,a,b,param);
bP2=curv2_bezier_interp(Q3,a,b,param);
bP3=curv2_bezier_interp(Q4,a,b,param);


point_plot(bP3.cp,'co');

%determino grado massimo tra quello delle curve in questione
grMax = max([bP1.deg, bP2.deg, bP3.deg]);

for i=bP1.deg:grMax
    bP1=AumentaGrado(bP1);
end
for i=bP2.deg:grMax
    bP2=AumentaGrado(bP2);
end

curv2_bezier_plot(bP1,np,'b-');
curv2_bezier_plot(bP2,np,'b-');
curv2_bezier_plot(bP3,np,'b-');

function [bPR]=AumentaGrado(bP)
    [bPR.cp(:,1),bPR.cp(:,2)]=gc_pol_de2d(bP.deg,bP.cp(:,1),bP.cp(:,2));
    bPR.deg=bP.deg+1;
    bPR.ab=bP.ab;
end