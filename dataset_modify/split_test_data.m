table = load_dataset('DATASETS');
%%
training_users = randperm(110000,7000)';

training_data = table(ismember(table(:,1),training_users),:);
test_data = table(~ismember(table(:,1),training_users),:);