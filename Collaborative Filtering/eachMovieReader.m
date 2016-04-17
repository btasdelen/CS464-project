function userVoteMat=eachMovieReader()
% Reads the ./Votes.txt file of the eachmovie dataset into
% a sparse matrix, whose rows indicate users and columns 
% indicte movies.
%
% FUNCTION userVoteMat=eachMovieReader(numUsersLimit)
%
% The function terminates after numUsersLimit different 
%      users are read.
%
% Guy Lebanon, June 2003

mat = load('../DATASETS/user_song_count_matrix.txt');
mat(mat(:, 3) > 5) = 6; 
userVoteMat=spconvert(mat);
userVoteMat=compressUserVoteMat(userVoteMat);
return

function userVoteMat=compressUserVoteMat(userVoteMat)
% Removes extremely unseen movies (seen by < 3 users)
% and users with few votes 
%
% FUNCTION userVoteMat=compressUserVoteMat(userVoteMat);
%
% Guy Lebanon June 2003

userVoteBinary=spones(userVoteMat);
ind=find(sum(userVoteBinary)<3);
userVoteMat(:,ind)=[];

userVoteBinary=spones(userVoteMat);
ind=find(sum(userVoteBinary,2)<4);
userVoteMat(ind,:)=[];

userVoteBinary=spones(userVoteMat);
ind=find(sum(userVoteBinary)==0);
userVoteMat(:,ind)=[];
return 
