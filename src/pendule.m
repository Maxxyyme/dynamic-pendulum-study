% Résolution de l'équation de mouvement d'un pendule libre amorti
%   mz''+cz'+kz=0

clear all;
close all;

% Définition des constantes du système

m=0.1; % en kg
c=0.4; % en N.s/m
k=4000; % en N/m

% Sauvegarde des données numériques dans la structure data
data=struct('m',m,'c',c,'k',k);

% Définition du temps d'observation
ti=0;
tf=3;
tspan=[ti tf]; % span=durée

% Définition des Conditions Initiales
Q0=[1 ; 0]; % Q0=[q(0) ; q'(0)]

% Intégration du système différentiel
[t,Q]=ode45(@(t,Q) eq_mvt_pendule(t,Q,data),tspan,Q0);        

% En sortie :   t est un vecteur colonne 
%               Q est une matrice de 2 colonnes 
%               première colonne : position z = Q(:,1)
z = Q(:,1);
%               deuxième colonne : vitesse z' = Q(:,2)
dz = Q(:,2);
                               

% Tracé des courbes position et vitesse du pendule en fonction du temps

plot(t,z,'r')      
title('Déplacement en fonction de t')
xlabel('t [s]')
ylabel('z [m]')
grid on

figure % nouvelle fenêtre graphique

plot(t,dz,'b')      
title('Vitesse en fonction de t')
xlabel('t [s]')
ylabel('v [m/s]')
grid on
