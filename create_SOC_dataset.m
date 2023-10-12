
clearvars
clear

setEnv;
modelName = "HESS";

idx = 1;
time = ["1372" "2474" "1369" "1022" "1477" "1800"];

start_soc_list = linspace(100, 20, 100);
len = size(start_soc_list, 2);

disp('========start simulation!========')


for i = 1:6

    sim_case = i;

    for soc = start_soc_list
        
        Battery.InitialSOC = soc;
        Battery.InitialCharge = Battery.InitialSOC * Battery.Capacity; % Ahr
        res = sim(modelName, "StopTime", time(i));
        
    
        tmp = [
            res.HSOC.signals(1).values';
            res.HSOC.signals(2).values';
            res.HSOC.signals(3).values';
            res.HSOC.signals(4).values';
            res.HSOC.signals(5).values';
        ];
    
        data{idx} = tmp;
    
        idx = idx + 1;
    
    end

end

disp('========finish simulation!========')

data = data';
save data.mat data;