
clear
clearvars


load Drive-Cycle/FTP75_Power.mat


% Battery Parameter
Battery.NominalVoltage = 340; % V
Battery.InternalResistance = 0.01; % Ohn
Battery.Capacity = 176.47; % Ahr
Battery.V1 = 306;
Battery.AH1 = 88.235;
Battery.InitialCharge = 123.53; % Ahr


% Capacitor Parameter
Capacitor.Cell_Voltage = 2.7; % V
Capacitor.Cell_Capacitance = 1500; % F
Capacitor.Cell_InternalResistance = 0.47; % mOhm
Capacitor.N_Serial = 300;

Capacitor.Voltage = Capacitor.Cell_Voltage * Capacitor.N_Serial; % V
Capacitor.Capacitance = 1 / (Capacitor.N_Serial / Capacitor.Cell_Capacitance); % F
Capacitor.InternalResistance = Capacitor.Cell_InternalResistance * Capacitor.N_Serial; % mOhm
Capacitor.Coulomb = Capacitor.Voltage * Capacitor.Capacitance; % C
Capacitor.Capacity = Capacitor.Coulomb / 3600; % Ahr

