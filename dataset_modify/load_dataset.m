function [ table ] = load_dataset( path_to_dataset )
%LOAD_DATASET Summary of this function goes here
%   Detailed explanation goes here
    codes_file = pwd;
    cd(path_to_dataset);
    load user_song_count_matrix.txt;
    table = user_song_count_matrix;
    cd(codes_file);
end

