close all
clear all
open_figure(1);

c2.cp = [4 0; 0 2; 0 3; 1 3; 1 2; 0 0];
c2.ab = [0,1,2];
c2.deg = 2;

c1 = c2;
c1.cp=[0 0; 1 2; 0 0; 2 0; 3 0; 4 0];

c3 = c1;
c3.cp = c3.cp+1;

c4 = join(c1,c2);

curv2_ppbezier_plot(c1,100,'g-');
curv2_ppbezier_plot(c2,100,'b-');
curv2_ppbezier_plot(c4,100,'r-');

point_plot(c1.cp,'bo');
point_plot(c2.cp,'bo');
point_plot(c4.cp,'co');


%%%
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
        ppbez.ab=[p1.ab,p1.ab(n1)+p2.ab(2:n2)-p2.ab(1:n2-1)];
        ppbez.cp=[p1.cp;p2.cp(2:ncp2,:)];
    elseif (norm(p1.cp(ncp1,:)-p2.cp(ncp2,:),2) <= tol)
        %caso in cui le due curve da connettere sono orientate
        %in senso opposto
        ppbez.ab=[p1.ab,p1.ab(n1)+flip(p2.ab(2:n2)-p2.ab(1:n2-1))];
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
%%%
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