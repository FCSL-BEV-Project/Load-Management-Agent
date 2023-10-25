
clear
clearvars

% load data(rate0.5).mat
load data.mat

data = data(randperm(numel(data)));

numChannels = size(data{1}, 1) - 1;
numObservations = numel(data);
numResponse = 1;

idx_Train = 1:floor(0.7 * numObservations);
idx_Test = floor(0.7 * numObservations)+1:numObservations;

data_Train = data(idx_Train);

for n = 1:numel(data_Train)
    X = data_Train{n};
    X_Train{n} = X(1:4, :);
    Y_Train{n} = X(5,   :);
end


data_Test = data(idx_Test);

for n = 1:numel(data_Test)
    X = data_Test{n};
    X_Test{n} = X(1:4, :);
    Y_Test{n} = X(5,   :);
end


layers = [
    sequenceInputLayer(numChannels)
    lstmLayer(256)
    fullyConnectedLayer(128)
    reluLayer
    fullyConnectedLayer(numResponse)
    regressionLayer
];

options = trainingOptions( ...
    "adam", ...
    MaxEpochs=100, ... % 에포크 늘려서 학습시켜봐
    MiniBatchSize=5, ...
    SequencePaddingDirection="left", ...
    Shuffle="never", ...
    Plots="training-progress", ...
    Verbose=0 ...
);



net = trainNetwork(X_Train, Y_Train, layers, options);

save net4.mat net;

%{

% ValidationData={X_Validation, Y_Validation}, ...

[idxTrain, idxValidation, idxTest] = trainingPartitions(numObservations, [0.8 0.1 0.1]);

X_Train = data(idxTrain); X_Train = X_Train(1:4, :);
X_Validation = data(idxValidation); X_Validation = X_Validation(1:4, :);
X_Test = data(idxTest); X_Test = X_Test(1:4, :);

Y_Train = data(idxTrain); Y_Train = Y_Train(5, :);
Y_Validation = data(idxValidation); Y_Validation(5, :);
Y_Test = data(idxTest); Y_Test = Y_Test(5, :);
%}


