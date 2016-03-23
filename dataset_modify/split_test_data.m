table = load('../DATASETS/user_song_count_matrix.txt');
%%
training_users = index(1:5000);

training_data = table(ismember(table(:,1),training_users),:);
test_data = table(~ismember(table(:,1),training_users),:);