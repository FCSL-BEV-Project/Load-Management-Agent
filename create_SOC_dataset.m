
clearvars
clear

setEnv;

modelName = "HESS";

idx = 1;
rates = 1:-0.005:0.75;
len = size(rates, 2);


disp('========start simulation!========')

for r = rates

    Split_Rate = r;
    res = sim(modelName, "StopTime", "1800");
    

    tmp = [
        res.HSOC.signals(1).values';
        res.HSOC.signals(2).values';
        res.HSOC.signals(3).values';
        res.HSOC.signals(4).values';
        res.HSOC.signals(5).values';
    ];

    data{idx} = tmp;

    percentage = (idx*100)/len;
    disp(percentage)

    idx = idx + 1;

end

disp('========finish simulation!========')

data = data';
save data.mat data;