% Define the polynomial coefficients
coefficients = [3, -2, 1];  % Represents the polynomial 3x^2 - 2x + 1

% Calculate the derivative coefficients
% cerca: derivata polinomio
derivativeCoefficients = polyder(coefficients);

% Evaluate the derivative at x = 2
x = 2;
derivativeValue = polyval(derivativeCoefficients, x);

% Display the results
disp('Polynomial Coefficients:');
disp(coefficients);
disp('Derivative Coefficients:');
disp(derivativeCoefficients);
disp(['Derivative at x = ', num2str(x), ': ', num2str(derivativeValue)]);
