% 1) Want an algorithm that goes through and finds the straight skeleton first. 
% 2) Then an algorithm to find the perpendiculars.  
% 3) Mountain valley/assignment
% 4) Check for degeneracy and flat foldability
% 5) optimize number of folds (move around points small amounts to reduce number of perpendicular folds?)
% 
% Take in image.  Find all vertices of shape. 
% Straight skeleton pseudo code: 
% assumption: each vertex is the intersection point of two (and only two lines)
% For each vertex: 
%   Create vectors for each line. 
%   Calculate angle between two intersecting lines.  
%   Calculate the bisecting angle  
%   Calculate the vector for the bisector.
%   Calculate intersections of all the angular bisector lines.  -> (take unit vectors, u + v is angle bisector)
%   Choose the "first" intersection of each set, adding the intersection point onto the vertex list.  
% If have hanging vertex (like inside of turtle), connect them up. 
% 

%% Step 0: Demo inputs
maxIterations = 100; %max number of turns during perpendicular calculations
epsilon = 5; %in pixels
saveFile = 'testOutput.png';

%% Step 1: Input Image
inputImage = imread('./ExampleImages/swan_dd_300.gif');
f = figure; imagesc(inputImage);
[cutVertices.x,cutVertices.y] = getpts(f);

%% Step 2: Generate image straight skeleton 
[straightSkeleton] = generateStraightSkeleton(cutVertices); 

%% Step 3: Generate image perpendiculars
[perpendiculars]= generateImagePerpendiculars(cutVertices, straightSkeleton);

%% Step 4: Assign Mountain/Valley to fold pattern
[mountains, valleys]=assignMountainValley(cutVertices, straightSkeleton, perpendiculars);

%% Plot up and save generated fold pattern
outputImage = plotFoldPattern(cutVertices, straightSkeleton, perpendiculars, mountains, valleys, saveFile);

%% Step 5: Check for degeneracy and flat foldability
[]=checkDegeneracy();
[]=checkFlatFoldabilty();

%% Step 6: (Optional) Fold Optimization Scheme, modify image points slightly to attempt to optimize the nuber of folds
[]=foldOptimization();