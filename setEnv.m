
disp('=======Env Configuration Start!=======')

setHESSParam
disp('Load HESS Param ...')

disp('set RL env ...')
% setDQNEnv;
% load RL_Agent/DQN-0929-1.mat;
setDDPGEnv

disp('=====Env Configuration Finished!=====')
