function val = cxc1_val(bezier,t)
Pt=decast_valder(bezier,1,t);
val=0.5*(Pt(1,:,1).*Pt(2,:,2)-Pt(2,:,1).*Pt(1,:,2));
end