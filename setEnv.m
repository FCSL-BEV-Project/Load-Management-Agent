
clear
clearvars

disp('=======Env Configuration Start!=======')


disp('clear vars ...')


setHESSParam
disp('Load HESS Param ...')

% createDDPGAgent
% createSACAgent
disp('set RL env ...')
setRLEnv;
% load RL_Agent/dqn_agent.mat;


disp('=====Env Configuration Finished!=====')
