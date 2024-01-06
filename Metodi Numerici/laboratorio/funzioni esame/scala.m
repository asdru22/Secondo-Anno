function ps = scala(p, f_scala)
    % baricentro dei punti
    baricentro = mean(p(1:end-1,:));
    % differenze rispetto al baricentro
    dx = p(:, 1) - baricentro(1);
    dy = p(:, 2) - baricentro(2);
    % scala
    dxs = dx * f_scala;
    dys = dy * f_scala;
    % nuovi punti
    ps = [baricentro(1) + dxs, baricentro(2) + dys];
end