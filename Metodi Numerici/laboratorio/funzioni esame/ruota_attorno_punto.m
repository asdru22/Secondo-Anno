function pr= ruota_attorno_punto(P,alpha)
%calcola il baricentro
if P(1) == P(end)
    B = mean(P(1:end-1,:)); % escluso l'ultimo punto per figure c
else
    B = mean(P);
end
    %definisce matrici
    T = get_mat_trasl(-B);
    M = get_mat2_rot(alpha);
    %matrice composta 
    C = -T*M*T;
    pr = point_trans(P,C);
end