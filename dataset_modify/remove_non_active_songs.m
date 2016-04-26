function [ active_songs ] = remove_non_active_songs( dataset, k )
%REMOVE_NON_ACTIVE_SONGS Summary of this function goes here
%   Detailed explanation goes here

    songs = unique(dataset(:,2));
    n = 0;
    active_songs = [];
    for song=songs'
        if sum(dataset(dataset(:, 2) == song, 3)) > k
           n = n + 1;
           active_songs = [active_songs; dataset(dataset(:, 2) == song, :)];
        end
    end
end
