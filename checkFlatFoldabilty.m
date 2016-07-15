function [foldPattern]=checkFlatFoldabilty(foldPattern)

cutVertices = foldPattern.cutVertices;
straightSkeleton = foldPattern.straightSkeleton;
perpendiculars = foldPattern.perpendiculars;
mountains = foldPattern.mountains;
valleys = foldPattern.valleys;
foldPattern.flatFoldabilityFlag = 1;