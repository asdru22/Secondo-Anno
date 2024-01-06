function C= ruota_attorno_punto(P,alpha)
% cerca: ruota e trasla attorno a punto
%calcola il baricentro
    B = mean(P(1:end-1,:));
    %definisce matrici
    T = get_mat_trasl(-B);
    M=get_mat2_rot(alpha);
    %matrice composta 
    C = -T*M*T;
end

