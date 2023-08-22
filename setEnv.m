
clear
clearvars


% Power Demand
load Drive-Cycle/FTP72_Power.mat
load Drive-Cycle/FTP75_Power.mat
load Drive-Cycle/UDDS_Power.mat
load Drive-Cycle/WLTP_Class1_Power.mat
load Drive-Cycle/WLTP_Class2_Power.mat
load Drive-Cycle/WLTP_Class3_Power.mat

%{
Power_Demand.FTP72 = FTP72;
Power_Demand.FTP75 = FTP75;
Power_Demand.UDDS = UDDS;
Power_Demand.WLTP_Class1 = WLTP_Class_1;
Power_Demand.WLTP_Class2 = WLTP_Class_2;
Power_Demand.WLTP_Class3 = WLTP_Class_3;
%}


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
Capacitor.N_Serial = 222;

Capacitor.Voltage = Capacitor.Cell_Voltage * Capacitor.N_Serial; % V
Capacitor.Capacitance = 1 / (Capacitor.N_Serial / Capacitor.Cell_Capacitance); % F
Capacitor.InternalResistance = Capacitor.Cell_InternalResistance * Capacitor.N_Serial; % mOhm
Capacitor.Coulomb = Capacitor.Voltage * Capacitor.Capacitance; % C
Capacitor.Capacity = Capacitor.Coulomb / 3600; % Ahr

