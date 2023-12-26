
load data.mat

len = size(data);
output_file_path = 'csv/';

for i = 1 : len

    tmp = data{i};
    tmp = tmp';

    filename = sprintf('csv/data%03d.csv', i);
    writematrix(tmp, filename);

end