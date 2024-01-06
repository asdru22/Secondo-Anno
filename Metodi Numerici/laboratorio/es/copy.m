v = aumenta_grado(v,3);



trif1 = ppbezier_join(s1,s2);
r = get_mat2_rot(pi/4);

trif2 = trif1;
trif2.cp = point_trans(trif2.cp,r);

trif3 = trif2;
trif3.cp = point_trans(trif3.cp,r);

trif4 = trif3;
trif4.cp = point_trans(trif4.cp,r);

curv2_ppbezier_plot(trif1,100,'r-');
curv2_ppbezier_plot(trif2,100,'r-');
curv2_ppbezier_plot(trif3,100,'r-');
curv2_ppbezier_plot(trif4,100,'r-');