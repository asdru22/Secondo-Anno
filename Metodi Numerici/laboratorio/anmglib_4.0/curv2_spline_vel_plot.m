function vel = curv2_spline_vel_plot(spline,np,varargin)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function vel = curv2_spline_vel_plot(spline,np,varargin)
%Disegna la funzione velocita' di una curva Spline 2D
%spline --> struttura di una curva spline:
%          spline.deg --> grado della curva
%          spline.cp  --> lista dei punti di controllo (ncp)x2 
%          spline.knot  --> vettore dei nodi (ncp+g+1)
%np --> numero di punti per tratto in cui valutare e disegnare i valori velocita'
%       se negativo si valuta, ma non si disegna
%varargin --> argomenti opzionali di disegno da assegnare nel seguente
%             ordine: LineSpecification, LineWidth,
%             MarkerEdgeColor, MarkerFaceColor, MarkerSize 
%vel <-- valori della funzione velocita'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[nm,mesh]=gc_mesh(spline.deg,spline.knot,abs(np));

Px=deboor_valder(spline,1,mesh);

for i=1:nm
    vel(i)=norm([Px(2,i,1),Px(2,i,2)],2);
end

if (np > 0)
    mesh_curv2_plot(mesh,vel,varargin{:});
end

end