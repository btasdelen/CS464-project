function [ top_songs ] = collab( training_data, test_user )
%COLLAB Summary of this function goes here
%   Detailed explanation goes here

index = 1:song_no;
test_user_song = index(test_user==1);

similarity = sum(training_data(:,test_user==1),2);

training_data(:,test_user_song) = [];
index(test_user_song) = [];

rank = training_data'*similarity;
rank = full(rank);

top_songs = sort([rank index']);
top_songs = flip(top_songs);
top_songs(1:10, :)

end

