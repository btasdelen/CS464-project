%tic
%load('cleaned_dataset.mat');

data = spconvert(cleaner_data_table);

train_user = data(1:65536,:);
test_user = data(65537:end,:);

song_no = size(data,2);

sigma = (train_user'*train_user)/size(train_user,1);

[U,S,V] = svds(sigma,16);
%%
tr=train_user*U;
%%
[idx,C] = kmeans(tr,250,'MaxIter',300);
