
clear
clearvars


load data.mat % preprocess에서 저장한 파일 불러오기

numChannels = size(data{1}, 1) - 1;
numObservations = numel(data);

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
    lstmLayer(128)
    fullyConnectedLayer(1)
    regressionLayer
];

options = trainingOptions( ...
    "adam", ...
    MaxEpochs=3, ... % 에포크 늘려서 학습시켜봐
    SequencePaddingDirection="left", ...
    Shuffle="every-epoch", ...
    Plots="training-progress", ...
    Verbose=0 ...
);

net = trainNetwork(X_Train, Y_Train, layers, options);

save net.mat net;





