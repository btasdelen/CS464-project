% user_song_count_matrix = [train;test];
user_song_count_matrix(:,3) = 1;
song_no = length(unique(user_song_count_matrix(:,2)));

big_matrix = spconvert(user_song_count_matrix);

training_data = big_matrix(1:10000,:);


test_user = zeros(1, song_no);

for i=1:10
    test_user(1, user_song_count_matrix(user_song_count_matrix(:,1) == 54036, 2)) = 1;
    test_user(1,120587) = 0;

    collab(user_song_count_matrix, test_user);
end
% index = 1:song_no;
% test_user_song = index(test_user==1);
% 
% similarity = sum(training_data(:,test_user==1),2);
% 
% training_data(:,test_user_song) = [];
% index(test_user_song) = [];
% 
% rank = training_data'*similarity;
% rank = full(rank);
% 
% top_songs = sort([rank index']);
% top_songs = flip(top_songs);
% top_songs(1:10, :)