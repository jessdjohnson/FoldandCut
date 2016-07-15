function [foldPattern]=checkDegeneracy(foldPattern)
%% Step 5: Check for degeneracy
cutVertices = foldPattern.cutVertices;
straightSkeleton = foldPattern.straightSkeleton;
perpendiculars = foldPattern.perpendiculars;
mountains = foldPattern.mountains;
valleys = foldPattern.valleys;

foldPattern.degeneracyFlag = 0;