function fulfilled = lic10(x, y, b_pts, c_pts, epsilon)
% LIC10 Checks if there exists at least one set of three data points 
% separated by exactly b_pts and c_pts consecutive intervening points, 
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

fulfilled = 0;
end