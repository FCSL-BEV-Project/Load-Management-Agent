
% set Env
observationDim = [5 1];
observationInfo = rlNumericSpec(observationDim);

actionDim = [1 1];
actionInfo = rlNumericSpec( ...
    actionDim, ...
    'LowerLimit', 0, ...
    'UpperLimit', 1 ...
);


% choices = 1:4;
% actionInfo = rlFiniteSetSpec(choices);


HESS_Env = rlSimulinkEnv( ...
    'HESS', ...
    'HESS/RL-based EMS/DDPG/Agent', ...
    observationInfo, actionInfo ...
);

clear observationDim;
clear observationInfo;

clear choices;
clear actionInfo;