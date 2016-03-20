tic

k = 700;
user_id = unique(training_data(:,1));

[l_new,centroids]=k_means(user_id,training_data,700);

toc