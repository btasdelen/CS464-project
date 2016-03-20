tic

k = 700;
user_id = unique(training_data(:,1));
[l_new,centroids]=k_means(user_id,training_data,700);
save ('results_3_20_2309.mat','l_new','centroids');
toc