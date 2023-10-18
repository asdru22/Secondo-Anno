close all

figure(1)
hold on
title("QUACK")

ang = pi/2;

rotationMatrix = [cos(ang), -sin(ang);sin(ang), cos(ang)];

% -----------

a = load("paperino.txt");

a = (rotationMatrix*a.')';

draw_rettangolo(a*10)



% -------------

b = load("twitter.txt")
c= [mean(b(:,1)), mean(b(:,2))];

b=b-c;
b = (rotationMatrix*b.')';
b=b+c;

draw_rettangolo(b)
