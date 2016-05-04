% user_song_count_matrix(:,3) = 1;
user_song_count = spconvert(cleaner_data_table);

song_no = size(user_song_count,2);
user_no = size(user_song_count,1);

accuracy = zeros(1,user_no);
tic
for n=1:user_no
    given_songs = 1:song_no;
    user_songs = given_songs(user_song_count(n,:)==1);

    % Seperating hidden, given songs
    given_songs = user_songs(1:ceil(end/2));
    hidden_songs = user_songs(ceil(end/2+1):end);

    % Similarity measurement
    listened = sum(user_song_count(:,given_songs)==1,2);
    rank = listened'*user_song_count;

    % Sort most similar songs
    rank(2,:) = 1:song_no;

    rank(:,given_songs) = [];
    rank = full(rank');
    output = sortrows(rank,-1);
    output = output(:,2);

    accuracy(n) = averagePrecisionAtK(hidden_songs,output(1:500),500);
    if(rem(n,10000)==0)
        n
        toc
    end
end