%script di esempio per curva 2d di Bezier
clear all
close all

open_figure(1);
axis_plot(1,0.125);

bezP=curv2_bezier_load('c2_bezier2.db');
np=61;
curv2_bezier_plot(bezP,np,'b',2);
point_plot(bezP.cp,'r-o',1.5,'r');

open_figure(2);

%TO DO
n = 100;

for i=1:n
    R = get_mat2_rot(2*pi*i/n);
    bezP.cp=point_trans(bezP.cp,R);
    curv2_bezier_plot(bezP,100);
end




