% user_song_count_matrix(:,3) = 1;
user_song_count = spconvert(cleaner_data_table);

song_no = size(user_song_count,2);
user_no = size(user_song_count,1);

song_listened_no = sum(user_song_count,1);
[~,index] = sort(song_listened_no,'descend');

accuracy = zeros(1,user_no);
tic
for n=1:user_no
    given_songs = 1:song_no;
    user_songs = given_songs(user_song_count(n,:)==1);
    if length(user_songs)<2
        n
    end
    given_songs = user_songs(1:ceil(end/2));
    hidden_songs = user_songs(ceil(end/2+1):end);
    output = index;
    output(ismember(output,given_songs)) = [];
    
    accuracy(n) = averagePrecisionAtK(hidden_songs,output(1:500),500);
    if(rem(n,10000)==0)
        n
        toc
    end
end