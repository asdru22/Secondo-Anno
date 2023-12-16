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
asx.ab = [0,1];

curv2_bezier_plot(asx,100,'c-');
% arco destro
adx = asx;
adx.cp(:,1) = -asx.cp(:,1);
curv2_bezier_plot(adx,100,'c-');

% nuova curva lineare superiore 
l1.ab = [0,1];
l1.deg = 1;
l1.cp = ip1';
l1.cp= l1.cp(end:-1:1, :);
l1 = cambia_grado(l1,asx.deg);
curv2_bezier_plot(l1,100,'c-');

% nuova curva lineare inferiore
l2 = l1;
l2.cp(:,2) = -l1.cp(:,2);
curv2_bezier_plot(l2,100,'c-');
% sistemo punti estremi degli archi
asx.cp(1,:) = l2.cp(1,:);
asx.cp(end,:) = l2.cp(end,:);

adx.cp(1,:) = l1.cp(1,:);
adx.cp(end,:) = l1.cp(end,:);

%point_plot(asx.cp,'ko',1,'k');
f1 = join(asx,l2);
f2 = join(adx,l1);

f1.cp(1,:)=f2.cp(1,:);
f1.cp(end,:)=f2.cp(end,:);

f = join(f1,f2);

curv2_bezier_plot(f,100,'g-');
%curv2_bezier_plot(f1,100,'g-');
%curv2_bezier_plot(f2,100,'g-');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ppo=cambia_grado(ppi,n)
ppo = ppi;
while ppo.deg < n
    ppo = aumenta_grado(ppo);
end
end

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
