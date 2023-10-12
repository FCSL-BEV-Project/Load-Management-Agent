
format long

Battery.SOH = 1;

setEnv;

i = 1:100;
Bat_SOH = zeros(1, size(i, 2), 'double');
Bat_SOH = [];

for index = i
    res = sim('HESS.slx');
    Bat_SOH(index) = res.Bat_SOH.signals.values(:,:,end);
    Battery.SOH = res.Bat_SOH.signals.values(:,:,end);
    Battery.Capacity = Battery.InitialCapacity * Battery.SOH; % Ahr
    Battery.InitialCharge = Battery.InitialSOC * Battery.Capacity; % Ahr
end