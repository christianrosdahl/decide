function fulfilled = lic3(x, y, epsilon)
% LIC3 Checks if there exists at least one set of three consecutive
% data points which form an angle such that:
% angle < (pi - epsilon) or angle > (pi - epsilon).
% If the first or last point (or both) coincides with the second point
% (the vertex), the angle is undefined and the LIC is not satisfied by
% those three points.

% OUTPUTS:
%   * fulfilled = 1 if the condition is fulfilled and 0 otherwise
% INPUTS:
%   * x = x-coordinates of data points
%   * y = y-coordinates of data points
%   * epsilon = condition parameter (0 <= epsilon < pi)

if epsilon < 0 || epsilon >= pi
    error('epsilon must satisfy 0 <= epsilon < pi')
end

fulfilled = 0;

for i = 1:length(x)-2 % Iterate through data points
    p1 = [x(i) y(i)];
    p2 = [x(i+1) y(i+1)];
    p3 = [x(i+2) y(i+2)];
    
    angle = acos(dot(p3 - p2, p2 - p1)/(norm(p3 - p2)*norm(p2 - p1)));
    
    if angle < pi - epsilon || angle > pi + epsilon
        fulfilled = 1;
    end
end
end