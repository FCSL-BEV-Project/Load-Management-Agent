
clearvars
clear

setEnv;
modelName = "HESS";

idx = 1;
rates = linspace(1, 0.7, 50);
len = size(rates, 2);
time = ["1372" "2474" "1369" "1022" "1477" "1800"];

disp('========start simulation!========')


for i = 1:6

    sim_case = i;

    for r = rates

        Split_Rate = r;
        res = sim(modelName, "StopTime", time(i));
        
    
        tmp = [
            res.HSOC.signals(1).values';
            res.HSOC.signals(2).values';
            res.HSOC.signals(3).values';
            res.HSOC.signals(4).values';
            res.HSOC.signals(5).values';
        ];
    
        data{idx} = tmp;
    
        percentage = (idx*100)/(len*6);
        disp(percentage)
    
        idx = idx + 1;
    
    end

end

disp('========finish simulation!========')

data = data';
save data.mat data;