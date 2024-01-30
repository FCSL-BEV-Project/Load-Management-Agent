
% Power Demand
load Drive-Cycle/FTP72_Power.mat
load Drive-Cycle/FTP75_Power.mat
load Drive-Cycle/HUDDS_Power.mat
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
Battery.Cell_Voltage = 3.6; % V
Battery.Cell_Capacity = 3; % Ahr
Battery.Cell_InternalResistance = 0.028; % Ohm
Battery.N_Serial = 84;
Battery.N_Parallel = 50;

Battery.NominalVoltage = Battery.Cell_Voltage * Battery.N_Serial; % V
Battery.InternalResistance = 0.01; % Ohm          Battery.Cell_InternalResistance * Battery.N_Serial; % Ohm
Battery.InitialCapacity = Battery.Cell_Capacity * Battery.N_Parallel; % Ahr
Battery.Wh = Battery.NominalVoltage * Battery.InitialCapacity;
Battery.kWh = Battery.Wh / 1000;

% Battery.NominalVoltage = 340; % V
% Battery.InternalResistance = 0.01; % Ohm
% Battery.InitialCapacity = 176.47; % Ahr

Battery.V1 = Battery.NominalVoltage * 0.9; % 306;
Battery.AH1 = Battery.InitialCapacity * 0.5; % 88.235;
Battery.SOH = 1;
Battery.InitialSOC = 1;
Battery.Capacity = Battery.InitialCapacity * Battery.SOH; % Ahr
Battery.InitialCharge = Battery.InitialSOC * Battery.Capacity; % Ahr

% Capacitor Parameter
Capacitor.Cell_Voltage = 2.7; % V
Capacitor.Cell_Capacitance = 3000; % F
% Capacitor.Cell_InternalResistance = 1; % mOhm        %0.47; % Ohm
Capacitor.Cell_InternalResistance = 0.47; % Ohm
Capacitor.N_Serial = 111;

Capacitor.Voltage = Capacitor.Cell_Voltage * Capacitor.N_Serial; % V
Capacitor.Capacitance = 1 / (Capacitor.N_Serial / Capacitor.Cell_Capacitance); % F
% Capacitor.InternalResistance = Capacitor.Cell_InternalResistance * Capacitor.N_Serial; % mOhm % *0.001; %0.1043
Capacitor.InternalResistance = Capacitor.Cell_InternalResistance * Capacitor.N_Serial * 0.001; % mOhm
Capacitor.Coulomb = Capacitor.Voltage * Capacitor.Capacitance; % C
Capacitor.Capacity = Capacitor.Coulomb / 3600; % Ahr
Capacitor.Wh = Capacitor.Voltage * Capacitor.Capacity;
Capacitor.kWh = Capacitor.Wh / 1000;


% Split Rate
Split_Rate = 0.9;

% Drive Cycle
sim_case = 6;
% sim_case = randi([4 6], 1, 1);

Max_Power = 100000; % W