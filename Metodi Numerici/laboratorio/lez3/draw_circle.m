function draw_circle(center, radius,color)

    theta = linspace(0, 2*pi, 100);
    x = center(1) + radius * cos(theta);
    y = center(2) + radius * sin(theta);

    plot(x, y, 'b');
    fill(x, y, color);

end