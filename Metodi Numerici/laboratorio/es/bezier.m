% Define control points for the Bézier curve
controlPoints = [0 0; 1 5; 5 2; -2 5;3 5];  % Add more points for higher-degree curves

% Parametro t
t_values = linspace(0, 1, 100); % Valori di t tra 0 e 1

% Inizializzazione array
B_x = zeros(size(t_values));
B_y = zeros(size(t_values));

for i = 1:length(t_values)
    B_x(i) = bezierCurve(t_values(i), controlPoints(:, 1));
    B_y(i) = bezierCurve(t_values(i), controlPoints(:, 2));
end

% Plot della curva di Bezier e dei punti di controllo
plot(B_x, B_y, 'b-', controlPoints(:, 1), controlPoints(:, 2), 'ro');
title('Curva di Bezier');
xlabel('X');
ylabel('Y');
grid on;

% Function to calculate a Bernstein term
function result = bernsteinTerm(n, i, t)
    binomialCoefficient = nchoosek(n, i);
    term = binomialCoefficient * ((1 - t)^(n - i)) * (t^i);
    result = term;
end

% Function to compute a Bézier curve
function result = bezierCurve(t, controlPoints)
    n = length(controlPoints) - 1; % calcola il grado
    result = zeros(1, size(controlPoints, 2)); % inizializza matrice
    for i = 0:n   % B(t)=sum i=0,...,n P_i*B_i,n(t)
        result = result + controlPoints(i + 1, :) * bernsteinTerm(n, i, t);
    end
end
