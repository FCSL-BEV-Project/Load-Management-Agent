
load data.mat

cycle1 = 1:100;
cycle2 = 101:200;
cycle3 = 201:300;
cycle4 = 301:400;
cycle5 = 401:500;
cycle6 = 501:600;

idx_Train = [];
idx_Test = [];

idx_Train = cat(2, idx_Train, cycle1(1:70));
idx_Test = cat(2, idx_Test, cycle1(71:100));

idx_Train = cat(2, idx_Train, cycle2(1:70));
idx_Test = cat(2, idx_Test, cycle2(71:100));

idx_Train = cat(2, idx_Train, cycle3(1:70));
idx_Test = cat(2, idx_Test, cycle3(71:100));

idx_Train = cat(2, idx_Train, cycle4(1:70));
idx_Test = cat(2, idx_Test, cycle4(71:100));

idx_Train = cat(2, idx_Train, cycle5(1:70));
idx_Test = cat(2, idx_Test, cycle5(71:100));

idx_Train = cat(2, idx_Train, cycle6(1:70));
idx_Test = cat(2, idx_Test, cycle6(71:100));

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