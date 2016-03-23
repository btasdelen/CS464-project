cd ('..')

songs_sums_user = zeros(1, length(unique(user_song_count_matrix(:,1)')));
for users=unique(user_song_count_matrix(:,1)')
   songs_sums_user(users) = sum(get_song_vector(user_song_count_matrix, users));
end