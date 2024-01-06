close all
clear all
set(gca,'color',[0.8,0.8,1])
open_figure(1);

[p,dp] = draw_circle([0,0],1,30);
C=curv2_ppbezierCC1_interp_der(p,dp,linspace(0,2*pi,30));
pC=curv2_ppbezier_plot(C,100,'b-');
fill(pC(:,1),pC(:,2),'r');
c = C;
c.cp = C.cp*0.8;
%curv2_ppbezier_plot(c,100,'b-');

lu.ab = [0,1];
lu.cp = [-1 0.14; 1 0.14];
lu.deg = 1;
curv2_bezier_plot(lu,100,'r-');

ld.ab = [0,1];
ld.cp = [-1 -0.14; 1 -0.14];
ld.deg = 1;
curv2_bezier_plot(ld,100,'r-');

[IP1P2,t1,t2]=curv2_intersect(ld,c);

[p1_sx,p1_dx]=ppbezier_subdiv(ld,t1(1));
[p2_sx,p2_dx]=ppbezier_subdiv(c,t2(1));

if (t1(1) < t1(2))
        [p1_1_sx,p1_1_dx]=ppbezier_subdiv(p1_dx,t1(2));  
        p1=p1_1_sx;
else
        [p1_1_sx,p1_1_dx]=ppbezier_subdiv(p1_sx,t1(2));
        p1=p1_1_dx;
end

if (t2(1) < t2(2))
        [p2_2_sx,p2_2_dx]=ppbezier_subdiv(p2_dx,t2(2));
        p2=p2_2_sx;
else
        [p2_2_sx,p2_2_dx]=ppbezier_subdiv(p2_sx,t2(2));
        p2=p2_2_dx;
end

p1 = cambia_grado(p1,p2.deg);
ad = join(p2,p1);

au = ad;
au.cp(:,2) = -au.cp(:,2);


r = get_mat2_rot(-pi/4);
au.cp= point_trans(au.cp,r);
ad.cp= point_trans(ad.cp,r);

pau = curv2_ppbezier_plot(au,100,'b-');
pad =curv2_ppbezier_plot(ad,100,'b-');
fill(pad(:,1),pad(:,2),'w');
fill(pau(:,1),pau(:,2),'w');


%%%%%%%%%%%%%
function ppbez = join(pp1, pp2)
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

function ppo=cambia_grado(ppi,n)
ppo = ppi;
while ppo.deg < n
    ppo = aumenta_grado(ppo);
end
end

function ppo = aumenta_grado(ppi)
[ppo.cp(:,1),ppo.cp(:,2)]=gc_pol_de2d(ppi.deg,ppi.cp(:,1),ppi.cp(:,2));
ppo.deg=ppi.deg+1;
ppo.ab=ppi.ab;
end

function ppP=curv2_ppbezierCC1_interp_der(Q,Q1,t)
% Q: punti
% Q1: punti funzione derivata
% t: intervallo in cui valutare
cqx=Q(:,1);
cqy=Q(:,2);
dx=Q1(:,1);
dy=Q1(:,2);
m=length(cqx);
nc=m-1;
%bma=b-a;
bma=t(m)-t(1);

ht(1:m-1)=t(2:m)-t(1:m-1);
for i=1:nc
 trei=3*(i-1)+1;
 cpx(trei)=cqx(i);
 cpx(trei+1)=cqx(i)+dx(i).*ht(i)./3;
 cpx(trei+2)=cqx(i+1)-dx(i+1).*ht(i)./3;
 cpy(trei)=cqy(i);
 cpy(trei+1)=cqy(i)+dy(i).*ht(i)./3;
 cpy(trei+2)=cqy(i+1)-dy(i+1).*ht(i)./3;
end
cpx(trei+3)=cqx(m);
cpy(trei+3)=cqy(m);

ppP.deg=3;
ppP.cp=zeros(3*nc+1,2);
ppP.cp(:,1)=cpx;
ppP.cp(:,2)=cpy;
ppP.ab=zeros(1,m);
ppP.ab=t;

end

function [p,dp]= draw_circle(center, radius,np)
    theta = linspace(0, 2*pi, np);
    x = center(1) + radius * cos(theta);
    y = center(2) + radius * sin(theta);
    p = [x;y]';

    dx = -radius * sin(theta);
    dy = radius * cos(theta);
    dp = [dx;dy]';
end
