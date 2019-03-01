function fulfilled = lic2(x, y, radius1)
% LIC2 Checks if there exists at least one set of three consecutive
% data points that cannot all be contained within or on
% a circle of radius1.

% OUTPUTS:
%   * fulfilled = 1 if the condition is fulfilled and 0 otherwise
% INPUTS:
%   * x = x-coordinates of data points
%   * y = y-coordinates of data points
%   * radius1 = condition parameter (radius1 >= 0)

if radius1 < 0
    error('radius1 must satisfy radius1 >= 0')
end

fulfilled = 0;

% The smallest circle containing three points has either all points on
% the boundary or has two points on the boundary defining the diameter of
% the circle (see "Smallest-circle problem").

for i = 1:length(x)-2 % Iterate through data points
    p1 = [x(i) y(i)];
    p2 = [x(i+1) y(i+1)];
    p3 = [x(i+2) y(i+2)];
    
    smallestRadius = smallestCircleRadius(p1, p2, p3);
    
    if smallestRadius > radius1
        fulfilled = 1;
    end
end
end