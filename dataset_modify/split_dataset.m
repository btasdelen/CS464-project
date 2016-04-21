function [training_data, test_data] = split_dataset(table, user_nr_training)
%%
training_users = 1:user_nr_training;

training_data = table(ismember(table(:,1),training_users),:);
test_data = table(~ismember(table(:,1),training_users),:);