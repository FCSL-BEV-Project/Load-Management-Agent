

layers = [
    sequenceInputLayer(4)
    lstmLayer(128, 'OutputMode', 'sequence')
    dropoutLayer(0.2)
    lstmLayer(128, 'OutputMode', 'last')
    dropoutLayer(0.2)
    fullyConnectedLayer(64)
    reluLayer
    fullyConnectedLayer(1)
    regressionLayer
];

options = trainingOptions('adam', ...
    'MaxEpochs', 100, ...
    'MiniBatchSize', 5, ...
    'InitialLearnRate', 0.005, ...
    'SequencePaddingDirection', 'left', ...
    'Plots', 'training-progress', ...
    'Verbose', 0 ...
);

net = trainNetwork(X_Train, Y_Train, layers, options);

save net.mat net;





