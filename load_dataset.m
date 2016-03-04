function [table] = load_dataset(path_to_dataset)
    
    codes_file = pwd;
    cd(path_to_dataset);
    load user_song_count_matrix.txt;
    cd(codes_file);
    for i=1:length(kaggle_visible_evaluation_triplets)
        table(i) = 
    end
end