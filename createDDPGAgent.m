



% set Env
observationDim = [4 1];
observationInfo = rlNumericSpec(observationDim);

actionDim = [2 1];
actionInfo = rlNumericSpec( ...
    actionDim, ...
    'LowerLimit', 0, ...
    'UpperLimit', 1 ...
);

HESS_Env = rlSimulinkEnv( ...
    'HESS', ...
    'HESS/Load Split Controller/RL/Agent', ...
    observationInfo, actionInfo ...
);




% actor
actnet = [
    featureInputLayer(4, 'Name', 'obs')
    fullyConnectedLayer(128, 'Name', 'hidden1')
    reluLayer('Name', 'relu1')
    fullyConnectedLayer(128, 'Name', 'hidden2')
    reluLayer('Name', 'relu2')
    fullyConnectedLayer(64, 'Name', 'hidden3')
    reluLayer('Name', 'relu3')
    fullyConnectedLayer(2, 'Name', 'act')
    % softmaxLayer('Name', 'act')
];

actor = rlDeterministicActorRepresentation( ...
    actnet, ...
    observationInfo, ...
    actionInfo, ...
    "Observation",'obs','Action', 'act' ...
);

% critic
obsPath = [
    featureInputLayer(4, 'Name','obs')
    fullyConnectedLayer(128, 'Name', 'hidden1')
    reluLayer('Name', 'relu1')
    additionLayer(2, 'Name', 'add')
    reluLayer('Name', 'relu2')
    fullyConnectedLayer(64, 'Name', 'hidden2')
    reluLayer('Name', 'relu3')
    fullyConnectedLayer(1, 'Name', 'value')
];

actPath = [
    featureInputLayer(2, 'Normalization','none', 'Name','act')
    fullyConnectedLayer(128, 'Name', 'fcact')
];

qvalnet = layerGraph(obsPath);
qvalnet = addLayers(qvalnet, actPath);
qvalnet = connectLayers(qvalnet, 'fcact', 'add/in2');

critic = rlQValueRepresentation( ...
    qvalnet, observationInfo, actionInfo, ...
    'Observation', 'obs', 'Action', 'act' ...
);

% agent

options = rlDDPGAgentOptions;
options.ExperienceBufferLength = 1000000;
options.DiscountFactor = 0.999;
options.TargetSmoothFactor = 0.005;
options.MiniBatchSize = 1024;


agent = rlDDPGAgent(actor, critic, options);


% clear trash
clear actionDim;
clear actionInfo;
clear actnet;
clear actor;
clear actPath;
clear critic;
clear observationDim;
clear observationInfo;
clear obsPath;
clear options;
clear qvalnet;














