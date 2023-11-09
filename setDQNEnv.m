
% set Env
observationDim = [3 1];
observationInfo = rlNumericSpec(observationDim);

choices = 1:11;
actionInfo = rlFiniteSetSpec(choices);


HESS_Env = rlSimulinkEnv( ...
    'HESS', ...
    'HESS/RL-based EMS/DQN/Agent', ...
    observationInfo, actionInfo ...
);

clear observationDim;
clear observationInfo;

clear choices;
clear actionInfo;