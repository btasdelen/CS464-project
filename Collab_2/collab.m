function [ top_songs ] = collab( training_data, test_user )
%COLLAB Summary of this function goes here
%   Detailed explanation goes here

index = 1:size(training_data,2);
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

end

