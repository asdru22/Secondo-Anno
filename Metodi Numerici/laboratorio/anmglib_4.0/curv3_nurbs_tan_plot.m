function Px=curv3_nurbs_tan_plot(nurbs,np,varargin)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function Px=curv3_nurbs_tan_plot(nurbs,np,varargin)
%Disegna il vettore tangente di una curva 3D spline
%nurbs --> struttura formata di una curva nurbs:
%          nurbs.deg --> grado della curva
%          nurbs.cp  --> lista dei punti di controllo (ncp)x3 
%          nurbs.w   --> lista dei pesi
%          nurbs.knot  --> vettore dei nodi (ncp+g+1)
%np   --> numero di punti in cui valutare e disegnare i vettori tangente
%         se negativo si valuta, ma non si disegna
%varargin --> argomenti opzionali di disegno da assegnare nel seguente
%             ordine: LineSpecification, LineWidth,
%             MarkerEdgeColor, MarkerFaceColor, MarkerSize
%Px   <-- vettori tangenti
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nm,mesh]=gc_mesh(nurbs.deg,nurbs.knot,abs(np));

%Algoritmo1
%bas_bspl = gc_bpspl(...);
%x=bas_bspl*qx;
%y=bas_bspl*qy;

%Algoritmo2
Px=nurbs_valder(nurbs,1,mesh);

if (np > 0)
    for i=1:nm
     vect3_plot([Px(1,i,1),Px(1,i,2),Px(1,i,3)],[Px(2,i,1),Px(2,i,2),Px(2,i,3)],varargin{:});
    end
end

end

