bezier.cp=[0,2;1,1;2,1;3,2];
bezier.deg=length(bezier.cp(:,1))-1;
bezier.ab=[0,1];
curv2_bezier_plot(bezier,40,'-md','y','k',8);
