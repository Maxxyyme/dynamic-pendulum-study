% Définition du système différentiel à résoudre : équation de mouvement d'un pendule libre amorti

function dQn=eq_mvt_pendule(tn,Qn,data)
% Fonction retournant dQ en fonction de t et Q, à l'instant n

% Récupération des valeurs numériques utiles
m=data.m;
k=data.k;
c=data.c;

% Système différentiel écrit sous forme matricielle (représentation d'état)
z=Qn(1); % déplacement
dz=Qn(2); % vitesse
U=[0 m;1 0]; % matrice U=[0 m;1 0]
F=[-k*z-c*dz;dz]; % second membre F = [ -k*z-c*dz ; dz]
dQn=U\F; % équivalent à inv(U)*F mais bien plus efficace

% Remarque : Le système différentiel peut aussi être écrit équation par équation
% dQn=zeros(2,1);
% dQn(2)=1/m*(-k*Qn(1)-c*Qn(2));
% dQn(1)=Qn(2);
