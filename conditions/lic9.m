function fulfilled = lic9(x, y, a_pts, b_pts, radius1)
% LIC9 Checks if there exists at least one set of three data points 
% separated by exactly a_pts and b_pts consecutive intervening points, 
% respectively, that cannot be contained within or on a circle of radius
% radius1.
% The condition is not met when numpoints < 5.

% OUTPUTS:
%   * fulfilled = 1 if the condition is fulfilled and 0 otherwise
% INPUTS:
%   * x = x-coordinates of data points
%   * y = y-coordinates of data points
%   * a_pts = condition parameter 
%       (a_pts >= 1, a_pts + b_pts <= numpoints - 3)
%   * b_pts = condition parameter
%       (b_pts >= 1, a_pts + b_pts <= numpoints - 3)
%   * radius1 = condition parameter (radius1 >= 0)

if radius1 < 0
    error('radius1 must satisfy radius1 >= 0')
end
if a_pts < 0
    error('a_pts must satisfy a_pts >= 0')
end
if b_pts < 0
    error('b_pts must satisfy b_pts >= 0')
end
if a_pts + b_pts > length(x) - 3
    error('a_pts and b_pts must satisfy a_pts + b_pts <= numpoints - 3')
end

fulfilled = 0;

% The smallest circle containing three points has either all points on
% the boundary or has two points on the boundary defining the diameter of
% the circle (see "Smallest-circle problem").

for i = 1:length(x)-2-a_pts-b_pts % Iterate through data points
    p1 = [x(i) y(i)];
    p2 = [x(i+a_pts+1) y(i+a_pts+1)];
    p3 = [x(i+a_pts+b_pts+2) y(i+a_pts+b_pts+2)];
    
    smallestRadius = smallestCircleRadius(p1, p2, p3);
    
    if smallestRadius > radius1
        fulfilled = 1;
    end
end

% Not fulfilled when numpoints < 5.
if length(x) < 5
        fulfilled = 0;
end
end