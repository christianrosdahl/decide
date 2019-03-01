function dist = pointLineDist(p, p1, p2)
% POINTLINEDIST Returns the distance between the point p and the line
% containing the points p1 and p2.
% If p1 and p2 coincide, the smallest distance between p and p1 = p2 and p
% is returned.

% OUTPUTS:
%   * dist = distance from the point p to the line containing the points
%       p1 and p2.
% INPUTS:
%   * p = coordinates [x y] of the point
%   * p1 = coordinates [x y] of one point on the line
%   * p2 = coordinates [x y] of a second point on the line

% Augment vectors to 3D:
p = [p 0];
p1 = [p1 0];
p2 = [p2 0];

lineVec = (p2 - p1); % Vector defining the line.

if norm(lineVec) > 0 % If p1 and p2 do not coincide.
    lineVec = lineVec/norm(lineVec); % Normalise line vector.
    v = p - p1;

    % The cross product between v and lineVec gives a vector whose
    % length is equal to the area of the parallelogram defined by
    % these vectors. This area is also the base of
    % the parallelogram -- given by the unit vector v --
    % times the height, which is the sought distance to the point.
    % Thus, the cross product yields the distance from the line to
    % the point when v is a unit vector.
    dist = norm(cross(v,lineVec)); % Distance between line and point.
else % If p1 and p2 do coincide.
    dist = norm(p1 - p);
end
end