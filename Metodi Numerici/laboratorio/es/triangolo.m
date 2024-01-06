close all
clear all
set(gca,'color',[1,1,1])
open_figure(1);

p = [0 sqrt(3)/2; -0.25 sqrt(3)/4];
l = curv2_bezier_interp(p,0,1,1);
l = cambia_grado(l,15);

curv2_bezier_plot(l,100,'r-');

pc = draw_circle([0 sqrt(3)/2-0.4999],0.25,16);
C=curv2_bezier_interp(pc,0,1,1);
curv2_bezier_plot(C,100,'b-');
[pi,c1,c2] = curv2_intersect(C,l);

[~,l1] = decast_subdiv(l,c2(1));
[c1,~] = decast_subdiv(C,c1(1));

curv2_bezier_plot(l1,100,'c-');
curv2_bezier_plot(c1,100,'g-');


%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

function out = draw_circle(center, radius,np)
    theta = linspace(0, 2*pi, np);
    x = center(1) + radius * cos(theta);
    y = center(2) + radius * sin(theta);
    out = [x;y]';
end

function ppbez_split(ppi)
fcp = ppi.deg+1;
icp = 1;
bez.deg = ppi.deg;
bez.ab = [0,1];
for i= 1:length(ppi.ab)-1
    bez.cp = [ppi.cp(icp:fcp,1),ppi.cp(icp:fcp,2)];
    icp = icp+ppi.deg;
    fcp = fcp+ppi.deg;
    curv2_bezier_plot(bez,100,'c')
end
end