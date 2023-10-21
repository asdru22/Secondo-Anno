function P=curv3_mdppbezier_load(filename)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function P=curv3_mdppbezier_load(filename)
%Legge una curva 3D di Bezier a tratti da file
%filename --> nome del file di estensione .db
%P <-- struttura formata da tre campi:
%      P.deg <-- lista dei gradi dei tratto
%      P.cp  <-- lista dei punti di controllo ncp x 3
%      P.ab  <-- partizione di [a,b]; nc + 1 elementi
%Nota: nc viene letto dal file
%      ncp = numero dei punti di controllo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fid=fopen(filename,'r');
ss=fscanf(fid,'%s',1);
ss=fscanf(fid,'%s',1);
nc=fscanf(fid,'%5d',1);    %numero di curve 
ss=fscanf(fid,'%s',1);
ss=fscanf(fid,'%s',1);
for i=1:nc                 %gradi
  as=fscanf(fid,'%s',1);
  P.deg(i)=str2num(as);
end
ncp=sum(P.deg)+1;
P.cp=zeros(ncp,3);
P.ab=zeros(1,nc+1);
ss=fscanf(fid,'%s',1);
for i=1:ncp
  xs=fscanf(fid,'%s',1);
  ys=fscanf(fid,'%s',1);
  zs=fscanf(fid,'%s',1);
  P.cp(i,1)=str2num(xs); 
  P.cp(i,2)=str2num(ys); 
  P.cp(i,3)=str2num(zs); 
end
ss=fscanf(fid,'%s',1);
for i=1:nc+1
  as=fscanf(fid,'%s',1);
  P.ab(i)=str2num(as);
end
status=fclose(fid);
