function [foldPattern]= generateImagePerpendiculars(foldPattern)
%% Step 3: Generate image perpendiculars

cutVertices = foldPattern.cutVertices;
straightSkeleton = foldPattern.straightSkeleton;

perpendiculars = zeros(100,1);
foldPattern.perpendiculars = perpendiculars;
