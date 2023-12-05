A = [1 2 3; 4 5 6; 7 8 9];
row2 = A(2, :);     % Selects the second row: [4 5 6]
col2 = A(:, 2);     % Selects the second column: [2; 5; 8]
submatrix = A(1:2, 2:3);  % Selects a submatrix: [2 3; 5 6]
(A(:))'