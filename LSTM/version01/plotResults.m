

FTP72_SOC_List = [];
FTP75_SOC_List = [];
UDDS_SOC_List = [];
WLTP_Class_1_SOC_List = [];
WLTP_Class_2_SOC_List = [];
WLTP_Class_3_SOC_List = [];

FTP72_input_List = [];
FTP75_input_List = [];
UDDS_input_List = [];
WLTP_Class_1_input_List = [];
WLTP_Class_2_input_List = [];
WLTP_Class_3_input_List = [];



for i = 1:100
    soc_list = data{i}(5, :);
    FTP72_SOC_List = cat(2, FTP72_SOC_List, soc_list);
end

for i = 71:100
    input_list = data{i}(1:4, :);
    FTP72_input_List = cat(2, FTP72_input_List, input_list);
end

FTP72_SOC_List_predict = net.predict(FTP72_input_List);






for i = 101:200
    soc_list = data{i}(5, :);
    FTP75_SOC_List = cat(2, FTP75_SOC_List, soc_list);
end

for i = 171:200
    input_list = data{i}(1:4, :);
    FTP75_input_List = cat(2, FTP75_input_List, input_list);
end

FTP75_SOC_List_predict = net.predict(FTP75_input_List);




for i = 201:300
    soc_list = data{i}(5, :);
    UDDS_SOC_List = cat(2, UDDS_SOC_List, soc_list);
end

for i = 271:300
    input_list = data{i}(1:4, :);
    UDDS_input_List = cat(2, UDDS_input_List, input_list);
end

UDDS_SOC_List_predict = net.predict(UDDS_input_List);




for i = 301:400
    soc_list = data{i}(5, :);
    WLTP_Class_1_SOC_List = cat(2, WLTP_Class_1_SOC_List, soc_list);
end

for i = 371:400
    input_list = data{i}(1:4, :);
    WLTP_Class_1_input_List = cat(2, WLTP_Class_1_input_List, input_list);
end

WLTP_Class_1_SOC_List_predict = net.predict(WLTP_Class_1_input_List);




for i = 401:500
    soc_list = data{i}(5, :);
    WLTP_Class_2_SOC_List = cat(2, WLTP_Class_2_SOC_List, soc_list);
end

for i = 471:500
    input_list = data{i}(1:4, :);
    WLTP_Class_2_input_List = cat(2, WLTP_Class_2_input_List, input_list);
end

WLTP_Class_2_SOC_List_predict = net.predict(WLTP_Class_2_input_List);




for i = 501:600
    soc_list = data{i}(5, :);
    WLTP_Class_3_SOC_List = cat(2, WLTP_Class_3_SOC_List, soc_list);
end

for i = 571:600
    input_list = data{i}(1:4, :);
    WLTP_Class_3_input_List = cat(2, WLTP_Class_3_input_List, input_list);
end

WLTP_Class_3_SOC_List_predict = net.predict(WLTP_Class_3_input_List);




subplot(6, 1, 1)
hold on
plot(1:size(FTP72_SOC_List, 2), FTP72_SOC_List)
offset = size(FTP72_SOC_List, 2) * 0.7;
test_idx = 1:size(FTP72_SOC_List_predict, 2);
plot(test_idx+offset, FTP72_SOC_List_predict);
title('FTP72')
legend('actual', 'predict')
ylabel('SOC')

subplot(6, 1, 2)
hold on
plot(1:size(FTP75_SOC_List, 2), FTP75_SOC_List)
offset = size(FTP75_SOC_List, 2) * 0.7;
test_idx = 1:size(FTP75_SOC_List_predict, 2);
plot(test_idx+offset, FTP75_SOC_List_predict);
title('FTP75')
ylabel('SOC')
legend('actual', 'predict')

subplot(6, 1, 3)
hold on
plot(1:size(UDDS_SOC_List, 2), UDDS_SOC_List)
offset = size(UDDS_SOC_List, 2) * 0.7;
test_idx = 1:size(UDDS_SOC_List_predict, 2);
plot(test_idx+offset, UDDS_SOC_List_predict);
legend('actual', 'predict')
title('UDDS')
ylabel('SOC')

subplot(6, 1, 4)
hold on
plot(1:size(WLTP_Class_1_SOC_List, 2), WLTP_Class_1_SOC_List);
offset = size(WLTP_Class_1_SOC_List, 2) * 0.7;
test_idx = 1:size(WLTP_Class_1_SOC_List_predict, 2);
plot(test_idx+offset, WLTP_Class_1_SOC_List_predict);
legend('actual', 'predict')
title('WLTP Class 1')
ylabel('SOC')

subplot(6, 1, 5)
hold on
plot(1:size(WLTP_Class_2_SOC_List, 2), WLTP_Class_2_SOC_List)
offset = size(WLTP_Class_2_SOC_List, 2) * 0.7;
test_idx = 1:size(WLTP_Class_2_SOC_List_predict, 2);
plot(test_idx+offset, WLTP_Class_2_SOC_List_predict);
legend('actual', 'predict')
title('WLTP Class 2')
ylabel('SOC')

subplot(6, 1, 6)
hold on
plot(1:size(WLTP_Class_3_SOC_List, 2), WLTP_Class_3_SOC_List)
offset = size(WLTP_Class_3_SOC_List, 2) * 0.7;
test_idx = 1:size(WLTP_Class_3_SOC_List_predict, 2);
plot(test_idx+offset, WLTP_Class_3_SOC_List_predict);
legend('actual', 'predict')
title('WLTP Class 3')
ylabel('SOC')
