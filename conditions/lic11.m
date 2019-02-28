function fulfilled = lic11(x, y, e_pts, f_pts, area1)
% LIC11 Checks if there exists at least one set of three data points 
% separated by exactly e_pts and f_pts consecutive intervening points, 
% respectively, that are the vertices of a triangle with area greater than
% area1.
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

if area1 < 0
    error('area1 must satisfy area1 >= 0')
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

for i = 1:length(x)-2-e_pts-f_pts % Iterate through data points
    p1 = [x(i) y(i)];
    p2 = [x(i+e_pts+1) y(i+e_pts+1)];
    p3 = [x(i+e_pts+f_pts+2) y(i+e_pts+f_pts+2)];
    vec1 = p2 - p1;
    vec2 = p3 - p2;
    
    area = abs(det([vec1; vec2]))/2;
    
    if area > area1
        fulfilled = 1;
    end
end

% Not fulfilled when numpoints < 5.
if length(x) < 5
    fulfilled = 0;
end
end