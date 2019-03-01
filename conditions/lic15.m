function fulfilled = lic15(x, y, e_pts, f_pts, area1, area2)
% LIC15 Checks if there exists at least one set of three data points, 
% separated by exactly e_pts and f_pts consecutive intervening points, 
% respectively, that are the vertices of a triangle with area greater than
% area1. In addition, there exist three data points (which can be the same
% or different from the three data points just mentioned) separated by
% exactly e_pts and f_pts consecutive intervening points, respectively,
% that are the vertices of a triangle with area less than area2. Both parts
% must be true for the LIC to be true.
% The condition is not met when numpoints < 5.

% OUTPUTS:
%   * fulfilled = 1 if the condition is fulfilled and 0 otherwise
% INPUTS:
%   * x = x-coordinates of data points
%   * y = y-coordinates of data points
%   * e_pts = condition parameter 
%       (e_pts >= 1, e_pts + f_pts <= numpoints - 3)
%   * f_pts = condition parameter
%       (f_pts >= 1, e_pts + f_pts <= numpoints - 3)
%   * area1 = condition parameter (area1 >= 0)
%   * area2 = condition parameter (area2 >= 0)

if area1 < 0
    error('area1 must satisfy area1 >= 0')
end
if area2 < 0
    error('area2 must satisfy area2 >= 0')
end
if e_pts < 0
    error('e_pts must satisfy e_pts >= 0')
end
if f_pts < 0
    error('f_pts must satisfy f_pts >= 0')
end
if e_pts + f_pts > length(x) - 3
    error('e_pts and f_pts must satisfy e_pts + f_pts <= numpoints - 3')
end

fulfilled = 0;
condition1 = 0;
condition2 = 0;

for i = 1:length(x)-2-e_pts-f_pts % Iterate through data points
    p1 = [x(i) y(i)];
    p2 = [x(i+e_pts+1) y(i+e_pts+1)];
    p3 = [x(i+e_pts+f_pts+2) y(i+e_pts+f_pts+2)];

    area = triangleArea(p1, p2, p3);
    
    if area > area1
        condition1 = 1;
    end
    
    if area < area2
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