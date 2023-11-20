
disp('=======Env Configuration Start!=======')

setHESSParam
disp('Load HESS Param ...')

disp('set RL env ...')

% load RL_Agent/DQN-0929-1.mat;
% load RL_Agent/DDPG_Agent_Trained_1106.mat
setDDPGEnv
load RL_Agent/Default_DDPG_Agent.mat
% setDQNEnv;

disp('=====Env Configuration Finished!=====')
