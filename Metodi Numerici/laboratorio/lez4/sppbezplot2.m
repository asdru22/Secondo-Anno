% Load Bezier curve data
ppP=curv2_ppbezier_load('c2_ppbez_esse.db');

% Open a new figure
figure;

% Plot the original Bezier curve
curv2_ppbezier_plot(ppP, 100, 'k-');
hold on;

% Extract knots and number of segments
knots = ppP.ab;
num_segments = length(knots) - 1;

% Define a color map for each segment
colors = lines(num_segments);

% Plot each segment with a different color
for i = 1:num_segments
    t_split = knots(i + 1);
    [sx, ~] = decast_subdiv(ppP, t_split);
    curv2_ppbezier_plot(sx, 100, 'b');
end

% Set axis properties
axis equal;
grid on;
title('Bezier Curve with Colored Segments');
xlabel('X');
ylabel('Y');
