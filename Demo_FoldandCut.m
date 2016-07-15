% 1) Want an algorithm that goes through and finds the straight skeleton first. 
% 2) Then an algorithm to find the perpendiculars.  
% 3) Mountain valley/assignment
% 4) Check for degeneracy and flat foldability
% 5) optimize number of folds (move around points small amounts to reduce number of perpendicular folds?)
% 
% Take in image.  Find all vertices of shape. 
% 

%% Step 0: Demo inputs
maxIterations = 100; %max number of turns during perpendicular calculations
epsilon = 5; %in pixels
saveFile = 'testOutput.png';

%% Step 1: Input Image
%inputImage = imread('./ExampleImages/swan_dd_300.gif');
%f = figure; imagesc(inputImage);
%disp('Click on the vertices of the cut outline in order.  Hit enter when done.');
%[foldPattern.cutVertices.x,foldPattern.cutVertices.y] = getpts(f);
load('swanpts.mat');

%% Step 2: Generate image straight skeleton 
[foldPattern.straightSkeleton] = generateStraightSkeleton(foldPattern.cutVertices); 
foldPattern.straightSkeleton.figHandle = drawStraightSkeleton(foldPattern.cutVertices,foldPattern.straightSkeleton);

%% Step 3: Generate image perpendiculars
[foldPattern]= generateImagePerpendiculars(foldPattern);
foldPattern.perpendiculars.figHandle = drawImagePerpendiculars(foldPattern.cutVertices,...
    foldPattern.perpendiculars,foldPattern.straightSkeleton.figHandle);

%% Step 4: Assign Mountain/Valley to fold pattern
[foldPattern]=assignMountainValley(foldPattern);

%% Plot up and save generated fold pattern
[foldPattern] = plotFoldPattern(foldPattern, saveFile);
figure; imagesc(foldPattern.outputImage);

%% Step 5: Check for degeneracy and flat foldability
[foldPattern]=checkDegeneracy(foldPattern);
if foldPattern.degeneracyFlag == 1
    disp('Error: Code output a degenerate fold pattern.  Please try again.');
end

[foldPattern]=checkFlatFoldabilty(foldPattern);
if foldPattern.flatFoldabilityFlag ~= 1
    disp('Error: Code output a non flat-foldable pattern.  Please try again.');
end
%% Step 6: (Optional) Fold Optimization Scheme, modify image points slightly to attempt to optimize the nuber of folds
[optimizedFoldPattern]=foldOptimization(foldPattern);