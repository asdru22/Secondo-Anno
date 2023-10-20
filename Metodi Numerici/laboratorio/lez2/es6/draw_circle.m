function draw_circle(center, radius,color)
    % center is a 1x2 array specifying the center of the circle as [x, y]
    % radius is the radius of the circle

    % Generate a set of points that form the circle
    theta = linspace(0, 2*pi, 100); % Create 100 equally spaced points around the unit circle
    x = center(1) + radius * cos(theta);
    y = center(2) + radius * sin(theta);

    % Plot the circle
    plot(x, y, 'b');
    fill(x, y, color);

end
