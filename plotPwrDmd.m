% Power Demand
load Drive-Cycle/FTP72_Power.mat
load Drive-Cycle/FTP75_Power.mat
load Drive-Cycle/HUDDS_Power.mat
load Drive-Cycle/WLTP_Class1_Power.mat
load Drive-Cycle/WLTP_Class2_Power.mat
load Drive-Cycle/WLTP_Class3_Power.mat

figure(1)

subplot(4, 1, 1);
plot(FTP75.time, FTP75.signals.values);
xlabel('time');
ylabel('Power (W)')
title('FTP75')

subplot(4, 1, 2);
plot(WLTP_Class_1.time, WLTP_Class_1.signals.values);
xlabel('time');
ylabel('Power (W)')
xlim([0 1022]);
title('WLTP Class 1')


subplot(4, 1, 3);
plot(WLTP_Class_2.time, WLTP_Class_2.signals.values);
xlabel('time');
ylabel('Power (W)')
title('WLTP Class 2')


subplot(4, 1, 4);
plot(WLTP_Class_3.time, WLTP_Class_3.signals.values);
xlabel('time');
ylabel('Power (W)')
title('WLTP Class 3')




FTP72_max = max(FTP72.signals.values);
FTP75_max = max(FTP75.signals.values);
HUDDS_max = max(HUDDS.signals.values);
WLTP_Class_1_max = max(WLTP_Class_1.signals.values);
WLTP_Class_2_max = max(WLTP_Class_2.signals.values);
WLTP_Class_3_max = max(WLTP_Class_3.signals.values);

list = [
    FTP72_max, ...
    FTP75_max HUDDS_max, ...
    WLTP_Class_1_max, ...
    WLTP_Class_2_max, ...
    WLTP_Class_3_max, ...
];

max_value = max(list)