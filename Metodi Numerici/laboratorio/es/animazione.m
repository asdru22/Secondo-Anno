%script di prova per disegno della cardioide e animazione
open_figure(1);

% np=25;
np=75;
m=moviein(np);
[x1,y1]=circle2_plot([0,0],1,-np,'bo',2);
alpha=pi;
c=cos(alpha);
s=sin(alpha);
R=[c, -s, 0; 
   s,  c, 0; 
   0,  0, 1];

Q=zeros(np,2);
for i=1:np
  cla
  axis([-3,3,-3,3]);
  axis_plot(2);

  circle2_plot([0,0],1,np,'k-',2);
  c=x1(i);
  s=y1(i);
  M=[c, -s, 2*c; 
     s,  c, 2*s; 
     0,  0,  1];

  [x,y]=circle2_trans_plot([0,0],1,np,M*R,'b-',2);
   
  P(1,:)=[x(i),y(i)];
  P(2,:)=[2*x1(i),2*y1(i)];
  point_plot(P,'k-o');

  Q(i,:)=P(1,:);
  point_plot(Q(1:i,:),'r-o',1,'r','r',2);

%cattura frame in una struttura di np matrici
  m(:,i)=getframe;
end
%se scommentata visualizza l'animazione 3 volte
movie(m,3);