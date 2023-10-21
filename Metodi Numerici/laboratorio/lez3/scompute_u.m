%Script scompute_u.m
%**************************************************
%gestisce sia il caso BASIC single che BASIC double
%flag=0 per BASIC single
%flag=1 per BASIC double
%**************************************************

%cambiare il flag
flag=1;

if (flag==0)
%****************************************************
%calcolo dell'unita' di arrotondamento via
%caratterizzazione o def. operativa per
%BASIC single   F(2,24,-127,128)    U = 0.5* 2^(1-24)
% u = b/2*2^(1-mantissa)
%****************************************************
    %stampa di u
    u =2^(-24);
    fprintf('u = 2^(-24) = %20.16e \n',u); % stampa in precisione doppia

    %Implementazione definizione operativa
    u=single(1); % u a precisione singola di 1
    t=0;
    while(1+u > 1) % eseguito in precisione singola
        u=u/2; % potenze di 2 negative
        t=t+1; % contatore iterazioni (in teoria n cifre di mantissa)
    end
    
    if (u+1) == 1 %essere sicuri che u+1 = 1
        fprintf('Largest Finite and Positive Number u such that u+1==1\n');
        fprintf('%13.8e\n',u); % stampa in precisione singola
        fprintf('Exponent -%d\n',t);
    end
end

if (flag==1)
%******************************************************
%calcolo dell'unita' di arrotondamento via
%caratterizzazione o def. operativa per 
%BASIC double   F(2,53,-1023,1024)    U = 0.5* 2^(1-53)
%******************************************************
    %stampa di u
    u = 2^(-53);
    fprintf('u = 2^(-53) = %20.15e \n',u);  	

    %Implementazione definizione operativa
    u=1;
    t=0;
    while(1+u > 1)
        u=u/2;
        t=t+1;
    end

    if (u+1) == 1 
        fprintf('Largest Finite and Positive Number u such that u+1==1\n');
        fprintf('%20.15e\n',u); % stampa a 15 cifre decimali
        fprintf('Exponent -%d\n',t);
    end
end