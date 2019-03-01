function fulfilled = lic7(x, y, n_pts, dist)
% LIC7 Checks if there exists at least one set of n_pts consecutive
% data points such that at least one of the points lies a distance greater
% than dist from the line joining the first and last of these n_pts points.
% If the first and last points of these n_pts are identical, then the
% calculated distance to compare with dist will be the distance from the
% coincident point to all other points of the n_pts consecutive points.
% The condition is not met when numpoints < 3.

% OUTPUTS:
%   * fulfilled = 1 if the condition is fulfilled and 0 otherwise
% INPUTS:
%   * x = x-coordinates of data points
%   * y = y-coordinates of data points
%   * n_pts = condition parameter (3 <= n_pts <= numpoints)
%   * dist = condition parameter (dist >= 0)

fulfilled = 0;  

if n_pts < 3 || n_pts > length(x)
    error('n_pts must satisfy 3 <= n_pts <= numpoints')
end
if dist < 0
    error('dist must satisfy dist >= 0')
end

largestDist = 0;
for i = 1:length(x)-n_pts+1 % Iterate through data points
    p1 = [x(i) y(i) 0]; % First point on line (described in 3D).
    p2 = [x(i+n_pts-1) y(i+n_pts-1) 0]; % Second point on line (in 3D).
    lineVec = (p2 - p1); % Vector defining the line.
    
    if norm(lineVec) > 0
        lineVec = lineVec/norm(lineVec); % Normalise line vector.
        for j = i+1:i+n_pts-2
            point = [x(j) y(j) 0]; % Point vector (in 3D).
            v = point - p1;
            
            % The cross product between v and lineVec gives a vector whose
            % length is equal to the area of the parallelogram defined by 
            % these vectors. This area is also the base of 
            % the parallelogram -- given by the unit vector v --
            % times the height, which is the sought distance to the point.
            % Thus, the cross product yields the distance from the line to
            % the point when v is a unit vector.
            dist = norm(cross(v,lineVec)); % Distance between line and point.
            largestDist = max(largestDist, dist);
        end
    else % If p1 and p2 coincide
        for j = i+1:i+n_pts-2
            point = [x(j) y(j)];
            dist = norm(p1(1:2) - point);
            largestDist = max(largestDist, dist);
        end
    end
end

if largestDist > dist
    fulfilled = 1;
end

if length(x) < 3
    fulfilled = 0;
end
end