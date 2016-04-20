song_no = 6;

trainining_full=[1 0 0 1 1 0;
                 0 1 0 1 0 1;
                 1 0 1 0 0 0;
                 1 1 1 1 0 0;
                 0 0 1 1 1 1];
training_data = sparse(trainining_full);

test_user = [0 0 0 1 0 1];

index = 1:song_no;
test_user_song = index(test_user==1);

similarity = sum(training_data(:,test_user==1),2);

training_data(:,test_user_song) = [];
index(test_user_song) = [];

rank = training_data'*similarity;
rank = full(rank);

top_songs = sort([rank index']);
top_songs = flip(top_songs)