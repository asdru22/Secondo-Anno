clear all;
close all;
%manieri
open_figure(1);
hold on;
axis equal;

%DISEGNO PRIMA CURVA (a forma di otto) 
%Generazione del vettore lineare che va da 0 a 2*pi
t = linspace(0, 2*pi, 100);
%Calcolo delle coordinate x e y
x = sin(t);
y = sin(t) .* cos(t);
%Punti campionati dalla curva
Q = [x; y]';
%Calcolo delle derivate
dx = cos(t);
dy = cos(2*t);
%Derivate nei punti
Q1 = [dx; dy]';

%Interpolazione della curva utilizzando i punti trovati
C=curv2_bezier_interp(Q,0,1,0);


% DISEGNO SECONDA CURVA
%Interpolazione dei punti della seconda figura(Curva di Bezier a tratti)
%Set di interpolazione della prima curva di bezier
Q2=[0.035,0.343;
    0.0516511,0.265665;
    0.0855356,0.221048;
    0.135573,0.195164;
    0.15198,0.194075;];

%Set di interpolazione della prima curva di bezier
Q3=[0.15198,0.194075;
    0.319,0.194;];

%Set di interpolazione della prima curva di bezier
Q4=[0.319,0.194;
    0.321002,0.200623;
    0.325637,0.212861;
    0.340699,0.237455;
    0.383857,0.259809;
    0.422866,0.247491;
    0.445428,0.222079;
    0.463541,0.194322;
     0.487326,0.162682;];

%Set di interpolazione della prima curva di bezier
 Q5=[0.487326,0.162682;
     0.521242,0.140941;
     0.556781,0.139913;
     0.64265,0.168672
     0.7887,0.252076;
     0.882844,0.319877;
     0.909,0.343;];

%Definizione intervallo
a=0; 
b=1;

%Numero di punti di plotting
np=70;

% Parametro per i punti di interpolazione (param = 0, 1 o 2)
param=2; %Parametrizzazione a corda

%Ottengo la curva interpolata
%chiamata funzione curv2_bezier_interp per interpolazione punti 
bP1=curv2_bezier_interp(Q2,a,b,param);
bP2=curv2_bezier_interp(Q3,a,b,param);
bP3=curv2_bezier_interp(Q4,a,b,param);
bP4=curv2_bezier_interp(Q5,a,b,param);

%determino grado massimo tra quello delle curve in questione
grMax = max([bP1.deg, bP2.deg, bP3.deg,bP4.deg])-1;

% Cambiamento di grado di tutte le curve,
% affinchè sia per tutte lo stesso

for i=bP1.deg:grMax
      bP1=AumentaGrado(bP1);
end
for i=bP2.deg:grMax
     bP2=AumentaGrado(bP2);
end
for i=bP4.deg:grMax
     bP4=AumentaGrado(bP4);
end

% curv2_bezier_plot(bP1,np,'b-');
% %point_plot(bP1.cp,'o');
% curv2_bezier_plot(bP2,np,'b-');
% %point_plot(bP2.cp,'o');
% curv2_bezier_plot(bP3,np,'b-');
% %point_plot(bP3.cp,'o');
%curv2_bezier_plot(bP4,np,'b-');
%point_plot(bP4.cp,'o');

ppbP1=join(bP1,bP2);
ppbP2=join(bP3,bP4);

ppbR=join(ppbP1,ppbP2);
% curv2_ppbezier_plot(ppbR,np,'b-');
% point_plot(ppbR.cp(1,:),'bo-')
% fill(xy(:,1),xy(:,2),'b');

%Specchio la curva e la unisco tramite il join alla precedente
%non specchiata andando a formare una curva unica e chiusa
[ppbR2,T,R]=align_curve(ppbR);
M = R*T;
Minv = inv(M);
ppbR2.cp(:,2)=-ppbR2.cp(:,2);
ppbR2.cp=point_trans(ppbR2.cp,Minv);
ppbRf=join(ppbR,ppbR2);



% Ricerca del baricentro
mX=mean(ppbRf.cp(:,1));
mY=mean(ppbRf.cp(:,2));

%Spostamento della figura in movimento al centro
ppbRf.cp=ppbRf.cp-[mX,mY];

%Scala della dimensione della curva in movimento
ppbRf.cp=ppbRf.cp/2.5;

v=curv2_bezier_tan_plot(C,-100);
% Prendo punti valutati della curva
p_curva = curv2_bezier_plot(C, 100, 'g-', 2);

%Stampa della curva in movimento
np=100;
m=moviein(np);
for i=1:np
    cla
    axis([-3,3,-3,3]);
    axis_plot(2);

    p=v(:,i,:);
    v1=p(:,1);
    v2=p(:,2);

    x = v2(1) - v1(1);
    y = v2(2) - v1(2);
    curv2_bezier_plot(C, 100, 'g-', 2);
    % Calcolo l'angolo del vettore
    ang= atan2(y, x);
    %Calcolo matrice di rotazione
    matRot=get_mat2_rot(2*pi-ang);
    ppbRd = ppbRf;
    ppbRd.cp=point_trans(ppbRd.cp,matRot');
    ppbRd.cp=ppbRd.cp+p_curva(i,:);
    xy=curv2_ppbezier_plot(ppbRd,-np,'b-');
    fill(xy(:,1),xy(:,2),'b');
    m(:,i)=getframe;
end
movie(m,5);

%Funzione che permette di aumentare il grado di una curva
function [bPR]=AumentaGrado(bP)
    [bPR.cp(:,1),bPR.cp(:,2)]=gc_pol_de2d(bP.deg,bP.cp(:,1),bP.cp(:,2));
    bPR.deg=bP.deg+1;
    bPR.ab=bP.ab;
end

%Funzione che permette di unire curve di Bezier
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

function [ppbezQ,T,R]=align_curve(ppbezP)
ncp=length(ppbezP.cp(:,1));
ppbezQ=ppbezP;
T=get_mat_trasl(-ppbezP.cp(1,:));
alfa = -atan2(ppbezP.cp(ncp,2) - ppbezP.cp(1,2), ppbezP.cp(ncp,1) - ppbezP.cp(1,1));
R=get_mat2_rot(alfa);
M=R*T;
ppbezQ.cp=point_trans(ppbezP.cp,M);
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


