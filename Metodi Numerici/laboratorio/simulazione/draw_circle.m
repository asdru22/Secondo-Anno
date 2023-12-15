function out = draw_circle(center, radius,np)

    theta = linspace(0, 2*pi, np);
    x = center(1) + radius * cos(theta);
    y = center(2) + radius * sin(theta);
    out = [x;y]';
end