function main()
% Chiudi tutte le figure aperte e pulisci lo spazio di lavoro
close all
clear all

% Imposta il colore dello sfondo degli assi correnti
set(gca,'color',[1,0.8,0.8])

% Apri una nuova figura con identificativo 1
open_figure(1);
% Mantieni i plot correnti quando aggiungi nuovi plot
hold on;

% Definisci i punti di controllo per le curve di Bézier
Q1 = [0.361  0.72;
      0.409818 0.699433;
      0.428049 0.664139;
      0.422379 0.626838];
Q2 = [0.422379 0.626838;
      0.465738 0.608081;
      0.489 0.559;
      0.470261 0.512105;
      0.429676 0.494057;
      0.378 0.511];

% Interpola i punti di controllo per ottenere le curve di Bézier
curva1 = curv2_bezier_interp(Q1,0,1,0);
curva2 = curv2_bezier_interp(Q2,0,1,0);

% Definisci una curva di Bézier lineare verticale
vert.ab = [0,1];
vert.cp = [0.378 0.511; 0.378 0.373];
vert.deg = 1;

% Cambia il grado delle curve per corrispondere tra loro
curva1 = cambia_grado(curva1,curva2.deg);
vert = cambia_grado(vert,curva2.deg);

% Unisci le curve di Bézier per formare un'unica curva complessiva
temp = join(curva1,curva2);
% Inverti l'ordine dei punti di controllo della curva verticale
vert.cp = flip(vert.cp);

% Unisci le curve di Bézier per creare la forma del trifoglio
s1 = ppbezier_join(vert,temp);
% Sposta la curva orizzontalmente per allineare con l'origine
s1.cp(:,1) = s1.cp(:,1)-0.361;
s2 = s1;
% Rifletti la curva rispetto all'asse y e inverti l'ordine dei punti di controllo
s2.cp(:,1) = -s2.cp(:,1); 
s2.cp = flip(s2.cp);
% Unisci le due metà per formare il trifoglio completo
trif1 = join(s1,s2);
% Definisci il vettore dei parametri di base per la curva del trifoglio
trif1.ab = [0,1,2,3,4,5,6];
% Sposta la curva verticalmente per allineare con l'origine
trif1.cp(:,2) = trif1.cp(:,2)-0.355;

% Ottieni la matrice di rotazione di 90 gradi
matR = get_mat2_rot(pi/2);

% Applica la rotazione ai punti di controllo per ottenere le altre 3 parti del trifoglio
trif2 = trif1;
trif2.cp = point_trans(trif2.cp,matR);

trif3 = trif2;
trif3.cp = point_trans(trif3.cp,matR);

trif4 = trif3;
trif4.cp = point_trans(trif4.cp,matR);

% Rifletti la prima e la terza parte per allinearle
trif1.cp = flip(trif1.cp);
trif3.cp = flip(trif3.cp);

% Unisci le parti per formare il disegno finale del trifoglio
trif5 = ppbezier_join(trif4,trif1);
trif6 = ppbezier_join(trif3,trif2);
trifoglio = ppbezier_join(trif5,trif6);

% Sposta il trifoglio per posizionarlo correttamente nel plot
trifoglio.cp = trifoglio.cp+[1,0];

% Questa sezione crea un'animazione del trifoglio che ruota
p_cerchio = cerchio([0,0], 0.65);
c_cerchio = curv2_bezier_interp(p_cerchio,0,1,0);
np=75;
m=moviein(np);
for i=1:np
  cla
  axis([-3,3,-3,3]);
  axis_plot(2);

  % Applica una rotazione incrementale al trifoglio
  trifoglio.cp = point_trans(trifoglio.cp,get_mat2_rot(2*pi/np));
  % Ruota il trifoglio di un angolo aggiuntivo
  matR2= ruota(trifoglio.cp,pi/10);
  trifoglio.cp = point_trans(trifoglio.cp,matR2);

  % Disegna cerchio
  cord_cerchio = curv2_bezier_plot(c_cerchio,100,'k-');
  fill(cord_cerchio(:,1),cord_cerchio(:,2),'r');
  % Plotta e riempi il trifoglio con colore
  cord_trif = curv2_ppbezier_plot(trifoglio,100,'k-');
  fill(cord_trif(:,1),cord_trif(:,2),'b');
  % Cattura il frame corrente per l'animazione
  m(:,i)=getframe;
