close all

figure;
hold on
xlim = 10;
ylim = 10;
axis equal;

draw_circle([0,0],5,'r');

alpha = linspace(0, 2*pi, 12); % Create 100 equally spaced points around the unit circle
cx = 5* cos(alpha);
cy = 5* sin(alpha);
for i = 1:12
    draw_circle([cx(i),cy(i)],1.4,'b');
end


    