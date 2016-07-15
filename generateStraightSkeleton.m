function [straightSkeleton] = generateStraightSkeleton(cutVertices)
%%GENERATESTRAIGHTSKELETON - Function to take in an input image and 
%
% Inputs: cutVertices.x, cutVertices.y
%
% Outputs: straightSkeleton
%
% J.Johnson, 07/05/2016
%

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

numVertices = size(cutVertices.x,1);
for i=1:numVertices
   %for each vertex 2:end-1, calculate the vectors to the neighboring vertices
   if i == 1    
        cutVertices.vec1 = [cutVertices.x(i) - cutVertices.x(end);...
              cutVertices.y(i) - cutVertices.y(end)];
        cutVertices.vec2 = [cutVertices.x(i+1) - cutVertices.x(i);...
              cutVertices.y(i+1) - cutVertices.y(i)];
   elseif i == numVertices
       cutVertices.vec1 = [cutVertices.x(i) - cutVertices.x(i-1);...
              cutVertices.y(i) - cutVertices.y(i-1)];
       cutVertices.vec2 = [cutVertices.x(1) - cutVertices.x(i);...
              cutVertices.y(1) - cutVertices.y(i)];
   else
       cutVertices.vec1 = [cutVertices.x(i) - cutVertices.x(i-1);...
              cutVertices.y(i) - cutVertices.y(i-1)];
       cutVertices.vec2 = [cutVertices.x(i+1) - cutVertices.x(i);...
              cutVertices.y(i+1) - cutVertices.y(i)]; 
   end
   %calculate unit vector form of these vectors
   cutVertices.uvec1 = cutVertices.vec1./norm(cutVertices.vec1);
   cutVertices.uvec2 = cutVertices.vec2./norm(cutVertices.vec2);
   %vector for angular bisector of these two vectors will be the combo of
   %the two unit vectors (parrallelogram proof)
   cutVertices.vecAngularBisector = cutVertices.uvec1 + cutVertices.uvec2;
end

%% check for intersections of angular bisectors (how? check nearest neighbors first)
vertexSeperations = zeros(numVertices);
for i=1:numVertices
    temp = [cutVertices.x(1:end) - cutVertices.x(i), cutVertices.y(1:end) - cutVertices.y(i)];
    for j=1:length(temp)
        vertexSeperations(i,j) = norm(temp(j,:),1);
        if i == j
            vertexSeperations(i,j) = inf;
        end
    end
    clear temp;
end

minx = min(cutVertices.x);
maxy = max(cutVertices.y);
miny = min(cutVertices.y);
maxx = max(cutVertices.x);
   
newVertexCounter = 1;
for i=1:numVertices
   [c,indx]=sort(vertexSeperations(i,:));
   
   %check three nearest neighbors for angular bisector intersection points.
   % Store them, and then calculate the distance from vector to
   % intersection point.  We want the nearest intersection point or points
   % where the most neighbor lines intersect
   
   %NOTE: NEED TO ADD THE ABOVE LOGIC, AM SKIPPING THIS, COME BACK TO IT
   %LATER
    straightSkeleton.vertex(newVertexCounter,1) = minx + (maxx-minx).*rand(1,1);
    straightSkeleton.vertex(newVertexCounter,2) = miny + (maxy-miny).*rand(1,1);

    newVertexCounter = newVertexCounter + 1;
end