end

% Se scommentata, questa linea visualizza l'animazione 3 volte
movie(m,3);
end 
function punti = cerchio(centro, raggio)
    theta = linspace(0, 2*pi, 100);
    x = centro(1) + raggio * cos(theta);
    y = centro(2) + raggio * sin(theta);
    punti = [x;y]';
end
% Funzione per ruotare i punti di controllo di una curva di Bézier
function C= ruota(P,alpha)
    % Calcola il baricentro escludendo l'ultimo punto per figure chiuse
    B = mean(P(1:end-1,:)); 
    % Definisce le matrici di traslazione e rotazione
    T = get_mat_trasl(-B);
    M = get_mat2_rot(alpha);
    % Componi le trasformazioni e applica alla curva
    C = -T*M*T;
end

% Funzione per unire due curve di Bézier garantendo che abbiano lo stesso grado
function ppbez=join(p1,p2)
    ppbez=[];
    if (p1.deg == p2.deg)
        tol=1.0e-2;
        ppbez=p1;
        n1=length(p1.ab);
        n2=length(p2.ab);
        ncp1=length(p1.cp(:,1));
        ncp2=length(p2.cp(:,1));
        if (norm(p1.cp(ncp1,:) - p2.cp(1,:),2) <= tol)
            % Se le curve sono orientate nello stesso senso, le unisce
            ppbez.ab=[p1.ab,p1.ab(n1)+p2.ab(2:n2)-p2.ab(1:n2-1)];
            ppbez.cp=[p1.cp;p2.cp(2:ncp2,:)];
        elseif (norm(p1.cp(ncp1,:)-p2.cp(ncp2,:),2) <= tol)
            % Se le curve sono orientate in senso opposto, le unisce dopo aver invertito l'ordine di una delle due
            ppbez.ab=[p1.ab,p1.ab(n1)+flip(p2.ab(2:n2)-p2.ab(1:n2-1))];
            ppbez.cp=[p1.cp;flip(p2.cp(1:ncp2-1,:))];
        else
            % Se le curve non sono adiacenti, stampa un messaggio di errore
            fprintf('Le curve sono disgiunte\n');
            ppbez=[];
        end
    else
        % Se le curve hanno gradi diversi, stampa un messaggio di errore
        fprintf('Le curve non hanno stesso grado\n');
        ppbez=[];
    end
end

% Funzione che unisce due curve di Bézier a tratti
% invertendo l'ordine dei punti di controllo per la seconda curva
function ppbez = ppbezier_join(pp1, pp2)
    % Inverti l'ordine dei parametri di base e dei punti di controllo di pp2
    pp2.ab = flip(pp2.ab);
    pp2.cp = flip(pp2.cp);
    % Calcola il nuovo vettore dei parametri di base per la curva combinata
    ab_combined = [pp1.ab, pp2.ab(2:end) + pp1.ab(end) - pp2.ab(1)];
    % Calcola i nuovi punti di controllo per la curva combinata
    cp_combined = [pp1.cp; pp2.cp(2:end, :)];
    % Costruisci la struttura della curva combinata
    ppbez.deg = pp1.deg;
    ppbez.ab = ab_combined;
    ppbez.cp = cp_combined;
end

% Funzione che aumenta il grado di una curva di Bézier fino al grado desiderato
function ppo=cambia_grado(ppi,n)
    ppo = ppi;
    while ppo.deg < n
        % Chiama la funzione per aumentare di grado la curva
        ppo = aumenta_grado(ppo);
    end
end

% Funzione che effettivamente aumenta di un grado la curva di Bézier
function ppo = aumenta_grado(ppi)
    % Utilizza la funzione gc_pol_de2d per aumentare il grado
    [ppo.cp(:,1),ppo.cp(:,2)]=gc_pol_de2d(ppi.deg,ppi.cp(:,1),ppi.cp(:,2));
    ppo.deg=ppi.deg+1;
    ppo.ab=ppi.ab;
end

