function [ active_users ] = remove_non_active_users( dataset, k )
%REMOVE_NON_ACTIVE_USERS Summary of this function goes here
%   Detailed explanation goes here

    users = unique(dataset);
    n = 0;
    active_users = [];
    for user=users'
        row_num = sum(dataset(dataset(:, 1) == user, 3));
        if  row_num(1) > k
           n = n + 1;
           active_users = [active_users; dataset(dataset(:, 1) == user, :)];
        end
    end
end

