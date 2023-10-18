function[]=draw_rettangolo(v)
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

plot(out(:,1),out(:,2),'r.--')
fill(out(:,1),out(:,2),'g')

plot(v(:,1),v(:,2),'r.--')
fill(v(:,1),v(:,2),'b')
end