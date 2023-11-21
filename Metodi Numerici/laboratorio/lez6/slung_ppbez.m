%main di esempio per visualizzazione curva di Bezier a tratti
clear all
close all
col=['r','g','b','k','m','c','y','r','g','b','k','m','c','y'];
open_figure(2);
axis_plot(1.25,0.125);

%curva da file
ppP=curv2_ppbezier_load('a57_5.db');

% test
%ppP.deg=1;
%ppP.ab= [0,1,2,3,4];
%ppP.cp= [0,0; 1,0; 1,1; 0,1; 0,0];

%disegno della curva a tratti
curv2_ppbezier_plot(ppP,50,'b-',2);

nt=length(ppP.ab)-1;
[ncp,~] = size(ppP.cp);
val = 0;
%estrae le singole curve di Bezier e calcola la loro lunghezza
bez.deg=ppP.deg;

for i=1:nt
    i1=(i-1)*ppP.deg+1;
    i2=i1+ppP.deg;
    bez.cp=ppP.cp(i1:i2,:);
    bez.ab=[ppP.ab(i),ppP.ab(i+1)];
    val =val+integral(@(x)norm_c1_val(bez,x),bez.ab(1),bez.ab(2));
end

%TO DO

fprintf('Lunghezza della curva: %e\n',val); 

