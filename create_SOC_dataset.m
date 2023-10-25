
clearvars
clear

setEnv;
modelName = "HESS";

idx = 1;
time = ["1372" "2474" "1369" "1022" "1477" "1800"];

start_soc_list = linspace(1, 0.2, 100);
len = size(start_soc_list, 2);

disp('========start simulation!========')


for i = 1:6

    sim_case = i;

    for soc = start_soc_list
        
        Battery.InitialSOC = soc;
        Battery.Capacity = Battery.InitialCapacity * Battery.SOH; % Ahr
        Battery.InitialCharge = Battery.InitialSOC * Battery.Capacity; % Ahr
        res = sim("HESS.slx", "StopTime", time(i));
        
    
        tmp = [
            res.HSOC.signals(1).values';
            res.HSOC.signals(2).values';
            res.HSOC.signals(3).values';
            res.HSOC.signals(4).values';
            res.HSOC.signals(5).values';
        ];
    
        data{idx} = tmp;
    
        fprintf("idx : %d\n", idx);
        idx = idx + 1;
    
    end

end

disp('========finish simulation!========')

data = data';
save LSTM\data.mat data;