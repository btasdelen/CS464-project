%%
mat = load('../DATASETS/user_song_count_matrix.txt');
mat(:, 3) = 1; 
data_table = remove_non_active_users(mat, 5);
data_table = remove_non_active_songs(data_table, 5);
clear mat;
%%
[train, test] = split_dataset(data_table, 1000);
