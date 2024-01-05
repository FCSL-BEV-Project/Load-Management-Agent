
% Capacitor Parameter
Capacitor.Cell_Voltage = 2.7; % V
Capacitor.Cell_Capacitance = 100; % F
Capacitor.N_Serial = 5;

Capacitor.Voltage = Capacitor.Cell_Voltage * Capacitor.N_Serial; % V
Capacitor.Capacitance = 1 / (Capacitor.N_Serial / Capacitor.Cell_Capacitance); % F
Capacitor.Coulomb = Capacitor.Voltage * Capacitor.Capacitance; % C
Capacitor.Capacity = Capacitor.Coulomb / 3600; % Ahr

% Battery
Battery.Cell_Voltage = 3.7; % V
Battery.Cell_Capacity = 1.2; % Ahr;
Battery.N_Series = 3;
Battery.N_Parallel = 1;
Battery.Voltage = Battery.Cell_Voltage * Battery.N_Series;
Battery.Capacity = Battery.Cell_Capacity * Battery.N_Parallel;

% calcutate ratio
Total_Capacity = Battery.Capacity + Capacitor.Capacity;
Battery_Rate = Battery.Capacity * 100 / Total_Capacity;
CApacitor_Rate = Capacitor.Capacity * 100 / Total_Capacity;