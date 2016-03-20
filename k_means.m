function [l_new,centroids]=k_means(user_id,training_triplet,k)

    user_no = length(user_id);
    song_id = unique(training_triplet(:,2));
    song_no = max(training_triplet(:,2));
    centroids_users = user_id(randperm(user_no,k));
    centroids = zeros(k,song_no);
    for t=1:k
        song_vector = get_song_vector(training_triplet,centroids_users(t))';
        centroids(t,:) = song_vector;
    end
    
%     old and new labels
    l_old = ones(user_no,1);
    l_new = zeros(user_no,1);
    dist = zeros(user_no,k);
    counter = 0;
    while any(l_old ~= l_new)
        counter = counter + 1;
        disp(int2str(counter));
        disp('th cycle starts');
        l_old = l_new;
        
%         loop for centroid
        for t=1:k
            dist(:,t) = zeros(user_no,1);
            
            for s=user_id'
                song_vector = get_song_vector(training_triplet,s);
                dist(s,t) = norm(song_vector - centroids(t,:)');
            end
        end
        [~,l_new]=min(dist,[],2);

        for t=1:k
            for s=1:song_no
                users_in_label_t = user_id(l_new==t);
                triplets_in_label_t = training_triplet(ismember(training_triplet(:,1),users_in_label_t),:);
                sumation = sum(triplets_in_label_t(triplets_in_label_t(:,2)==s,3));
                mean = sumation / length(users_in_label_t);
                
                centroids(t,s) = mean;
            end  
        end
        
    end 
end