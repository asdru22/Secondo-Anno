function ppbez=bez_join(p1,p2)
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