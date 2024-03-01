% D�finition du syst�me diff�rentiel � r�soudre : �quation de mouvement d'un pendule libre amorti

function dQn=eq_mvt_pendule(tn,Qn,data)
% Fonction retournant dQ en fonction de t et Q, � l'instant n

% R�cup�ration des valeurs num�riques utiles
m=data.m;
k=data.k;
c=data.c;

% Syst�me diff�rentiel �crit sous forme matricielle (repr�sentation d'�tat)
z=Qn(1); % d�placement
dz=Qn(2); % vitesse
U=[0 m;1 0]; % matrice U=[0 m;1 0]
F=[-k*z-c*dz;dz]; % second membre F = [ -k*z-c*dz ; dz]
dQn=U\F; % �quivalent � inv(U)*F mais bien plus efficace

% Remarque : Le syst�me diff�rentiel peut aussi �tre �crit �quation par �quation
% dQn=zeros(2,1);
% dQn(2)=1/m*(-k*Qn(1)-c*Qn(2));
% dQn(1)=Qn(2);
