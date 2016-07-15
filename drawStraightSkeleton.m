function [f]=drawStraightSkeleton(cutVertices,straightSkeleton)
%DRAWSTRAIGHTSKELETON - Plots up cut vertices and lines and straight skeleton vertices
%and lines.

f = figure('Name','Straight Skeleton Plot');
plot(cutVertices.x, cutVertices.y,'-ok','LineWidth',2);
hold on;
plot(straightSkeleton.vertex(:,1), straightSkeleton.vertex(:,2),'-or','LineWidth',1);
