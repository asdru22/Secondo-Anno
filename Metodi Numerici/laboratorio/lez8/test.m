close all
clear all
sppbez_draw
% Get user input for points
numPoints = input('Enter the number of points you want to select: ');
disp('Click on the figure to select points.');

% Use ginput to get coordinates
[x, y] = ginput(numPoints);

% Display the selected points
disp('Selected Points:');
disp([x, y]);