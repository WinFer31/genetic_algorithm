% Credits: Panchenko Dmitriy (D.Panchenko@stud.satbayev.university)

dt = 0.01;
PopSize = 25;
MaxGenerations = 4;

% thestate = rng;
% rng(thestate)

s = tf('s');
G = 0.07144/(s^2+0.02872*s+0.001539); % Define tf

lb = [0.01 0 0];   % Lower bounds
ub = [5 5 5];  % Upper bounds

options = optimoptions(...
    @ga,...
    'PopulationSize',PopSize,...
    'MaxGenerations',MaxGenerations,...
    'OutputFcn',@mutation);

[x,fval] = ga(...
    @(K)pid_test(G,dt,K),...
    3,-eye(3),zeros(3,1),...
    [],[],lb,ub,[],options);

% save thestate_4.mat thestate
