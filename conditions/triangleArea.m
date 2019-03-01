function area = triangleArea(p1, p2, p3)
% triangleArea Returns the area of the triangle with vertices given by the
% three planar points p1, p2 and p3.

% OUTPUTS:
%   * area = area of the triangle with vertices p1, p2 and p3
% INPUTS:
%   * p1 = coordinates [x y] of first data point
%   * p2 = coordinates [x y] of second data point
%   * p3 = coordinates [x y] of third data point

vec1 = p2 - p1; % Vector describing one edge of the triangle
vec2 = p3 - p2; % Vector describing the other edge of the triangle

area = abs(det([vec1; vec2]))/2;
end