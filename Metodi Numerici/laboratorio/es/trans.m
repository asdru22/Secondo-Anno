close all
clear all
set(gca,'color',[0,0,0])
open_figure(1);

b.ab = [0,1];
b.cp = [0 0; 1 1; 2 0];
b.deg = 2;
%curv2_bezier_plot(b,100,'g-');

r = get_mat2_rot(pi);
s = get_mat_trasl([-2,0]);

b2 = b;
b2.cp = point_trans(b2.cp,s);
b2.cp = point_trans(b2.cp,r);

%curv2_bezier_plot(b2,100,'b-');

f1 = join(b,b2);
f2 = f1;
r = get_mat2_rot(pi/2);
f1.cp = point_trans(f1.cp,r);
f1.cp=f1.cp+[1,-1];
%curv2_ppbezier_plot(f1,100,'b-');
p = curv2_ppbezier_plot(f2,100,'k-');
fill (p(:,1),p(:,2),'w  ');
%point_plot(b3.cp,'ro')

[i,p1,p2]=curv2_intersect(f1,f2);
[ppsx,~]=ppbezier_subdiv(f1,p1(2));
[~,a]=ppbezier_subdiv(ppsx,p1(1));

a1 = a;
a2 = a;
a3 = a;
a4 = a;

rp = a.cp+[-1,0];

a4.cp = rp;
%curv2_ppbezier_plot(a4,100,'c-');

rp = point_trans(rp,r);
a1.cp = rp;
%curv2_ppbezier_plot(a1,100,'c-');

rp = point_trans(rp,r);
a2.cp = rp;
%curv2_ppbezier_plot(a2,100,'c-');

rp = point_trans(rp,r);
a3.cp = rp;
%curv2_ppbezier_plot(a3,100,'c-');

h1 = join_disgiunte(a1,a4);
h2 = join_disgiunte(h1,a3);
h3 = join_disgiunte(h2,a2);

h3.cp = h3.cp+[1,0];
p = curv2_ppbezier_plot(h3,100,'k-');
fill (p(:,1),p(:,2),'c');
ppbez_int(h3)
%%%%%%
function tot = ppbez_int(ppP)
somma = ppP.deg+1;
righe = 1;
tot = 0;
bezP.deg = ppP.deg;
for i= 1:length(ppP.ab)-1
    bezP.ab = [ppP.ab(i),ppP.ab(i+1)];
    bezP.cp = [ppP.cp(righe:somma,1),ppP.cp(righe:somma,2)];
    righe = righe+ppP.deg;
    somma = somma+ppP.deg;

    %calcolo l'area della curva 
    val(i)=integral(@(x)cxc1_val(bezP,x),bezP.ab(1),bezP.ab(2));
    
    if (val(i) < 0)
     bezP.cp=flip(bezP.cp);
     val(i)=-val(i);
    end
    tot = tot + val(i);
end
end
%%%%%%
function val = cxc1_val(bezier,t)
Pt=decast_valder(bezier,1,t);
val=0.5*(Pt(1,:,1).*Pt(2,:,2)-Pt(2,:,1).*Pt(1,:,2));
end

%%%%%%
function ppbez = join_disgiunte(p1, p2)
ppbez = [];

if (p1.deg == p2.deg)
    tol = 1.0e-2;
    ppbez = p1;
    n1 = length(p1.ab);
    n2 = length(p2.ab);
    ncp1 = length(p1.cp(:, 1));
    ncp2 = length(p2.cp(:, 1));

    % controllo che il primo e ultimo punto sia lo stesso
    if (norm(p1.cp(ncp1, :) - p2.cp(1, :), 2) <= tol)
        %caso in cui le due curve da connettere sono orientate nello stesso senso
        ppbez.ab = [p1.ab, p1.ab(n1) + p2.ab(2:n2) - p2.ab(1:n2-1)];
        ppbez.cp = [p1.cp; p2.cp(2:ncp2, :)];
    elseif (norm(p1.cp(1, :) - p2.cp(ncp2, :), 2) <= tol)
        %caso in cui le due curve da connettere sono orientate in senso opposto
        ppbez.ab = [p1.ab, p1.ab(n1) + flip(p2.ab(1:n2-1))];
        ppbez.cp = [p1.cp; flip(p2.cp(1:ncp2-1, :))];
    else
        fprintf('Le curve sono disgiunte\n');
        ppbez = [];
    end
else
    fprintf('Le curve non hanno stesso grado\n');
    ppbez = [];
end
end

%%%%%%
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