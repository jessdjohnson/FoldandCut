function perpendicularsFigHandle = drawImagePerpendiculars(cutVertices,...
    perpendiculars,straightSkeletonFigHandle)
%%DRAWIMAGEPERPENDICULARS - function to plot up image perpendiculars.
%%Optionally on figure with cutVertices and straightSkeleton from earlier
%%in demo

if size(varargin) < 3
    perpendicularsFigHandle = figure('Name','Cut Line with Image Perpendiculars');
    plot(cutVertices,'-ok','LineWidth',2);
else
    perpendicularsFigHandle = straightSkeletonFigHandle;
    figure(straightSkeletonFigHandle); 
end
hold on;
plot(perpendiculars,'--ok','LineWidth',1);