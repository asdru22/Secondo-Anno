close all
clear all
figure(1)
axis equal;
hold on;

c1.ab = [0,1,2,3,4];
c1.cp = [0 0; 1 0; 1 1; 0 1; 0 0];
c1.deg = 1;
c1.cp = c1.cp -[0.5, 0.5];

c1.cp = ruota_attorno_punto(c1.cp,pi/5);
curv2_ppbezier_plot(c1,100,'r-');

rect = tight_bounding_box(c1,100);
plot(rect(:,1),rect(:,2),'g.--')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function rect = tight_bounding_box(ppo,np)
[ppi,angle]=align_curve(ppo);
cp = curv2_ppbezier_plot(ppi,-np)';
rect = bounding_box(cp'); % trovo bounding box dei punti sulla curva
rm= get_mat2_rot(angle);
rect = point_trans(rect,rm);
rect= rect +ppo.cp(1,:);
end

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

function out =bounding_box(v)
    min_x = min(v(:,1));
    min_y = min(v(:,2));
    max_x = max(v(:,1));
    max_y = max(v(:,2));
    out = [
        [min_x,min_y];
        [max_x,min_y];
        [max_x,max_y];
        [min_x,max_y];
        [min_x,min_y]
        ];
end

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

