% Define control points
P0 = [0, 0];
P1 = [1, 2];
P2 = [3, 3];
P3 = [4, 1];

% Define parameter values (t) for the Bézier curve
t = 0:0.01:1;  % You can adjust the step size (0.01) as needed.

% Initialize arrays to store X and Y coordinates
Bx = zeros(size(t));
By = zeros(size(t));

% Compute the Bézier curve using the formula for each t value
for i = 1:length(t)
    Bx(i) = (1-t(i))^3 * P0(1) + 3*(1-t(i))^2 * t(i) * P1(1) + 3*(1-t(i)) * t(i)^2 * P2(1) + t(i)^3 * P3(1);
    By(i) = (1-t(i))^3 * P0(2) + 3*(1-t(i))^2 * t(i) * P1(2) + 3*(1-t(i)) * t(i)^2 * P2(2) + t(i)^3 * P3(2);
end

% Plot the Bézier curve
plot(Bx, By);
title('Bézier Curve');
xlabel('X');
ylabel('Y');
grid on;
