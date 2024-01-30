
% Capacitor Parameter - Maxwell BCAP3000
Capacitor.Cell_Voltage = 2.7; % V
Capacitor.Cell_Capacitance = 3000; % F
Capacitor.N_Serial = 111;
Capacitor.Cell_Resistance = 1; % mOhm

Capacitor.Voltage = Capacitor.Cell_Voltage * Capacitor.N_Serial; % V
Capacitor.Capacitance = 1 / (Capacitor.N_Serial / Capacitor.Cell_Capacitance); % F
Capacitor.Coulomb = Capacitor.Voltage * Capacitor.Capacitance; % C
Capacitor.Capacity = Capacitor.Coulomb / 3600; % Ahr
Capacitor.Resistance = Capacitor.Cell_Resistance * Capacitor.N_Serial; % mOhm
Capacitor.Wh = Capacitor.Capacity * Capacitor.Voltage; % Wh
Capacitor.kWh = Capacitor.Wh / 1000;

% Battery
Battery.Cell_Voltage = 3.6; % V
Battery.Cell_Capacity = 3; % Ahr;
Battery.Cell_Resistance = 0.028; % Ohm
Battery.N_Serial = 84;
Battery.N_Parallel = 50;

Battery.Voltage = Battery.Cell_Voltage * Battery.N_Serial;
Battery.Capacity = Battery.Cell_Capacity * Battery.N_Parallel;
Battery.Resistance = Battery.Cell_Resistance * Battery.N_Serial;
Battery.Wh = Battery.Capacity * Battery.Voltage;
Battery.kWh = Battery.Wh / 1000;

% calcutate ratio
Ahr_Total_Capacity = Battery.Capacity + Capacitor.Capacity; % Ahr
Ahr_Battery_Rate = Battery.Capacity / Ahr_Total_Capacity;
Ahr_Capacitor_Rate = Capacitor.Capacity / Ahr_Total_Capacity;

Wh_Total_Capacity = Capacitor.Wh + Battery.Wh;
Wh_Battery_Rate = Battery.Wh / Wh_Total_Capacity;
Wh_Capacitor_Rate = Capacitor.Wh / Wh_Total_Capacity;