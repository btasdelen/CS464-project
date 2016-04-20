sparse_mat = eachMovieReader();
numNonActive=size(sparse_mat,1)-20000;
[activeMat,otherMat]=splitUsers(sparse_mat,20000,numNonActive);
%%
<<<<<<< HEAD
[pred,meanPred] = predictPreferencePD( A, otherMat,10,1);
=======
[pred,meanPred] = predictPreferencePD( activeMat(1,:), otherMat(1:end/16,:),2,0.2);
>>>>>>> feature/collab
