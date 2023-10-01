% impl
A= [1, 2, 3, 4; 3, 4, 5, 6; 5, 6, 7, 8; 7, 8, 9, 0];
B=A;
a1=A(1,:);
A(1,:) = A(4,:);
A(4,:) = a1;
P = [0, 0, 0, 1; 0, 1, 0, 0; 0, 0, 1, 0; 1, 0, 0, 0];
% out
"matrice per matrice"
A
P * B
"postmoltiplicazione (si scambiano le colonne)"
A
B * P