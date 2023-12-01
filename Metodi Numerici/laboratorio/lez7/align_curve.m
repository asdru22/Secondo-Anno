function [bezP]=align_curve(P);
    % Trasla il primo punto di controllo all'origine
    translation_vector = -P.cp(1, :);
    translated_points = P.cp + translation_vector;
    
    % Calcola l'angolo di rotazione per portare l'ultimo punto di controllo sull'asse x
    angle = atan2(translated_points(end, 2), translated_points(end, 1));
    
    % Matrice di trasformazione per la rotazione
    rotation_matrix = [cos(-angle), -sin(-angle); sin(-angle), cos(-angle)];
    
    % Applica la trasformazione di rotazione
    rotated_points = (rotation_matrix * translated_points')';
    
    bezP = P;
    bezP.cp = rotated_points;
end