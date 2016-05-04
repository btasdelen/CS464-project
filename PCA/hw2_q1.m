function [digit1_first_projecion, digit2_first_projecion] = hw2_q1( digit1, digit2 )
    
    digits = 0;
    load digits.mat  
    
    % 1 
    len = length(digits(labels == digit1 | labels == digit2));
    data = digits(labels == digit1 | labels == digit2, :);
    data_labels = labels(labels == digit1 | labels == digit2);
    digit1_data = data(data_labels == digit1, :);
    digit2_data = data(data_labels == digit2, :);

    % 2
    %Mean Normalization
    normalized_ones_and_zeros = data - repmat(mean(data), len, 1);

    cov_matrix = cov(normalized_ones_and_zeros);
    [eigVectors, eigVals] = eig(cov_matrix);
    eigVals = diag(eigVals);
    [sortedEigVals, indices]= sort(eigVals, 'descend');
    stem(sortedEigVals), title('Eigen Values of the Covariance Martix');
    xlabel('Count')
    ylabel('Eigen Values')
    
    % 3
    image_ones_and_zeros = permute(reshape(data, len, 20, 20), [2 3 1]);
    total_average = mean(image_ones_and_zeros, 3);
    digit_1_average = mean(image_ones_and_zeros(:, :, data_labels == digit1), 3);
    digit_2_average = mean(image_ones_and_zeros(:, :, data_labels == digit2), 3);

    figure
    imagesc(total_average), colormap(gray);
    title(sprintf('Mean Image of Dataset containing digits %d and %d', digit1, digit2))
    figure
    imagesc(digit_1_average), colormap(gray);
    title(sprintf('Mean Image of digit %d', digit1))
    figure
    imagesc(digit_2_average), colormap(gray);
    title(sprintf('Mean Image of digit %d', digit2))

    % 4
    x = 5;
    topEigVectors = eigVectors(:,indices(1:x));
    figure
    title('Images of top 5 Eigenvectors');
    for i = 1:x
%          figure
        subplot(3,2,i)
        imagesc(reshape(topEigVectors(:, i), 20, 20)), colormap(gray);
        title(sprintf('Eigenvector No: %d', i)); 
    end
    
    %5
    digit1_first_projecion = digit1_data*topEigVectors(:,1);
    digit1_second_projecion = digit1_data*topEigVectors(:,2);
    digit2_first_projecion = digit2_data*topEigVectors(:,1);
    digit2_second_projecion = digit2_data*topEigVectors(:,2);

    figure
    scatter(digit1_first_projecion, digit1_second_projecion, 'b')
    hold on
    scatter(digit2_first_projecion, digit2_second_projecion, 'r')
    legend(sprintf('Digit #1: %d', digit1), sprintf('Digit #2: %d', digit2))
    xlabel('Principel Component 1')
    ylabel('Principel Component 2')
    title('Projection of the data on first and second principel components')

end

