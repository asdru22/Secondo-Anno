function area = ppbez_int(ppi)
area = 0;
icp = 1;    % inizio control point
fcp = ppi.deg+1; % fine control point 
bez.deg = ppi.deg;
bez.ab = [0,1];
for i= 1:length(ppi.ab)-1
    bez.cp = [ppi.cp(icp:fcp,1),ppi.cp(icp:fcp,2)];
    icp = icp+ppi.deg;
    fcp = fcp+ppi.deg;
  %calcolo larea della curva 
    val(i)=integral(@(x)cxc1_val(bez,x),bez.ab(1),bez.ab(2));
    
    if (val(i) < 0)
     bez.cp=flip(bez.cp);
     val(i)=-val(i);
    end
    area = area + val(i);
end
end