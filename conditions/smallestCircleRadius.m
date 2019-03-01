function smallestRadius = smallestCircleRadius(p1, p2, p3)
% SMALLESTCIRCLERADIUS Returns the radius of the smallest circle
% containing three points which are given as input.

% OUTPUTS:
%   * smallestRadius = radius of the smallest circle
% INPUTS:
%   * p1 = coordinates [x y] of first data point
%   * p2 = coordinates [x y] of second data point
%   * p3 = coordinates [x y] of third data point

% The smallest circle containing three points has either all points on
% the boundary or has two points on the boundary defining the diameter of
% the circle (see "Smallest-circle problem").

smallestRadius = inf;

% Test if smallest circle is defined by p1 and p2 (and contains p3):
c = (p1 + p2)/2; % Center point of circle
r = norm(p2 - p1)/2; % Radius of circle
if (p3(1) - c(1))^2 + (p3(2) - c(2))^2 <= r^2
    smallestRadius = min(smallestRadius,r);
end

% Test if smallest circle is defined by p1 and p3 (and contains p2):
c = (p1 + p3)/2; % Center point of circle
r = norm(p3 - p1)/2; % Radius of circle
if (p2(1) - c(1))^2 + (p2(2) - c(2))^2 <= r^2
    smallestRadius = min(smallestRadius,r);
end

% Test if smallest circle is defined by p2 and p3 (and contains p1):
c = (p2 + p3)/2; % Center point of circle
r = norm(p3 - p2)/2; % Radius of circle
if (p1(1) - c(1))^2 + (p1(2) - c(2))^2 <= r^2
    smallestRadius = min(smallestRadius,r);
end

% Test if smallest circle has all points on boundary:
A = [2*(p2(1)-p1(1)) 2*(p2(2)-p1(2)); ...
    2*(p3(1)-p1(1)) 2*(p3(2)-p1(2))];
if (det(A) > 0)
    b = [p2(1)^2 - p1(1)^2 + p2(2)^2 - p1(2)^2; ...
        p3(1)^2 - p1(1)^2 + p3(2)^2 - p1(2)^2];
    c = A\b;
    r = sqrt((p1(1) - c(1))^2 + (p1(2) - c(2))^2);
    smallestRadius = min(smallestRadius,r);
end
end