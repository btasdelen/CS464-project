load cleaned_dataset.mat
% user_song_count_matrix(:,3) = 1;
user_song_count = spconvert(cleaner_data_table);

song_no = size(user_song_count,2);
user_no = size(user_song_count,1);

accuracy = zeros(1,user_no);
tic
for n=20001:30000
    user_song_count = spconvert(cleaner_data_table);
    song_no_of_user = sum(user_song_count,2);
    given_songs = 1:song_no;
    user_songs = given_songs(user_song_count(n,:)==1);

    % Seperating hidden, given songs
    given_songs = user_songs(1:ceil(end/2));
    hidden_songs = user_songs(ceil(end/2+1):end);

    given_song_vector = zeros(song_no,1);
    given_song_vector(given_songs) = 1;
    
    % Remove test user
    user_song_count(n,:) = [];
    song_no_of_user(n) = [];
    
    % Similarity measurement
    similarity = user_song_count*given_song_vector;
    similarity = similarity./song_no_of_user;
    
    rank = similarity'*user_song_count;

    % Sort most similar songs
    rank(2,:) = 1:song_no;

    rank(:,given_songs) = [];
    rank = full(rank');
    output = sortrows(rank,-1);
    output = output(:,2);

    accuracy(n) = averagePrecisionAtK(hidden_songs,output(1:500),500);
    if(rem(n,1000)==0)
        n
        toc
    end
end

% % Similarity without FOR
% similarity = sum(training_data(:,test_user==1),2);
% 
% % Remove songs that already listened
% training_data(:,test_user_song) = [];
% index(test_user_song) = [];
% 
% rank = training_data'*similarity;
% rank = full(rank);
% 
% top_songs = sortrows([rank index']);
% top_songs = flipud(top_songs);
% top_songs(1:10,:)