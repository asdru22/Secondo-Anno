function ppo = aumenta_grado(ppi)
[ppo.cp(:,1),ppo.cp(:,2)]=gc_pol_de2d(ppi.deg,ppi.cp(:,1),ppi.cp(:,2));
ppo.deg=ppi.deg+1;
ppo.ab=ppi.ab;
end