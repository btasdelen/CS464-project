function [table] = load_training_data(path_to_dataset)

    codes_file = pwd;
    cd(path_to_dataset);
    load training_data.mat;
    table = training_data;
    cd(codes_file);
end