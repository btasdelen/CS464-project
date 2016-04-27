load('../DATASETS/cleaner_dataset.mat');

data = spconvert(cleaner_data_table);

train_user = data(1:67715,:);
test_user = data(67716:end,:);

song_no = size(data,2);

sigma = (train_user'*train_user)/size(train_user,1);

[U,S,V] = svds(sigma,13);
%%
tr=train_user*U;
%%
[labels, label_scores] = dbscan(tr, 0.01, 5);