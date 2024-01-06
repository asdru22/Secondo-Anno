function rect = tight_bounding_box(ppo,np)
[ppi,angle]=align_curve(ppo);
cp = curv2_ppbezier_plot(ppi,-np)';
rect = bounding_box(cp'); % trovo bounding box dei punti sulla curva
rm= get_mat2_rot(angle);
rect = point_trans(rect,rm);
rect= rect + ppo.cp(1,:);
end