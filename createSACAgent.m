



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
    'HESS/RL-based EMS/RL/Agent', ...
    observationInfo, actionInfo ...
);


% ===================Critic===================
% Observation path
obsPath = [
    featureInputLayer(4, Name="obsPathIn")
    fullyConnectedLayer(64)
    reluLayer
    fullyConnectedLayer(64, Name="obsPathOut")
];

% Action path
actPath = [
    featureInputLayer(2, Name="actPathIn")
    fullyConnectedLayer(64)
    reluLayer
    fullyConnectedLayer(64, Name="actPathOut")
];

% Common path
commonPath = [
    concatenationLayer(1,2,Name="concat")
    reluLayer
    fullyConnectedLayer(1)
];

% Add layers to layergraph object
criticNet = layerGraph;
criticNet = addLayers(criticNet,obsPath);
criticNet = addLayers(criticNet,actPath);
criticNet = addLayers(criticNet,commonPath);

% Connect layers
criticNet = connectLayers(criticNet,"obsPathOut","concat/in1");
criticNet = connectLayers(criticNet,"actPathOut","concat/in2");

criticNet1 = dlnetwork(criticNet);
criticNet2 = dlnetwork(criticNet);

critic1 = rlQValueFunction( ...
    criticNet1,observationInfo,actionInfo, ...
    ActionInputNames="actPathIn",ObservationInputNames="obsPathIn" ...
);

critic2 = rlQValueFunction( ...
    criticNet2,observationInfo,actionInfo, ...
    ActionInputNames="actPathIn",ObservationInputNames="obsPathIn" ...
);

% ===================Actor===================
% Define common input path
commonPath = [
    featureInputLayer(4, Name="netObsIn")
    fullyConnectedLayer(64)
    reluLayer(Name="CommonRelu")
];

% Define path for mean value
meanPath = [
    fullyConnectedLayer(64, Name="meanIn")
    reluLayer
    fullyConnectedLayer(64)
    reluLayer
    fullyConnectedLayer(2, Name="MeanOut")
];

% Define path for standard deviation
stdPath = [
    fullyConnectedLayer(64,Name="stdIn")
    reluLayer
    fullyConnectedLayer(64)
    reluLayer
    fullyConnectedLayer(2)
    softplusLayer(Name="StandardDeviationOut")
    %softmaxLayer(Name="StandardDeviationOut")
];

% Add layers to layerGraph object 
actorNet = layerGraph(commonPath);
actorNet = addLayers(actorNet,meanPath);
actorNet = addLayers(actorNet,stdPath);

% Connect layers
actorNet = connectLayers(actorNet,"CommonRelu","meanIn/in");
actorNet = connectLayers(actorNet,"CommonRelu","stdIn/in");

% Convert to dlnetwork and display the number of weights.
actorNet = dlnetwork(actorNet);

actor = rlContinuousGaussianActor( ...
    actorNet, observationInfo, actionInfo, ...
    ActionMeanOutputNames="MeanOut",...
    ActionStandardDeviationOutputNames="StandardDeviationOut",...
    ObservationInputNames="netObsIn" ...
);

% ===================Options===================
criticOptions = rlOptimizerOptions( ...
    Optimizer="adam", ...
    LearnRate=1e-3,... 
    GradientThreshold=1, ...
    L2RegularizationFactor=2e-4 ...
);

actorOptions = rlOptimizerOptions( ...
    Optimizer="adam", ...
    LearnRate=1e-3,...
    GradientThreshold=1, ...
    L2RegularizationFactor=1e-5 ...
);


agentOptions = rlSACAgentOptions;
%{
agentOptions.SampleTime = env.Ts;
agentOptions.DiscountFactor = 0.99;
agentOptions.TargetSmoothFactor = 1e-3;
agentOptions.ExperienceBufferLength = 1e6;
agentOptions.MiniBatchSize = 32;
%}

agentOptions.CriticOptimizerOptions = criticOptions;
agentOptions.ActorOptimizerOptions = actorOptions;

% ===================CreateAgent===================
agent = rlSACAgent(actor,[critic1 critic2],agentOptions);


% clear vars
clear observationDim;
clear observationInfo;
clear actionDim;
clear actionInfo;
clear obsPath;
clear actPath;
clear commonPath;
clear criticNet;
clear criticNet1;
clear criticNet2;
clear meanPath;
clear stdPath;
clear actorNet
clear critic1;
clear critic2;
clear actor;
clear criticOptions;
clear actorOptions;
clear agentOptions;
