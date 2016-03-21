function [labels,centroids] = k_means_v2(big_matrix,k)

    user_no = size(big_matrix,2);
    
    centroids = big_matrix(:,randperm(user_no,k));
    
    l_old = ones(1,user_no);
    l_new = zeros(1,user_no);
    
    big_matrix_fixed = big_matrix;
    
    dist = zeros(k,user_no);
    while any(l_old ~= l_new)
        disp('A')
        l_old = l_new;
        
        for t=1:k
            big_matrix = big_matrix_fixed;
            curr_centroid = centroids(:,t);
            big_matrix = big_matrix - curr_centroid(:, ones(1, user_no));
            big_matrix = abs(big_matrix);
            dist(t,:) = sum(big_matrix,1);
        end
        
        [~,l_new] = min(dist,[],1);

        for t=1:k
            big_matrix = big_matrix_fixed(:,l_new==t);
            if(size(big_matrix,2) ~= 0)
                centroids(:,t) = sum(big_matrix,2)./size(big_matrix,2);    
            else
                disp('000 0 0 0 0 0 0s?f?r ')
            end 
        end
    end
    labels = l_new;
end