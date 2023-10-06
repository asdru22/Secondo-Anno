% ang=linspace(0,pi/2,0.0);
g = 9.81;
v0=200;

ang=0:0.05:pi/2; 
gittata = v0^2/g*sin(2.*ang);

[m,i] = max(gittata);

abs(pi/4-ang(i))