
load Results/Active_Bat_SOC.mat
load Results/Active_Cap_Cycle.mat
load Results/Passive_Bat_SOC.mat
load Results/Passive_Cap_Cycle.mat
load Results/RL_Bat_SOC.mat
load Results/RL_Cap_Cycle.mat
load Results/RL_Bat_SOH.mat
load Results/Active_Bat_SOH.mat
load Results/Passive_Bat_SOH.mat

time = Active_Bat_SOC.time;

figure(1)

subplot(3, 1, 2)
hold on

plot(time, Active_Bat_SOC.signals.values, 'r', 'DisplayName', 'Active Assist')
plot(time, Passive_Bat_SOC.signals.values, 'g', 'DisplayName', 'Passive Assist')
plot(time, RL_Bat_SOC.signals.values, 'b', 'DisplayName', 'Combined Assist')

title('Battery SOC')
ylabel('%')
xlabel('time')

legend()

subplot(3, 1, 1)
hold on

plot(time, Active_Cap_Cycle.signals.values(:,:), 'r', 'DisplayName', 'Active Assist')
plot(time, Passive_Cap_Cycle.signals.values(:,:), 'g', 'DisplayName', 'Passive Assist')
plot(time, RL_Cap_Cycle.signals.values(:,:), 'b', 'DisplayName', 'Combined Assist')

title('Ultracapacitor Discharge Cycle')
xlabel('time')

legend()

subplot(3, 1, 3)
hold on

time = 1:size(RL_Bat_SOH, 2);

plot(time, RL_Bat_SOH, 'b', 'DisplayName', 'Combined Assist')
plot(time, Passive_Bat_SOH, 'g', 'DisplayName', 'Passive Assist')
plot(time, Active_Bat_SOH, 'r', 'DisplayName', 'Active Assist')

title('Battery SOH')
xlabel('N Sim')

legend()


