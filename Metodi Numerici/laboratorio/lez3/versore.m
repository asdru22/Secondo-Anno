function versore(p1,p2)
% cerca: versore
from_x = (p1(1)+p2(1))/2;
from_y = (p1(2)+p2(2))/2;

segmento = p2 - p1;
tangente = segmento / norm(segmento);

vect2_plot([from_x,from_y],[tangente(2),-tangente(1)]);

end