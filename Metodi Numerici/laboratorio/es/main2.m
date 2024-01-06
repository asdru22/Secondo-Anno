function main2
clear all
close all
%silvestri %chiamando l'esercizio che mi è stato assegnato posso sovrascrivere l'immagine "precisa" con la mia trovata tramite interpolazione
open_figure(1);
set(gca, 'color', [1, 0.8, 0.8]);

%trovo i punti con il mouse che dovrò poi interpolare, inizialmente li prendo un pò in modo casuale per poi andare a prenderne altri per
%migliorare la curva. ho deciso di ottenere 3 curve separate
Q1 = [-0.01553,0.124515; -0.0206131,0.118019; -0.02756,0.111211; -0.0415909,0.101875; -0.0754729,0.0921611; -0.11431,0.0926956; -0.153541,0.104947; -0.179041,0.130193; -0.187727,0.17202; -0.175328,0.218703; -0.150894,0.247621; -0.102527,0.283556; -0.0602485,0.312083; -0.017595,0.347758; -0.00838613,0.357908; -0.0026993,0.365019; 0.000005,0.368686];
Q2 = [-0.01553,0.124515; -0.0197962,0.0852828; -0.0297146,0.0489074; -0.0516604,0.0204556; -0.0816812,0.00500508; -0.105683,-0.00118566];
Q3 = [ -0.105683,-0.00118566; 0.000005,-0.00118566];

%interpolazione
np = 40;
a=0;
b=1;
param=1;        %parametro da passare alla funzione per interpolare per decidere che tipo di parametrizzazione applicare

%effettuo l'interpolazione cubica passando i punti di interpolazione e ricavo la
%curva a tratti di ogni set di dati di interpolazione
bez1=curv2_ppbezierCC1_interp(Q1,a,b,param);    %facendo così avrò una curva a tratti composta da piccole curve tutte di grado basso (sempre meglio lavorare con curve di grado basso)
bez2=curv2_ppbezierCC1_interp(Q2,a,b,param);
bez3=curv2_bezier_interp(Q3,a,b,param);

% curv2_ppbezier_plot(bez1,np,'r');   %controllo in fase di progettazione
% point_plot(Q1,'o');
%
% curv2_ppbezier_plot(bez2,np,'r');   %controllo in fase di progettazione
% point_plot(Q2,'o');
%
% curv2_bezier_plot(bez3,np,'r');     %controllo in fase di progettazione
% point_plot(Q3,'o');

bez1.cp = flip(bez1.cp);    %lo faccio per congiungere le due curve
bez1.ab = flip(bez1.ab);    % ||
bez12 = join(bez1,bez2);    %effettuo l'unione delle prime due curve a tratti in un unica curva a tratti

% curv2_ppbezier_plot(bez12,np,'r');    %controllo in fase di progettazione


%ora uniamo la curva bez12 con la curva della base dell'immagine per trovare la
%curva di sinstra completa (che dopo specchieremo)
bez3 = modifica_grado(bez3,bez12.deg);    % cambiamo grado perchè per unire due curve quest'ultime devono avere lo stesso grado
bezSx = join(bez12,bez3);       %ora abbiamo la curva di sinistra completa

%curv2_ppbezier_plot(bezSx,np,'m'); %controllo in fase di progettazione

%troviamo la curva di destra specchiando la bezSx invertendo le x
bezDx = bezSx;
bezDx.cp(:,1) = -1*bezSx.cp(:,1);   %applichiamo una traslazione dei punti della curva di sinistra

%ora uniamo le 2 curve a tratti di destra e di sinistra per ottenere la curva finale completa

ppP = join(bezDx,bezSx);
% curv2_ppbezier_plot(ppP,np,'m'); %controllo in fase di progettazione

