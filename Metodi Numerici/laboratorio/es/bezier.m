% Punti di controllo
cp = [0 0; 1 5; 5 2; -2 5; 3 5]; 
% Parametro t nell'intervallo [a, b]
a = 0;
b = 2;

% Calcola i valori di t nell'intervallo [a, b]
t_values = linspace(a, b, 100);

% Inizializzazione array
B_x = zeros(size(t_values));
B_y = zeros(size(t_values));   

for i = 1:length(t_values)
    % t= (x-a)/(b-a)
    t = (t_values(i) - a) / (b - a);  % Normalizza t nell'intervallo [0, 1]
    B_x(i) = bezierCurve(t, cp(:, 1));
    B_y(i) = bezierCurve(t, cp(:, 2));
end

% Plot della curva di Bezier e dei punti di controllo
plot(B_x, B_y, 'b-', cp(:, 1), cp(:, 2), 'ro');
title('Curva di Bezier');
xlabel('X');
ylabel('Y');
grid on;

% Funzione per calcolare un termine di Bernstein
function result = bernsteinTerm(n, i, t)
    binomialCoefficient = nchoosek(n, i);
    term = binomialCoefficient * ((1 - t)^(n - i)) * (t^i);
    result = term;
end

% Funzione per calcolare una curva di Bézier
function result = bezierCurve(t, controlPoints)
    n = length(controlPoints) - 1; % Calcola il grado
    result = zeros(1, size(controlPoints, 2)); % Inizializza la matrice
    for i = 0:n   % B(t) = sum i=0,...,n P_i * B_i,n(t)
        result = result + controlPoints(i + 1, :) * bernsteinTerm(n, i, t);
    end
end
