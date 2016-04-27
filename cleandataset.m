% prev = data_table(1,:);
% curr = data_table(2,:);
% 
% for n=2:size(data_table,1)
%     prev = data_table(n-1,:);
%     curr = data_table(n,:);
%     
%     if curr(1)~=prev(1)
%         data_table(n,1) = prev(1)+1;
%     end
%     
% end

songs = unique(cleaner_data_table(:,2));
k = 0;
for user=songs'
    k=k+1;
    cleaner_data_table(cleaner_data_table(:,2) == user, 2) = k;
end