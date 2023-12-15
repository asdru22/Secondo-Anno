close all
clear all
np = 15;

set(gca,'color',[0.8,0.8,1])

open_figure(1);
points = draw_circle([0,0],1,16);

C=curv2_bezier_interp(points,0,1,1);
pC= curv2_bezier_plot(C,100,'b-');
fill(pC(:,1),pC(:,2),'r');
c=curv2_bezier_interp(points*0.8,0,1,1);
%pc = curv2_bezier_plot(c,100,'b-');
%fill(pc(:,1),pc(:,2),'r');

% punti intersezione curva superiore
l1.ab = [0,1];
l1.deg = 1;
l1.cp = [-1,0.2; 1, 0.2];
curv2_bezier_plot(l1,100,'b-');
[ip1,i1,~] = curv2_intersect(c,l1);

% punti intersezione curva inferiore
l2 = l1;
l2.cp = [-1,-0.2; 1, -0.2];
curv2_bezier_plot(l2,100,'b-');
[ip2,i2,~] = curv2_intersect(c,l2);
% arco sinistro
[sx,~] = decast_subdiv(c,i1(1));
[~,asx] = decast_subdiv(sx,i2(1));
curv2_bezier_plot(asx,100,'c-');
% arco destro
adx = asx;
adx.cp(:,1) = -asx.cp(:,1);
curv2_bezier_plot(adx,100,'c-');

% nuova curva lineare superiore 
l1.ab = [0,1];
l1.deg = 1;
l1.cp = ip1';
l1 = cambia_grado(l1,asx.deg);
curv2_bezier_plot(l1,100,'c-');

% nuova curva lineare inferiore
l2 = l1;
l2.cp(:,2) = -l1.cp(:,2);
curv2_bezier_plot(l2,100,'c-');




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ppo=cambia_grado(ppi,n)
ppo = ppi;
while ppo.deg < n
    ppo = aumenta_grado(ppo);
end
end
