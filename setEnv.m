
clear
clearvars

disp('=======Env Configuration Start!=======')


disp('clear vars ...')


setHESSParam
disp('Load HESS Param ...')

disp('set RL env ...')
% setDQNEnv;
load RL_Agent/DQN-0929-1.mat;

disp('=====Env Configuration Finished!=====')
