function [ppo,alpha]=align_curve(ppi)
    % trasla il primo punto di controllo all'origine
    delta = -ppi.cp(1, :);
    p = ppi.cp + delta;
    % calcola angolo di rotazione
    alpha = atan2(p(end, 2), p(end, 1));
    % Matrice di trasformazione per la rotazione
    R = get_mat2_rot(alpha);    
    ppo = ppi;
    %Applica la trasformazione di rotazione
    ppo.cp = point_trans(p,R);
end