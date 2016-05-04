%%
mat = load('../DATASETS/user_song_count_matrix.txt');
data_w_rank = remove_non_active_songs(mat, 5);
data_w_rank = remove_non_active_users(data_w_rank, 5);

clear mat;
%%
%[train, test] = split_dataset(data_table, 1000);
