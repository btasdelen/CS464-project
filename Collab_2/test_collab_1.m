mat = load('../DATASETS/user_song_count_matrix.txt');
mat(:, 3) = 1; 
data_table = spconvert(mat);
clear mat;

song_no = size(data_table,2);
user_no = size(data_table,1);

%%
% Split training-test data
training_users = randperm(110000);

training_data = data_table(training_users(1:70000),:);
test_data = data_table(training_users(70001:end),:);
%%
test_user = test_data(1,:);
test_user = full(test_user);

similarity = zeros(70000,1);
index = 1:song_no;
for n = index(test_user==1)
   similarity = similarity + training_data(:,n);
end