%trovo il rapporto per ingrandire la picca piccola, (la curva appena trovata rappresenta la curva piccola blu,
%le altre picche di colore diverso sono di grandezza differente,
%quindi trovo le altezze di tutte e poi trovo il rapporto che c'è fra la curva piccola e quelle altre, per poi andare ad eseguire una trasformazione di scala)

altezzaPiccaBlu = max(ppP.cp(:,2))-min(ppP.cp(:,2));    %trovo l'altezza della curva trovata (picca piccola blu)

altezzaPiccaRossa = 0.653028-0.0982215;        %trovo l'altezza della picca rossa

altezzaPiccaVerde = 0.307984-0.0936766;         %trovo l'altezza della picca verde

%rapporti
rappAltRB = altezzaPiccaRossa/altezzaPiccaBlu;
rappAltBV = altezzaPiccaVerde/altezzaPiccaBlu;

%disegno delle picche blu
alpha = 2/15*pi; %360 gradi diviso 16 fa 2/15*pi
R = get_mat2_rot(-alpha);   %trovo la matrice di rotazione
%Problema: visto che nell'immagine le picche blu sono curvate non posso capire che distanza c'è tra l'origine e la sua base con il mouse
puntoBasePiccaBlu = [-0.347558,0.664937]; %quindi prendo un punto curvato della base della prima picca blu curvata
distanzaCentroBasePiccaBlu = point_trans(puntoBasePiccaBlu,R);  %ruoto il punto e trovo punto della base della picca blu dritta
ppPB = ppP;
ppPB.cp(:,2) = ppPB.cp(:,2)+distanzaCentroBasePiccaBlu(:,2); % a questo punto traslo la mia picca di distanza y della "distanzaCentroBasePiccaBlu"
for i=0:15      %ora con il for vado a roteare ogni volta la picca e la vado a colorare
    ppPB.cp = point_trans(ppPB.cp,R);        %roteo la pizza con la matrice di rotazione R
    %curv2_ppbezier_plot(ppPB,np,'b',2,'b','b');
    fill(ppPB.cp(:,1),ppPB.cp(:,2),'b','EdgeColor', 'none');         %coloro l'interno
end

%disegno delle picche verdi
ppPV = ppP;
ppPV.cp = ppPV.cp/rappAltBV;        %applica la scala per renderla più grande
ppPV.cp(:,2) = ppPV.cp(:,2)+0.307984;           %questo punto è la y e l'ho trovata con il mouse cliccando un punto qualsiasi della base della picca verde

%disegna la picca più volte roteandolo come nell'immagine
alpha = 1/3*pi; %360 gradi diviso 6 fa 1/3*pi
R = get_mat2_rot(alpha);
for i=0:5
    ppPV.cp = point_trans(ppPV.cp,R);                                            %stesso procedimento della picca blu
    %curv2_ppbezier_plot(ppPV,np,'b',2,'b','b');
    fill(ppPV.cp(:,1),ppPV.cp(:,2),'g','EdgeColor','b','LineWidth',1.5);
end

%disegno delle picche rosse
ppPR = ppP;
ppPR.cp = ppPR.cp*rappAltRB;
ppPR.cp(:,2) = ppPR.cp(:,2)+0.0982215;         %questo punto è la y e l'ho trovata con il mouse cliccando un punto qualsiasi della base della picca verde

%disegna la picca più volte roteandolo come nell'immagine                   %stesso procedimento della picca verde
alpha = 2/3*pi; %360 gradi diviso 3 fa 2/3*pi
R = get_mat2_rot(alpha);
for i=0:2
    ppPR.cp = point_trans(ppPR.cp,R);
    %curv2_ppbezier_plot(ppPR,np,'b-',2,'b','b');
    fill(ppPR.cp(:,1),ppPR.cp(:,2),'r','EdgeColor','b','LineWidth',1.5);
end


%funzioni utilizzate
    function ppP = modifica_grado(ppP1, grado)
        ppP = ppP1; %sicurezza nel caso la curva che gli vado a passare è già del grado che ho richiesto

        for i = ppP1.deg+1:grado        %finchè non è dello stesso grado richiesto continua ad aumentare di 1 grado richiamando la funzione incrementa_grado
            ppP = incrementa_grado(ppP);
            %disp(i);       %controllo in fase di progettazione
        end
    end

    function ppP = incrementa_grado(ppP1)
        [ppP.cp(:,1),ppP.cp(:,2)]=gc_pol_de2d(ppP1.deg,ppP1.cp(:,1),ppP1.cp(:,2));  %utilizzo la funzione per umentare di grado, che in pratica mi modifica i control point in modo tale che siano giusti per il grado superiore
        ppP.deg=ppP1.deg+1;     %ora con i cp giusti aumento il grado maualmente
        ppP.ab=ppP1.ab;         %l'intervallo rimane sempre lo stesso
    end

    function ppbez=join(p1,p2)      %funzione fornita nell' esercitazione 8  ma modificata per unire due curve a tratti
        ppbez=[];

        if (p1.deg == p2.deg)
            tol=1.0e-2;
            ppbez=p1;
            n1=length(p1.ab);
            n2=length(p2.ab);
            ncp1=length(p1.cp(:,1));
            ncp2=length(p2.cp(:,1));
            if (norm(p1.cp(ncp1,:) - p2.cp(1,:),2) <= tol)                      %caso in cui le due curve da connettere sono orientate nello stesso senso
                
                ppbez.ab=[p1.ab,p1.ab(n1)+p2.ab(end:n2)-p2.ab(1:n2-1)];         %connette gli estremi per ottenere il nuovo intervallo della curva unita
                ppbez.cp=[p1.cp;p2.cp(2:ncp2,:)];                               %connette i control point per ottenere i nuovi control point della curva unita
            
            elseif (norm(p1.cp(ncp1,:)-p2.cp(ncp2,:),2) <= tol)                 %caso in cui le due curve da connettere sono orientate in senso opposto, inverte l'ordine dei cp e degli intervalli
                ppbez.ab=[p1.ab,p1.ab(n1)+flip(p2.ab(end:n2)-p2.ab(1:n2-1))];
                ppbez.cp=[p1.cp;flip(p2.cp(1:ncp2-1,:))];
            else
                fprintf('Le curve sono disgiunte\n');
                ppbez=[];
            end
        else
            fprintf('Le curve non hanno stesso grado\n');
            ppbez=[];
        end
    end
end