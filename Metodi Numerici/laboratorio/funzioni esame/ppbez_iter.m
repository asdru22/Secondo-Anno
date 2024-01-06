function ppbez_iter(ppi)
icp = 1;    % inizio control point
fcp = ppi.deg+1; % fine control point 
bez.deg = ppi.deg;
bez.ab = [0,1];
for i= 1:length(ppi.ab)-1
    bez.cp = [ppi.cp(icp:fcp,1),ppi.cp(icp:fcp,2)];
    icp = icp+ppi.deg;
    fcp = fcp+ppi.deg;
    % codice da eseguire su 'bez'
end
end