%main di esempio per visualizzazione figura composta da più
%curve di Bezier a tratti
clear all
close all

open_figure(1);
axis_plot(1,0.125);

fname='a57.dat';

fid = fopen(fname);
ns=fscanf(fid,'%5d',1);
for i=1:ns
    n=fscanf(fid,'%5d',1);
    r=fscanf(fid,'%5f',1);
    g=fscanf(fid,'%5f',1);
    b=fscanf(fid,'%5f',1);
    nel(i)=n;
    cel(i,:)=[r,g,b];
end
fclose(fid);

%carica e visualizza file il cui nome è definito in txtname
k=1;
val=[];
for i=nel
    txtname=[fname(1:end-4),'_',num2str(i),'.db'];
    ppP=curv2_ppbezier_load(txtname);
    Px=curv2_ppbezier_plot(ppP,-40);
    fill(Px(:,1),Px(:,2),cel(k,:));
    k=k+1;
end