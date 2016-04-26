function [ accuracy ] = measure_accuracy( results, user )
%MEASURE_ACCURACY Summary of this function goes here
%   Detailed explanation goes here

    score_mult = length(results) + 1;
    norm = score_mult*(score_mult+1)/2;
    accuracy = 0;
    
    for result=results
        if ismember(result, user)
            accuracy = accuracy + score_mult;
        end
        score_mult = score_mult - 1;
    end

    accuracy = accuracy/norm;
end

