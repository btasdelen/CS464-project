training_users = unique(index(1:5000));
pointer_songs = unique(training_data(:, 2));

user_no = length(training_users);
song_no = length(pointer_songs);

big_matrix = zeros(song_no, user_no);

% for t = 1:user_no
%     
%     for k = 1:song_no
%         big_matrix(k, t) = training_data()
%     end
% end

for n=1:length(training_data)
    big_matrix(find(pointer_songs == training_data(n,2)),find(training_users == training_data(n,1))) = training_data(n,3);
end

% [labels,centers] = kmeans(big_matrix', 70)