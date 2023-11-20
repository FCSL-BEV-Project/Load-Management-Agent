
% set Env
observationDim = [3 1];
observationInfo = rlNumericSpec(observationDim);

actionDim = [1 1];
actionInfo = rlNumericSpec( ...
    actionDim, ...
    'LowerLimit', 0, ...
    'UpperLimit', 1 ...
);

HESS_Env = rlSimulinkEnv( ...
    'HESS', ...
    'HESS/RL-based EMS/DDPG/Agent', ...
    observationInfo, actionInfo ...
);

HESS_Env.ResetFcn = @(in) myResetFunc(in);
HESS_Env.UseFastRestart = 'off';

clear observationDim;
clear observationInfo;

clear choices;
clear actionInfo;
clear actionDim;