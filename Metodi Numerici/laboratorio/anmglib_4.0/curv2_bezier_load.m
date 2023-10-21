function bezier = curv2_bezier_load(filename)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function bezier = curv2_bezier_load(filename)
%Legge una curva 2D di Bezier da file
%filename --> nome del file di estensione .db
%bezier <-- struttura di una curva di bezier:
%      bezier.deg <-- grado della curva
%      bezier.cp  <-- lista dei punti di controllo (bezier.deg+1) x2
%      bezier.ab  <-- intervallo di definizione
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fid=fopen(filename,'r');
ss=fscanf(fid,'%s',1);
ss=fscanf(fid,'%s',1);
bezier.deg=fscanf(fid,'%5d',1);    %grado 
ncp=bezier.deg+1;
bezier.cp=zeros(ncp,2);
ss=fscanf(fid,'%s',1);
for i=1:ncp
  xs=fscanf(fid,'%s',1);
  ys=fscanf(fid,'%s',1);
  bezier.cp(i,1)=str2num(xs); %control_point
  bezier.cp(i,2)=str2num(ys); 
end  

ss=fscanf(fid,'%s',1);
as=fscanf(fid,'%s',1); 
bezier.ab(1)=str2num(as); %intervallo di definizione
bs=fscanf(fid,'%s',1);
bezier.ab(2)=str2num(bs);

status=fclose(fid);
