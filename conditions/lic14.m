function fulfilled = lic14(x, y, a_pts, b_pts, radius1, radius2)
% LIC14 Checks if there exists at least one set of three data points, 
% separated by exactly a_pts and b_pts consecutive intervening points, 
% respectively, that cannot be contained within or on a circle of radius
% radius1. In addition, there exists at least one set of three data points
% (which can be the same or different from the three data points just
% mentioned) separated by exactly a_pts and b_pts consecutive intervening
% points, respectively, that can be contained in or on a circle of radius
% radius2. Both parts must be true for the LIC to be true.
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
%   * radius2 = condition parameter (radius2 >= 0)

if radius1 < 0
    error('radius1 must satisfy radius1 >= 0')
end
if radius2 < 0
    error('radius2 must satisfy radius2 >= 0')
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
condition1 = 0;
condition2 = 0;

for i = 1:length(x)-2-a_pts-b_pts % Iterate through data points
    p1 = [x(i) y(i)];
    p2 = [x(i+a_pts+1) y(i+a_pts+1)];
    p3 = [x(i+a_pts+b_pts+2) y(i+a_pts+b_pts+2)];
    
    smallestRadius = smallestCircleRadius(p1, p2, p3);
    
    if smallestRadius > radius1
        condition1 = 1;
    end
    
    if smallestRadius <= radius2
        condition2 = 1;
    end
end

if condition1 && condition2
    fulfilled = 1;
end

% Not fulfilled when numpoints < 5.
if length(x) < 5
    fulfilled = 0;
end
end