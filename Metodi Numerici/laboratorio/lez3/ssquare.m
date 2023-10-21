%script ssquare.m
close all
%
%TO DO
%
s=[[0,0];[2,0];[2,2];[0,2];[0,0]];
open_figure(1) 
axis_plot(3,0.1)
point_plot(s,'b--o',1.5,'r')
