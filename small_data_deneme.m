data_set =[ 1 2 1;
            2 1 1;
            2 2 1;
            3 1 1;
            4 1 4;
            5 1 4;
            5 2 1;
            6 1 5];
        
tic

k = 2;
user_id = [1;2;3;4;5;6];

[l_new,centroids]=k_means(user_id,data_set,2);

toc