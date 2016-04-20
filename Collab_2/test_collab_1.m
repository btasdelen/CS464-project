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
temp_test = test_user
test_user = full(test_user);
test_user(50000:end) = 0;

%%
index = 1:song_no;
test_user_song = index(test_user==1);

% similarity = zeros(70000,1);
% index = 1:song_no;
% for n = index(test_user==1)
%    similarity = similarity + training_data(:,n);
% end

% Similarity without FOR
similarity = sum(training_data(:,test_user==1),2);

% Remove songs that already listened
training_data(:,test_user_song) = [];
index(test_user_song) = [];

rank = training_data'*similarity;
rank = full(rank);

top_songs = sortrows([rank index']);
top_songs = flipud(top_songs);
top_songs(1:10,:)
