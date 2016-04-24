tic
load('cleaned_dataset.mat');

data = spconvert(data_table);

train_user = data(1:67715,:);
test_user = data(67716:end,:);

song_no = size(data,2);

sigma = (train_user'*train_user)/size(train_user,1);

[U,S,V] = svds(sigma);
tr=train_user*U;
[idx,C] = kmeans(tr,331,'MaxIter',300);
%%
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
    dist=C-repmat(trial, 331, 1);
    distance=sqrt(sum(dist.^2,2));
    [sorted , index] = sort(distance);
   
    similarity=sum(train_user(idx==index(1),:),1);
    similarity(2) = 1:song_no;
    
    similarity(given_songs) = [];
    
    % Similarity measurement

    
    
%     rank = similarity'*user_song_count;

    % Sort most similar songs
    rank(2,:) = 1:song_no;

    rank(:,given_songs) = [];
    rank = full(rank');
    output = sortrows(rank,-1);
    output = output(:,2);

    accuracy(n) = measure_accuracy(output(1:500),hidden_songs);
    if(rem(n,10000)==0)
        n
        
    end
end