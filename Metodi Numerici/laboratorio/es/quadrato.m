close all
clear all
set(gca,'color',[0,0,0])
open_figure(1);

lb.ab = [0,1];
lb.deg = 1;
lb.cp = [-0.5 -0.5; 0.5 -0.5];

ld.ab = [0,1];
ld.deg = 1;
ld.cp = [0.5 -0.5; 0.5 0.5];

curv2_bezier_plot(l,100,'r-')

pc = draw_circle([0 sqrt(2)/3],0.25,100);
C=curv2_bezier_interp(pc,0,1,1);
curv2_bezier_plot(C,100,'b-')

ppbez_split(l);


%%%%%%%%%%%%%%%%%%%%%%%%%%%
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