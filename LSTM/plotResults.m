

Y_Pred = predict(net, X_Test, 'MiniBatchSize', 1);

idx = randperm(numel(Y_Pred), 9);

for i = 1:numel(idx)
    subplot(3, 3, i)
    hold on
    x = 1:size(Y_Pred{idx(i)}, 2);
    plot(x, Y_Pred{idx(i)}, 'b', 'DisplayName', 'Estimation')
    plot(x, Y_Test{idx(i)}, 'r', 'DisplayName', 'Actual')

    title("Test idx : " + idx(i))
    xlabel('time')
    ylabel('SOC')
    legend()
end