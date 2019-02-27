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
    x1 = x(i);
    y1 = y(i);
    x2 = x(i+n_pts-1);
    y2 = y(i+n_pts-1);
    
    if norm([x1 y1] - [x2 y2]) > 0
        m = y1 - x1*(y2-y1)/(x2-x1); % Intersection of line with y-axis.
        lineVector = [x2 y2] - [x1 y1];
        lineVector = lineVector/norm(lineVector); % Normalised line vector.
        
        for j = i+1:i+n_pts-2
            vec = [x(j) y(j)-m]; % Point vector displaced to line.
            projection = dot(vec,lineVector)*lineVector; % Proj. of vec on line.
            distVector = vec - projection;
            dist = norm(distVector); % Distance between line and point.
            largestDist = max(largestDist, dist);
        end
    else % If first and last point coincide
        for j = i+1:i+n_pts-2
            vec = [x(j) y(j)];
            dist = norm([x1 y1] - vec);
            largestDist = max(largestDist, dist);
        end
    end
end

if largestDist > dist
    fulfilled = 1;
end

end