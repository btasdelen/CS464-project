function [l_new,centroids]=k_means(user_id,training_triplet,k)

    user_no = length(user_id);
    song_id = unique(training_triplet(:,2));
    song_no = length(song_id);
    centroids=user_id(ceil(rand(k,1)*user_no),:);
    
%     old and new labels
    l_old = ones(user_no,1);
    l_new = zeros(user_no,1);
    dist = zeros(user_no,k);
    
    while any(l_old ~= l_new)
        
        l_old = l_new;
        
%         loop for centroid
        for t=1:k
            dist(:,t) = zeros(user_no,1);
            
            for s=user_id
                song_vector = get_song_vetor(training_triplet,s);
                dist(s,t) = norm(song_vector - centroids(t));
            end
        end
        [~,l_new]=min(D,[],2);

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