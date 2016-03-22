data_set =[ 0 1 1 3 4 4;
            1 1 0 0 0 1];
        
tic

k = 2;

[l_new,centroids]=k_means_v2(data_set,k);

toc