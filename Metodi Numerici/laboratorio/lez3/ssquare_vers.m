%script ssquare_vers.m
close all
%definisce vettore colori
col=['r','g','b','m','y','c','k'];
%apre figure
open_figure(1);
%disegna gli assi
axis_plot(3,0.3);
%definizione QUADRATO
P=[[0,0]; [2,0]; [2,2]; [0,2]; [0,0]];
%disegna quadrato 
point_plot(P,'r-o',1,'k');

%TO DO
versore([0,0],[2,0])
versore([2,0],[2,2])
versore([2,2],[0,2])
versore([0,2],[0,0])


% drawargs = {'r-' 1 'k' 'k' 6 0.2}
% for i=1:4
%     B = mean(P(i:i+1,:)); % punto medio del lato
%     v=P(i+1,:)-P(i,:);
%     v=v./norm(v,2); % trovo versore
%     v=[v(2),-v(1)]; % versore ortogonale
%     drawargs{i}= col(i); % cambia il colorer
%     vect2_plot(B,v,drawargs{:}) 
% end











