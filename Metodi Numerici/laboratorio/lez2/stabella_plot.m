%Viene generata una tabulazione della funzione sin(x)
%in corrispondenza di punti equispaziati nell'intervallo [0,pi]
%input: numero di valori da generare
%output: tabulazione (stampa)
n= 1000
x=linspace(0,2*pi,n);
y=sin(x);
z=cos(x);
w=sin(x).^2+cos(x).^2;


close all
figure(1)
hold on
title("QUACK")

plot(x,y)
plot(x,z)

