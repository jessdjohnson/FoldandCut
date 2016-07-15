function []=assignMountainValley()
%% Step 4: Assign Mountain/Valley to fold pattern

cutVertices = foldPattern.cutVertices;
straightSkeleton = foldPattern.straightSkeleton;
perpendiculars = foldPattern.perpendiculars;

valleys = zeros(100,1);
foldPattern.valleys = valleys;
mountains = zeros(100,1);
foldPattern.valleys = mountains;