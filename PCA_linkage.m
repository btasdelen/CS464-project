tic
load('DATASETS/cleaner_dataset.mat');

k = 600;

data = spconvert(cleaner_data_table);

train_user = data(1:30000,:);
test_user = data(30001:end,:);

song_no = size(data,2);

sigma = (train_user'*train_user)/size(train_user,1);

[U,S,V] = svds(sigma, 16);
tr=train_user*U;
tree = linkage(tr, 'average', 'cosine');
idx = cluster(tree, 'maxclust', k);

for clt = 1:k
   C(clt, :) = sum(tr(idx == clt,:), 1)/length(tr(idx == clt));
end

%%
accuracy = zeros(size(test_user,1),1);
tic
for n=1:size(test_user,1)
    curr_user = test_user(n,:);
    given_songs = 1:song_no;
    user_songs = given_songs(curr_user==1);

    % Seperating hidden, given songs
    given_songs = user_songs(1:ceil(end/2));
    hidden_songs = user_songs(ceil(end/2+1):end);

    given_song_vector = zeros(song_no,1);
    given_song_vector(given_songs) = 1;

    trial=given_song_vector'*U;
    dist=C-repmat(trial, k, 1);
    distance=sqrt(sum(dist.^2,2));
    [sorted , index] = sort(distance);
   
    rank=sum(train_user(idx==index(1),:),1);
    rank(2,:) = 1:song_no;

    rank(:,given_songs) = [];
    rank = full(rank');
    output = sortrows(rank,-1);
    output = output(:,2);

    accuracy(n) = averagePrecisionAtK(hidden_songs,output(1:500),500);
    if(rem(n,1000)==0)
        n
        toc
    end
end