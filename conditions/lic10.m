function fulfilled = lic10(x, y, c_pts, d_pts, epsilon)
% LIC10 Checks if there exists at least one set of three data points 
% separated by exactly c_pts and d_pts consecutive intervening points, 
% respectively, that form an angle such that:
% angle < (pi - epsilon) or angle > (pi - epsilon).
% If the first or last point (or both) coincides with the second point
% (the vertex), the angle is undefined and the LIC is not satisfied by
% those three points.
% When numpoints < 5, the condition is not met.

% OUTPUTS:
%   * fulfilled = 1 if the condition is fulfilled and 0 otherwise
% INPUTS:
%   * x = x-coordinates of data points
%   * y = y-coordinates of data points
%   * c_pts = condition parameter 
%       (c_pts >= 1, c_pts + d_pts <= numpoints - 3)
%   * d_pts = condition parameter
%       (d_pts >= 1, c_pts + d_pts <= numpoints - 3)
%   * epsilon = condition parameter (0 <= epsilon < pi)

if epsilon < 0 || epsilon >= pi
    error('epsilon must satisfy 0 <= epsilon < pi')
end
if c_pts < 0
    error('a_pts must satisfy c_pts >= 0')
end
if d_pts < 0
    error('b_pts must satisfy d_pts >= 0')
end
if c_pts + d_pts > length(x) - 3
    error('c_pts and d_pts must satisfy c_pts + d_pts <= numpoints - 3')
end

fulfilled = 0;

for i = 1:length(x)-2-c_pts-d_pts % Iterate through data points
    p1 = [x(i) y(i)];
    p2 = [x(i+c_pts+1) y(i+c_pts+1)];
    p3 = [x(i+c_pts+d_pts+2) y(i+c_pts+d_pts+2)];
    
    if (~norm(p2-p1)==0 && ~norm(p3-p2)==0)
        angle = acos(dot(p3 - p2, p2 - p1)/(norm(p3 - p2)*norm(p2 - p1)));
        
        if angle < pi - epsilon || angle > pi + epsilon
            fulfilled = 1;
        end
    end
end

% Not fulfilled when numpoints < 5.
if length(x) < 5
    fulfilled = 0;
end
end