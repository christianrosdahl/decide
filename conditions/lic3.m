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

fulfilled = 0;
end