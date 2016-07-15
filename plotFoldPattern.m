function [foldPattern] = plotFoldPattern(foldPattern,saveFile)
%% PLOTFOLDPATTERN
cutVertices = foldPattern.cutVertices;
straightSkeleton = foldPattern.straightSkeleton;
perpendiculars = foldPattern.perpendiculars;
mountains = foldPattern.mountains;
valleys = foldPattern.valleys;
foldPattern.outputImage = zeros(100,100);

saveas(saveFile); 
