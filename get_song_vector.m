function songs = get_song_vector(training_triplet, user_id)
    song_no = max(training_triplet(:,2));
    songs = zeros(song_no,1);
    
    users_vector = training_triplet(training_triplet(:,1)==user_id,:);
    
    songs(users_vector(:,2)) = users_vector(:,3);
end